package paskisoc

import spinal.core._
import spinal.lib.IMasterSlave

case class DDR3_Interface() extends Bundle with IMasterSlave {

  val O_ddr_addr = Bits(13 bits)
  val O_ddr_ba = Bits(3 bits)
  val O_ddr_cs_n = Bool()
  val O_ddr_ras_n = Bool()
  val O_ddr_cas_n = Bool()
  val O_ddr_we_n = Bool()
  val O_ddr_clk = Bool()
  val O_ddr_clk_n = Bool()
  val O_ddr_cke = Bool()
  val O_ddr_odt = Bool()
  val O_ddr_reset_n = Bool()
  val O_ddr_dqm = Bits(2 bits)
  val IO_ddr_dq = Bits(16 bits)
  val IO_ddr_dqs = Bits(2 bits)
  val IO_ddr_dqs_n = Bits(2 bits)

  override def asMaster() : Unit = {
    out(O_ddr_addr, O_ddr_ba, O_ddr_cs_n, O_ddr_ras_n, O_ddr_cas_n, O_ddr_we_n, O_ddr_clk, O_ddr_clk_n, O_ddr_cke, O_ddr_odt, O_ddr_reset_n, O_ddr_dqm)
    inout(IO_ddr_dq, IO_ddr_dqs, IO_ddr_dqs_n)
  }

}
