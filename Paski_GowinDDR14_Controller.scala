package paskisoc

import spinal.core._
import spinal.lib.{Stream, StreamFifoCC, master, slave}

object Paski_GowinDDR_CMDTYPE extends SpinalEnum {
  val read, write = newElement()
}

case class Paski_GowinDDR_PayloadCMD[T <: Data](addrlen: Int, burstlen: Int, contextType : T) extends Bundle {
  val cmdtype = Paski_GowinDDR_CMDTYPE()
  val addr = UInt(addrlen bits)
  val burst_cnt = UInt(burstlen bits)
  val wr_data = Bits(128 bits)
  val wr_mask = Bits(16 bits)
  val context = cloneOf(contextType)
}

case class Paski_GowinDDR_PayloadRSP[T <: Data](contextType : T) extends Bundle {
  val rsp_data = Bits(128 bits)
  val context = cloneOf(contextType)
}

case class Paski_GowinDDR14_Controller[T <: Data](sys_clk: ClockDomain, ddr_ref_clk: ClockDomain, addrlen: Int = 27, burstlen: Int = 6, fifo_length: Int = 32, contextType : T) extends Component{

  val sys_clk_inst = sys_clk
  val ddr_ref_clk_inst = ddr_ref_clk

  val io = new Bundle() {
    val app_burst_number = out UInt(burstlen bits)
    val cmd_ready = in Bool()
    val cmd = out Bits(3 bits)
    val cmd_en = out Bool()
    val addr = out UInt (addrlen bits)
    val wr_data_rdy = in Bool()
    val wr_data = out Bits(128 bits)
    val wr_data_en = out Bool()
    // val wr_data_end = out Bool() // not use due to 1:4 mode
    val wr_data_mask = out Bits(16 bits)
    val rd_data = in Bits(128 bits)
    val rd_data_valid = in Bool()
    // val rd_data_end = in Bool() // not use due to 1:4 mode
    val init_calib_complete = in Bool()

    val ddr_cmd = slave(Stream(Paski_GowinDDR_PayloadCMD(addrlen, burstlen, contextType)))
    val ddr_rsp = master(Stream(Paski_GowinDDR_PayloadRSP(contextType)))
  }

  val cmd_fifo = new StreamFifoCC(
    dataType = Paski_GowinDDR_PayloadCMD(addrlen, burstlen, contextType),
    depth = fifo_length,
    pushClock = sys_clk,
    popClock = ddr_ref_clk
  )

  val rsp_fifo = new StreamFifoCC(
    dataType = Paski_GowinDDR_PayloadRSP(contextType),
    depth = fifo_length,
    pushClock = ddr_ref_clk,
    popClock = sys_clk
  )

  val sys_area = new ClockingArea(sys_clk) {
    io.ddr_cmd >> cmd_fifo.io.push
    io.ddr_rsp << rsp_fifo.io.pop
  }

  val ddr_control_area = new ClockingArea(ddr_ref_clk) {
    val cmd_free = Reg(Bool()) init True
    val cmd_can_send = RegNext(io.cmd_ready & io.wr_data_rdy & io.init_calib_complete) init False
    val cmd_trigger = Reg(Bool()) init False
    val cmd_en = cmd_trigger
    val burst_cnt = Reg(UInt((burstlen + 1) bits)) init 0

    val rd_fire = io.rd_data_valid
    val wr_fire = io.wr_data_en & io.wr_data_rdy
    val data_fire = rd_fire | wr_fire

    cmd_fifo.io.pop.ready := cmd_free & cmd_can_send
    when(cmd_fifo.io.pop.fire) {
      cmd_free.clear()
      cmd_trigger.set()
      burst_cnt := 0
    }
    when(data_fire) {
      burst_cnt := burst_cnt + 1
    }
    when(cmd_en) {
      cmd_trigger.clear()
    }
    val cmd = RegNextWhen(cmd_fifo.io.pop.payload, cmd_fifo.io.pop.fire)
    cmd.burst_cnt init 1
    when(burst_cnt === cmd.burst_cnt +^ 1) {
      cmd_free.setWhen(cmd_free === False)
    }

    io.cmd_en := cmd_en
    io.app_burst_number := cmd.burst_cnt
    io.addr := cmd.addr
    io.wr_data := cmd.wr_data
    io.wr_data_mask := cmd.wr_mask
    when(cmd.cmdtype === Paski_GowinDDR_CMDTYPE.read) {
      io.cmd := B"001"
      io.wr_data_en := False
    }.otherwise { // write
      io.cmd := B"000"
      io.wr_data_en := (burst_cnt =/= cmd.burst_cnt +^ 1) & io.wr_data_rdy
    }

    rsp_fifo.io.push.valid := io.rd_data_valid
    rsp_fifo.io.push.payload.rsp_data := io.rd_data
    rsp_fifo.io.push.payload.context := cmd.context
  }


}
