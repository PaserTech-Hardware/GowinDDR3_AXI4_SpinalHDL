package paskisoc

import spinal.core._
import spinal.lib.bus.amba4.axi.Axi4Shared
import spinal.lib.{master, slave}

case class Paski_GowinDDR_AXI4(sys_clk: ClockDomain, mem_clk: ClockDomain) extends Component{

  val gowin_DDR3 = Gowin_DDR3(
    sys_clk,
    mem_clk
  )
  val ddr_ref_clk = gowin_DDR3.clk_out

  val axiController = Paski_GowinDDR_AXI4WithCache(
    sys_clk, 32, 27, 4
  )

  val controller = Paski_GowinDDR14_Controller(
    sys_clk,
    ddr_ref_clk,
    contextType = axiController.context_type,
    fifo_length = 4
  )

  val io = new Bundle() {
    val pll_lock = in Bool()
    val axi = slave(Axi4Shared(axiController.axiConfig))
    val ddr_iface = master(DDR3_Interface())
  }

  val sys_area = new ClockingArea(sys_clk) {
    axiController.io.ddr_cmd >> controller.io.ddr_cmd
    axiController.io.ddr_rsp << controller.io.ddr_rsp

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
