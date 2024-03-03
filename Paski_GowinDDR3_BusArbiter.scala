package paskisoc

import spinal.core._
import spinal.lib.{Stream, master, slave}

case class Paski_GowinDDR3_Bus[T <: Data](addrlen: Int = 27, burstlen: Int = 6, contextType : T) extends Bundle {
  val cmd = master(Stream(Paski_GowinDDR_PayloadCMD(addrlen, burstlen, contextType)))
  val rsp = slave(Stream(Paski_GowinDDR_PayloadRSP(contextType)))
}

case class Paski_GowinDDR3_Bus_Device[T <: Data](addrlen: Int = 27, burstlen: Int = 6, contextType : T) extends Bundle {
  val cmd = slave(Stream(Paski_GowinDDR_PayloadCMD(addrlen, burstlen, contextType)))
  val rsp = master(Stream(Paski_GowinDDR_PayloadRSP(contextType)))
}

case class Paski_GowinDDR3_BusArbiter_Context[T <: Data](contextType : T) extends Bundle {
  val devid = UInt(1 bits)
  val other = cloneOf(contextType)
}

case class Paski_GowinDDR3_BusArbiter[T <: Data](sys_clk: ClockDomain, addrlen: Int = 27, burstlen: Int = 6, contextType : T) extends Component{

  val bus_context = Paski_GowinDDR3_BusArbiter_Context(contextType)

  val io = new Bundle {
    val bus_ddr = Paski_GowinDDR3_Bus(addrlen, burstlen, bus_context)
    val bus_device_1 = Paski_GowinDDR3_Bus_Device(addrlen, burstlen, contextType)
    val bus_device_2 = Paski_GowinDDR3_Bus_Device(addrlen, burstlen, contextType)
  }

  val DEVID_BUS_1 = 0
  val DEVID_BUS_2 = 1

  val area = new ClockingArea(sys_clk) {

    val device1_ready = Reg(Bool) init(False)
    val device1_cmd_payload = Reg(Paski_GowinDDR_PayloadCMD(addrlen, burstlen, contextType))
    val device2_ready = Reg(Bool) init(False)
    val device2_cmd_payload = Reg(Paski_GowinDDR_PayloadCMD(addrlen, burstlen, contextType))

    when(io.bus_device_1.cmd.fire) {
      device1_ready := True
      device1_cmd_payload := io.bus_device_1.cmd.payload
    }
    when(io.bus_device_2.cmd.fire) {
      device2_ready := True
      device2_cmd_payload := io.bus_device_2.cmd.payload
    }

    io.bus_device_1.cmd.ready := ~device1_ready
    io.bus_device_2.cmd.ready := ~device2_ready

    val bus_ddr_valid = Reg(Bool) init(False)
    when(device1_ready) {
      io.bus_ddr.cmd.payload.cmdtype := device1_cmd_payload.cmdtype
      io.bus_ddr.cmd.payload.addr := device1_cmd_payload.addr
      io.bus_ddr.cmd.payload.burst_cnt := device1_cmd_payload.burst_cnt
      io.bus_ddr.cmd.payload.wr_mask := device1_cmd_payload.wr_mask
      io.bus_ddr.cmd.payload.wr_data := device1_cmd_payload.wr_data
      io.bus_ddr.cmd.payload.context.devid := DEVID_BUS_1
      io.bus_ddr.cmd.payload.context.other := device1_cmd_payload.context
    }.otherwise {
      io.bus_ddr.cmd.payload.cmdtype := device2_cmd_payload.cmdtype
      io.bus_ddr.cmd.payload.addr := device2_cmd_payload.addr
      io.bus_ddr.cmd.payload.burst_cnt := device2_cmd_payload.burst_cnt
      io.bus_ddr.cmd.payload.wr_mask := device2_cmd_payload.wr_mask
      io.bus_ddr.cmd.payload.wr_data := device2_cmd_payload.wr_data
      io.bus_ddr.cmd.payload.context.devid := DEVID_BUS_2
      io.bus_ddr.cmd.payload.context.other := device2_cmd_payload.context
    }

    when(device1_ready || device2_ready) {
      bus_ddr_valid := ~io.bus_ddr.cmd.fire
    }
    when(device1_ready) {
      when(io.bus_ddr.cmd.fire) {
        device1_ready := False
      }
    }.elsewhen(device2_ready) {
      when(io.bus_ddr.cmd.fire) {
        device2_ready := False
      }
    }

    io.bus_ddr.cmd.valid := bus_ddr_valid

    io.bus_device_1.rsp.payload.rsp_data := io.bus_ddr.rsp.payload.rsp_data
    io.bus_device_1.rsp.payload.context := io.bus_ddr.rsp.payload.context.other
    io.bus_device_2.rsp.payload.rsp_data := io.bus_ddr.rsp.payload.rsp_data
    io.bus_device_2.rsp.payload.context := io.bus_ddr.rsp.payload.context.other
    switch(io.bus_ddr.rsp.payload.context.devid) {
      is(DEVID_BUS_1) {
        io.bus_device_1.rsp.valid := io.bus_ddr.rsp.valid
        io.bus_ddr.rsp.ready := io.bus_device_1.rsp.ready

        io.bus_device_2.rsp.valid := False
      }
      is(DEVID_BUS_2) {
        io.bus_device_2.rsp.valid := io.bus_ddr.rsp.valid
        io.bus_ddr.rsp.ready := io.bus_device_2.rsp.ready

        io.bus_device_1.rsp.valid := False
      }
    }
  }

}
