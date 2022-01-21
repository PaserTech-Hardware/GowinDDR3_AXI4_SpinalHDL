package paskisoc

import spinal.core._
import spinal.lib.master

case class Gowin_DDR3(sysclk : ClockDomain, memclk : ClockDomain) extends BlackBox {

  val io = new Bundle {
    /*
    .memory_clk(memory_clk_i), //input memory_clk
		.clk(clk_i), //input clk
		.pll_lock(pll_lock_i), //input pll_lock
		.rst_n(rst_n_i), //input rst_n
		.app_burst_number(app_burst_number_i), //input [5:0] app_burst_number
		.cmd_ready(cmd_ready_o), //output cmd_ready
		.cmd(cmd_i), //input [2:0] cmd
		.cmd_en(cmd_en_i), //input cmd_en
		.addr(addr_i), //input [26:0] addr
		.wr_data_rdy(wr_data_rdy_o), //output wr_data_rdy
		.wr_data(wr_data_i), //input [127:0] wr_data
		.wr_data_en(wr_data_en_i), //input wr_data_en
		.wr_data_end(wr_data_end_i), //input wr_data_end
		.wr_data_mask(wr_data_mask_i), //input [15:0] wr_data_mask
		.rd_data(rd_data_o), //output [127:0] rd_data
		.rd_data_valid(rd_data_valid_o), //output rd_data_valid
		.rd_data_end(rd_data_end_o), //output rd_data_end
		.sr_req(sr_req_i), //input sr_req
		.ref_req(ref_req_i), //input ref_req
		.sr_ack(sr_ack_o), //output sr_ack
		.ref_ack(ref_ack_o), //output ref_ack
		.init_calib_complete(init_calib_complete_o), //output init_calib_complete
		.clk_out(clk_out_o), //output clk_out
		.ddr_rst(ddr_rst_o), //output ddr_rst
		.burst(burst_i), //input burst
		.O_ddr_addr(O_ddr_addr_o), //output [12:0] O_ddr_addr
		.O_ddr_ba(O_ddr_ba_o), //output [2:0] O_ddr_ba
		.O_ddr_cs_n(O_ddr_cs_n_o), //output O_ddr_cs_n
		.O_ddr_ras_n(O_ddr_ras_n_o), //output O_ddr_ras_n
		.O_ddr_cas_n(O_ddr_cas_n_o), //output O_ddr_cas_n
		.O_ddr_we_n(O_ddr_we_n_o), //output O_ddr_we_n
		.O_ddr_clk(O_ddr_clk_o), //output O_ddr_clk
		.O_ddr_clk_n(O_ddr_clk_n_o), //output O_ddr_clk_n
		.O_ddr_cke(O_ddr_cke_o), //output O_ddr_cke
		.O_ddr_odt(O_ddr_odt_o), //output O_ddr_odt
		.O_ddr_reset_n(O_ddr_reset_n_o), //output O_ddr_reset_n
		.O_ddr_dqm(O_ddr_dqm_o), //output [1:0] O_ddr_dqm
		.IO_ddr_dq(IO_ddr_dq_io), //inout [15:0] IO_ddr_dq
		.IO_ddr_dqs(IO_ddr_dqs_io), //inout [1:0] IO_ddr_dqs
		.IO_ddr_dqs_n(IO_ddr_dqs_n_io) //inout [1:0] IO_ddr_dqs_n
    */
    val memory_clk = in Bool()
    val clk = in Bool()
    val pll_lock = in Bool()
    val rst_n = in Bool()
    val app_burst_number = in UInt(6 bits)
    val cmd_ready = out Bool()
    val cmd = in Bits(3 bits)
    val cmd_en = in Bool()
    val addr = in UInt (27 bits)
    val wr_data_rdy = out Bool()
    val wr_data = in Bits(128 bits)
    val wr_data_en = in Bool()
    val wr_data_end = in Bool()
    val wr_data_mask = in Bits(16 bits)
    val rd_data = out Bits(128 bits)
    val rd_data_valid = out Bool()
    val rd_data_end = out Bool()
    val sr_req = in Bool()
    val ref_req = in Bool()
    val sr_ack = out Bool()
    val ref_ack = out Bool()
    val init_calib_complete = out Bool()
    val clk_out = out Bool()
    val ddr_rst = out Bool()
    val burst = in Bool()

    val O_ddr_addr = out Bits(13 bits)
    val O_ddr_ba = out Bits(3 bits)
    val O_ddr_cs_n = out Bool()
    val O_ddr_ras_n = out Bool()
    val O_ddr_cas_n = out Bool()
    val O_ddr_we_n = out Bool()
    val O_ddr_clk = out Bool()
    val O_ddr_clk_n = out Bool()
    val O_ddr_cke = out Bool()
    val O_ddr_odt = out Bool()
    val O_ddr_reset_n = out Bool()
    val O_ddr_dqm = out Bits(2 bits)
    val IO_ddr_dq = inout Bits(16 bits)
    val IO_ddr_dqs = inout Bits(2 bits)
    val IO_ddr_dqs_n = inout Bits(2 bits)

    //val ddr_iface = master(DDR3_Interface())
  }

  def connectDDR3Interface(iface: DDR3_Interface): Unit = {
    iface.O_ddr_addr := io.O_ddr_addr
    iface.O_ddr_ba := io.O_ddr_ba
    iface.O_ddr_cs_n := io.O_ddr_cs_n
    iface.O_ddr_ras_n := io.O_ddr_ras_n
    iface.O_ddr_cas_n := io.O_ddr_cas_n
    iface.O_ddr_we_n := io.O_ddr_we_n
    iface.O_ddr_clk := io.O_ddr_clk
    iface.O_ddr_clk_n := io.O_ddr_clk_n
    iface.O_ddr_cke := io.O_ddr_cke
    iface.O_ddr_odt := io.O_ddr_odt
    iface.O_ddr_reset_n := io.O_ddr_reset_n
    iface.O_ddr_dqm := io.O_ddr_dqm
    iface.IO_ddr_dq := io.IO_ddr_dq
    iface.IO_ddr_dqs := io.IO_ddr_dqs
    iface.IO_ddr_dqs_n := io.IO_ddr_dqs_n
  }

  noIoPrefix()
  mapClockDomain(sysclk, clock = io.clk, reset = io.rst_n, resetActiveLevel = LOW)
  mapClockDomain(memclk, clock = io.memory_clk)
  setDefinitionName("DDR3_Memory_Interface_Top")

  val clk_out = ClockDomain(clock = io.clk_out, reset = io.ddr_rst, config = ClockDomainConfig(resetKind = ASYNC, resetActiveLevel = HIGH), frequency = FixedFrequency(150 MHz))

}
