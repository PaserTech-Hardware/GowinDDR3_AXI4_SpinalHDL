package paskisoc

import spinal.core._
import spinal.lib.bus.amba4.axi.{Axi4, Axi4Shared, Axi4SpecRenamer, Axi4ToAxi4Shared}
import spinal.lib.io.InOutWrapper
import spinal.lib.{master, slave}

object Generate_Paski_GowinDDR_AXI4_WithDMA_Compatible {
  def main(args: Array[String]) {
    SpinalVerilog(
      InOutWrapper(
        Paski_GowinDDR_AXI4_WithDMA_Compatible(
          ClockDomain.external("sys_clk", config = ClockDomainConfig(resetKind = ASYNC, resetActiveLevel = LOW)),
          ClockDomain.external("mem_clk", config = ClockDomainConfig(resetKind = ASYNC, resetActiveLevel = LOW))
        )
      )
    ).printPruned()
  }
}

case class Paski_GowinDDR_AXI4_WithDMA_Compatible(sys_clk: ClockDomain, mem_clk: ClockDomain) extends Component{
  val inst = Paski_GowinDDR_AXI4_WithDMA(sys_clk, mem_clk)
  val axiConfig = inst.axiController.axiConfig
  val context_type = inst.axiController.context_type

  val io = new Bundle() {
    val pll_lock = in Bool()
    val axi = slave(Axi4(axiConfig))
    val ddr_dma_bus = Paski_GowinDDR3_Bus_Device(contextType = context_type)
    val ddr_iface = master(DDR3_Interface())
  }

  Axi4SpecRenamer(io.axi)

  val sys_area = new ClockingArea(sys_clk) {
    inst.io.pll_lock := io.pll_lock
    inst.io.axi << Axi4ToAxi4Shared(io.axi)
    io.ddr_dma_bus <> inst.io.ddr_dma_bus
    io.ddr_iface := inst.io.ddr_iface
  }
}

case class Paski_GowinDDR_AXI4_WithDMA(sys_clk: ClockDomain, mem_clk: ClockDomain) extends Component{

  val gowin_DDR3 = Gowin_DDR3(
    sys_clk,
    mem_clk
  )
  val ddr_ref_clk = gowin_DDR3.clk_out

  val axiController = Paski_GowinDDR_AXI4WithCache(
    sys_clk, 32, 27, 4
  )

  val busArbiter = Paski_GowinDDR3_BusArbiter(
    sys_clk,
    contextType = axiController.context_type
  )

  val controller = Paski_GowinDDR14_Controller(
    sys_clk,
    ddr_ref_clk,
    contextType = busArbiter.bus_context,
    fifo_length = 4
  )

  val io = new Bundle() {
    val pll_lock = in Bool()
    val axi = slave(Axi4Shared(axiController.axiConfig))
    val ddr_dma_bus = Paski_GowinDDR3_Bus_Device(contextType = axiController.context_type)
    val ddr_iface = master(DDR3_Interface())
  }

  val sys_area = new ClockingArea(sys_clk) {
    busArbiter.io.bus_ddr.cmd >/-> controller.io.ddr_cmd
    busArbiter.io.bus_ddr.rsp <-/< controller.io.ddr_rsp

    io.ddr_dma_bus.cmd >/-> busArbiter.io.bus_device_1.cmd
    io.ddr_dma_bus.rsp <-/< busArbiter.io.bus_device_1.rsp

    axiController.io.ddr_cmd >/-> busArbiter.io.bus_device_2.cmd
    axiController.io.ddr_rsp <-/< busArbiter.io.bus_device_2.rsp

    io.axi.sharedCmd >> axiController.io.axi.sharedCmd
    io.axi.writeData >> axiController.io.axi.writeData
    io.axi.writeRsp << axiController.io.axi.writeRsp
    io.axi.readRsp  << axiController.io.axi.readRsp

    gowin_DDR3.io.sr_req := False
    gowin_DDR3.io.ref_req := False
    gowin_DDR3.io.burst := True
    gowin_DDR3.io.pll_lock := io.pll_lock
    gowin_DDR3.io.app_burst_number := controller.io.app_burst_number
    gowin_DDR3.io.cmd := controller.io.cmd
    gowin_DDR3.io.cmd_en := controller.io.cmd_en
    gowin_DDR3.io.addr := controller.io.addr
    gowin_DDR3.io.wr_data := controller.io.wr_data
    gowin_DDR3.io.wr_data_en := controller.io.wr_data_en
    gowin_DDR3.io.wr_data_end := controller.io.wr_data_en
    gowin_DDR3.io.wr_data_mask := controller.io.wr_data_mask
    controller.io.cmd_ready := gowin_DDR3.io.cmd_ready
    controller.io.wr_data_rdy := gowin_DDR3.io.wr_data_rdy
    controller.io.rd_data := gowin_DDR3.io.rd_data
    controller.io.rd_data_valid := gowin_DDR3.io.rd_data_valid
    controller.io.init_calib_complete := gowin_DDR3.io.init_calib_complete

    gowin_DDR3.connectDDR3Interface(io.ddr_iface)
  }

}
