package paskisoc

import spinal.core.{RegNextWhen, _}
import spinal.lib.bus.amba4.axi.{Axi4Arw, Axi4Config, Axi4Shared}
import spinal.lib.{Stream, master, slave}

case class GowinDDRCacheAxi4SharedContext(idWidth : Int) extends Bundle{
  val id = UInt(idWidth bits)
  val last = Bool()
}

case class Paski_GowinDDR_AXI4WithCache(sys_clk: ClockDomain, dataWidth : Int, axiaddrlen : Int, idWidth : Int, addrlen: Int = 27, burstlen: Int = 6) extends Component{

  val sys_clk_inst = sys_clk

  val axiConfig = Axi4Config(
    addressWidth = axiaddrlen,
    dataWidth = dataWidth,
    idWidth = idWidth,
    useLock = false,
    useRegion = false,
    useCache = false,
    useProt = false,
    useQos = false
  )

  val context_type = UInt(1 bits)

  val io = new Bundle() {
    val axi = slave(Axi4Shared(axiConfig))

    val ddr_cmd = master(Stream(Paski_GowinDDR_PayloadCMD(addrlen, burstlen, context_type)))
    val ddr_rsp = slave(Stream(Paski_GowinDDR_PayloadRSP(context_type)))
  }

  val sys_area = new ClockingArea(sys_clk) {
    val ddr_cmd_valid = Reg(Bool()) init False
    val ddr_cmd_payload = Paski_GowinDDR_PayloadCMD(addrlen, burstlen, context_type)
    io.ddr_cmd.valid := ddr_cmd_valid
    io.ddr_cmd.payload := ddr_cmd_payload

    io.ddr_rsp.ready := True

    val cache_addr = Reg(UInt(addrlen bits)) init 0
    val cache_data = Reg(Bits(128 bits)) init 0
    val cache_dirty_bit = Reg(Bits(16 bits)) init B"16'xFFFF"

    val pageNotSame_Trigger = Reg(Bool()) init False
    val pageDirty_Trigger = Reg(Bool()) init False
    val pageDirty = cache_dirty_bit =/= B"16'xFFFF"

    val axi_unburst = io.axi.sharedCmd.unburstify

    val arwcmd_free = Reg(Bool()) init True
    val arwcmd = RegNextWhen(axi_unburst.payload, axi_unburst.fire)
    when(axi_unburst.fire) {
      arwcmd_free.clear()
      pageNotSame_Trigger.set()
      pageDirty_Trigger := pageDirty
    }
    axi_unburst.ready := arwcmd_free

    val write_data_ready = Reg(Bool()) init False
    val write_response_valid = Reg(Bool()) init False
    val read_response_valid = Reg(Bool()) init False
    io.axi.readRsp.payload.id := arwcmd.id
    io.axi.readRsp.payload.last := arwcmd.last
    io.axi.readRsp.payload.setOKAY()
    io.axi.readRsp.valid := read_response_valid

    io.axi.writeRsp.valid := write_response_valid
    io.axi.writeRsp.payload.id := arwcmd.id
    io.axi.writeRsp.payload.setOKAY()

    io.axi.writeData.ready := write_data_ready

    val pageNotSame = cache_addr((addrlen - 1) downto 4) =/= arwcmd.addr((addrlen - 1) downto 4)

    ddr_cmd_payload.addr := 0
    ddr_cmd_payload.cmdtype := Paski_GowinDDR_CMDTYPE.write
    ddr_cmd_payload.burst_cnt := 0
    ddr_cmd_payload.wr_data := cache_data
    ddr_cmd_payload.wr_mask := cache_dirty_bit
    ddr_cmd_payload.context := 0

    io.axi.readRsp.payload.data := 0

    when(arwcmd_free === False) {
      when(pageNotSame) {
        when(pageDirty_Trigger) {
          ddr_cmd_payload.addr := (cache_addr((addrlen - 1) downto 4).asBits ## B"0000").asUInt
          ddr_cmd_valid := ~io.ddr_cmd.fire
          ddr_cmd_payload.cmdtype := Paski_GowinDDR_CMDTYPE.write
          pageDirty_Trigger.clearWhen(io.ddr_cmd.fire)
        }.elsewhen(pageNotSame_Trigger) {
          ddr_cmd_payload.addr := (arwcmd.addr((addrlen - 1) downto 4).asBits ## B"0000").asUInt
          ddr_cmd_valid := ~io.ddr_cmd.fire
          ddr_cmd_payload.cmdtype := Paski_GowinDDR_CMDTYPE.read
          pageNotSame_Trigger.clearWhen(io.ddr_cmd.fire)
        }
      }.otherwise {
        when(arwcmd.write === True) {
          when(io.axi.writeData.fire) {
            switch(arwcmd.addr(3 downto 2)) {
              is(0x0) {
                var startbit = 0
                var startbit2 = 0
                var i = 0
                for( i <- 0 to 3) {
                  when(io.axi.writeData.payload.strb(i)) {
                    cache_data((i * 8 + 7 + startbit) downto (i * 8 + startbit)) := io.axi.writeData.payload.data((i * 8 + 7) downto (i * 8))
                    cache_dirty_bit(i + startbit2) := False
                  }
                }
              }
              is(0x1) {
                var startbit = 32
                var startbit2 = 4
                var i = 0
                for( i <- 0 to 3) {
                  when(io.axi.writeData.payload.strb(i)) {
                    cache_data((i * 8 + 7 + startbit) downto (i * 8 + startbit)) := io.axi.writeData.payload.data((i * 8 + 7) downto (i * 8))
                    cache_dirty_bit(i + startbit2) := False
                  }
                }
              }
              is(0x2) {
                var startbit = 64
                var startbit2 = 8
                var i = 0
                for( i <- 0 to 3) {
                  when(io.axi.writeData.payload.strb(i)) {
                    cache_data((i * 8 + 7 + startbit) downto (i * 8 + startbit)) := io.axi.writeData.payload.data((i * 8 + 7) downto (i * 8))
                    cache_dirty_bit(i + startbit2) := False
                  }
                }
              }
              default { // 0x3
                var startbit = 96
                var startbit2 = 12
                var i = 0
                for( i <- 0 to 3) {
                  when(io.axi.writeData.payload.strb(i)) {
                    cache_data((i * 8 + 7 + startbit) downto (i * 8 + startbit)) := io.axi.writeData.payload.data((i * 8 + 7) downto (i * 8))
                    cache_dirty_bit(i + startbit2) := False
                  }
                }
              }
            }
          }
          write_data_ready := ~write_response_valid
          when(io.axi.writeData.fire) {
            write_data_ready := False
            write_response_valid := True
          }
          when(io.axi.writeRsp.fire) {
            write_response_valid := False
            arwcmd_free.set()
          }
        }.otherwise { // read
          switch(arwcmd.addr(3 downto 2)) {
            is(0x0) {
              io.axi.readRsp.payload.data := cache_data(31 downto 0)
            }
            is(0x1) {
              io.axi.readRsp.payload.data := cache_data(63 downto 32)
            }
            is(0x2) {
              io.axi.readRsp.payload.data := cache_data(95 downto 64)
            }
            default { // 0x3
              io.axi.readRsp.payload.data := cache_data(127 downto 96)
            }
          }
          read_response_valid := ~io.axi.readRsp.fire
          when(io.axi.readRsp.fire) {
            arwcmd_free.set()
          }
        }
      }
    }

    when(io.ddr_rsp.fire) {
      cache_addr := (arwcmd.addr((addrlen - 1) downto 4).asBits ## B"0000").asUInt
      cache_data := io.ddr_rsp.payload.rsp_data
      cache_dirty_bit := 0
    }
  }
}
