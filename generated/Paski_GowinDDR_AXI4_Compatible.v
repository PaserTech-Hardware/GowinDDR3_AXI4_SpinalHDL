// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Paski_GowinDDR_AXI4_Compatible


`define Paski_GowinDDR_CMDTYPE_binary_sequential_type [0:0]
`define Paski_GowinDDR_CMDTYPE_binary_sequential_read 1'b0
`define Paski_GowinDDR_CMDTYPE_binary_sequential_write 1'b1


module Paski_GowinDDR_AXI4_Compatible (
  input               sys_clk_resetn,
  input               sys_clk_clk,
  input               mem_clk_clk,
  input               io_pll_lock,
  input               axi_awvalid,
  output              axi_awready,
  input      [26:0]   axi_awaddr,
  input      [3:0]    axi_awid,
  input      [7:0]    axi_awlen,
  input      [2:0]    axi_awsize,
  input      [1:0]    axi_awburst,
  input               axi_wvalid,
  output              axi_wready,
  input      [31:0]   axi_wdata,
  input      [3:0]    axi_wstrb,
  input               axi_wlast,
  output              axi_bvalid,
  input               axi_bready,
  output     [3:0]    axi_bid,
  output     [1:0]    axi_bresp,
  input               axi_arvalid,
  output              axi_arready,
  input      [26:0]   axi_araddr,
  input      [3:0]    axi_arid,
  input      [7:0]    axi_arlen,
  input      [2:0]    axi_arsize,
  input      [1:0]    axi_arburst,
  output              axi_rvalid,
  input               axi_rready,
  output     [31:0]   axi_rdata,
  output     [3:0]    axi_rid,
  output     [1:0]    axi_rresp,
  output              axi_rlast,
  output     [12:0]   io_ddr_iface_O_ddr_addr,
  output     [2:0]    io_ddr_iface_O_ddr_ba,
  output              io_ddr_iface_O_ddr_cs_n,
  output              io_ddr_iface_O_ddr_ras_n,
  output              io_ddr_iface_O_ddr_cas_n,
  output              io_ddr_iface_O_ddr_we_n,
  output              io_ddr_iface_O_ddr_clk,
  output              io_ddr_iface_O_ddr_clk_n,
  output              io_ddr_iface_O_ddr_cke,
  output              io_ddr_iface_O_ddr_odt,
  output              io_ddr_iface_O_ddr_reset_n,
  output     [1:0]    io_ddr_iface_O_ddr_dqm,
   inout     [15:0]   io_ddr_iface_IO_ddr_dq,
   inout     [1:0]    io_ddr_iface_IO_ddr_dqs,
   inout     [1:0]    io_ddr_iface_IO_ddr_dqs_n
);
  wire                inst_io_axi_arw_payload_write;
  wire                inst_io_axi_arw_ready;
  wire                inst_io_axi_w_ready;
  wire                inst_io_axi_b_valid;
  wire       [3:0]    inst_io_axi_b_payload_id;
  wire       [1:0]    inst_io_axi_b_payload_resp;
  wire                inst_io_axi_r_valid;
  wire       [31:0]   inst_io_axi_r_payload_data;
  wire       [3:0]    inst_io_axi_r_payload_id;
  wire       [1:0]    inst_io_axi_r_payload_resp;
  wire                inst_io_axi_r_payload_last;
  wire       [12:0]   inst_io_ddr_iface_O_ddr_addr;
  wire       [2:0]    inst_io_ddr_iface_O_ddr_ba;
  wire                inst_io_ddr_iface_O_ddr_cs_n;
  wire                inst_io_ddr_iface_O_ddr_ras_n;
  wire                inst_io_ddr_iface_O_ddr_cas_n;
  wire                inst_io_ddr_iface_O_ddr_we_n;
  wire                inst_io_ddr_iface_O_ddr_clk;
  wire                inst_io_ddr_iface_O_ddr_clk_n;
  wire                inst_io_ddr_iface_O_ddr_cke;
  wire                inst_io_ddr_iface_O_ddr_odt;
  wire                inst_io_ddr_iface_O_ddr_reset_n;
  wire       [1:0]    inst_io_ddr_iface_O_ddr_dqm;
  wire                streamArbiter_1_io_inputs_0_ready;
  wire                streamArbiter_1_io_inputs_1_ready;
  wire                streamArbiter_1_io_output_valid;
  wire       [26:0]   streamArbiter_1_io_output_payload_addr;
  wire       [3:0]    streamArbiter_1_io_output_payload_id;
  wire       [7:0]    streamArbiter_1_io_output_payload_len;
  wire       [2:0]    streamArbiter_1_io_output_payload_size;
  wire       [1:0]    streamArbiter_1_io_output_payload_burst;
  wire       [0:0]    streamArbiter_1_io_chosen;
  wire       [1:0]    streamArbiter_1_io_chosenOH;

  Paski_GowinDDR_AXI4 inst (
    .sys_clk_resetn                (sys_clk_resetn                           ), //i
    .sys_clk_clk                   (sys_clk_clk                              ), //i
    .mem_clk_clk                   (mem_clk_clk                              ), //i
    .io_pll_lock                   (io_pll_lock                              ), //i
    .io_axi_arw_valid              (streamArbiter_1_io_output_valid          ), //i
    .io_axi_arw_ready              (inst_io_axi_arw_ready                    ), //o
    .io_axi_arw_payload_addr       (streamArbiter_1_io_output_payload_addr   ), //i
    .io_axi_arw_payload_id         (streamArbiter_1_io_output_payload_id     ), //i
    .io_axi_arw_payload_len        (streamArbiter_1_io_output_payload_len    ), //i
    .io_axi_arw_payload_size       (streamArbiter_1_io_output_payload_size   ), //i
    .io_axi_arw_payload_burst      (streamArbiter_1_io_output_payload_burst  ), //i
    .io_axi_arw_payload_write      (inst_io_axi_arw_payload_write            ), //i
    .io_axi_w_valid                (axi_wvalid                               ), //i
    .io_axi_w_ready                (inst_io_axi_w_ready                      ), //o
    .io_axi_w_payload_data         (axi_wdata                                ), //i
    .io_axi_w_payload_strb         (axi_wstrb                                ), //i
    .io_axi_w_payload_last         (axi_wlast                                ), //i
    .io_axi_b_valid                (inst_io_axi_b_valid                      ), //o
    .io_axi_b_ready                (axi_bready                               ), //i
    .io_axi_b_payload_id           (inst_io_axi_b_payload_id                 ), //o
    .io_axi_b_payload_resp         (inst_io_axi_b_payload_resp               ), //o
    .io_axi_r_valid                (inst_io_axi_r_valid                      ), //o
    .io_axi_r_ready                (axi_rready                               ), //i
    .io_axi_r_payload_data         (inst_io_axi_r_payload_data               ), //o
    .io_axi_r_payload_id           (inst_io_axi_r_payload_id                 ), //o
    .io_axi_r_payload_resp         (inst_io_axi_r_payload_resp               ), //o
    .io_axi_r_payload_last         (inst_io_axi_r_payload_last               ), //o
    .io_ddr_iface_O_ddr_addr       (inst_io_ddr_iface_O_ddr_addr             ), //o
    .io_ddr_iface_O_ddr_ba         (inst_io_ddr_iface_O_ddr_ba               ), //o
    .io_ddr_iface_O_ddr_cs_n       (inst_io_ddr_iface_O_ddr_cs_n             ), //o
    .io_ddr_iface_O_ddr_ras_n      (inst_io_ddr_iface_O_ddr_ras_n            ), //o
    .io_ddr_iface_O_ddr_cas_n      (inst_io_ddr_iface_O_ddr_cas_n            ), //o
    .io_ddr_iface_O_ddr_we_n       (inst_io_ddr_iface_O_ddr_we_n             ), //o
    .io_ddr_iface_O_ddr_clk        (inst_io_ddr_iface_O_ddr_clk              ), //o
    .io_ddr_iface_O_ddr_clk_n      (inst_io_ddr_iface_O_ddr_clk_n            ), //o
    .io_ddr_iface_O_ddr_cke        (inst_io_ddr_iface_O_ddr_cke              ), //o
    .io_ddr_iface_O_ddr_odt        (inst_io_ddr_iface_O_ddr_odt              ), //o
    .io_ddr_iface_O_ddr_reset_n    (inst_io_ddr_iface_O_ddr_reset_n          ), //o
    .io_ddr_iface_O_ddr_dqm        (inst_io_ddr_iface_O_ddr_dqm              ), //o
    .io_ddr_iface_IO_ddr_dq        (io_ddr_iface_IO_ddr_dq                   ), //~
    .io_ddr_iface_IO_ddr_dqs       (io_ddr_iface_IO_ddr_dqs                  ), //~
    .io_ddr_iface_IO_ddr_dqs_n     (io_ddr_iface_IO_ddr_dqs_n                )  //~
  );
  StreamArbiter streamArbiter_1 (
    .io_inputs_0_valid            (axi_arvalid                              ), //i
    .io_inputs_0_ready            (streamArbiter_1_io_inputs_0_ready        ), //o
    .io_inputs_0_payload_addr     (axi_araddr                               ), //i
    .io_inputs_0_payload_id       (axi_arid                                 ), //i
    .io_inputs_0_payload_len      (axi_arlen                                ), //i
    .io_inputs_0_payload_size     (axi_arsize                               ), //i
    .io_inputs_0_payload_burst    (axi_arburst                              ), //i
    .io_inputs_1_valid            (axi_awvalid                              ), //i
    .io_inputs_1_ready            (streamArbiter_1_io_inputs_1_ready        ), //o
    .io_inputs_1_payload_addr     (axi_awaddr                               ), //i
    .io_inputs_1_payload_id       (axi_awid                                 ), //i
    .io_inputs_1_payload_len      (axi_awlen                                ), //i
    .io_inputs_1_payload_size     (axi_awsize                               ), //i
    .io_inputs_1_payload_burst    (axi_awburst                              ), //i
    .io_output_valid              (streamArbiter_1_io_output_valid          ), //o
    .io_output_ready              (inst_io_axi_arw_ready                    ), //i
    .io_output_payload_addr       (streamArbiter_1_io_output_payload_addr   ), //o
    .io_output_payload_id         (streamArbiter_1_io_output_payload_id     ), //o
    .io_output_payload_len        (streamArbiter_1_io_output_payload_len    ), //o
    .io_output_payload_size       (streamArbiter_1_io_output_payload_size   ), //o
    .io_output_payload_burst      (streamArbiter_1_io_output_payload_burst  ), //o
    .io_chosen                    (streamArbiter_1_io_chosen                ), //o
    .io_chosenOH                  (streamArbiter_1_io_chosenOH              ), //o
    .sys_clk_clk                  (sys_clk_clk                              ), //i
    .sys_clk_resetn               (sys_clk_resetn                           )  //i
  );
  assign axi_arready = streamArbiter_1_io_inputs_0_ready;
  assign axi_awready = streamArbiter_1_io_inputs_1_ready;
  assign axi_wready = inst_io_axi_w_ready;
  assign axi_bvalid = inst_io_axi_b_valid;
  assign axi_bid = inst_io_axi_b_payload_id;
  assign axi_bresp = inst_io_axi_b_payload_resp;
  assign axi_rvalid = inst_io_axi_r_valid;
  assign axi_rdata = inst_io_axi_r_payload_data;
  assign axi_rid = inst_io_axi_r_payload_id;
  assign axi_rresp = inst_io_axi_r_payload_resp;
  assign axi_rlast = inst_io_axi_r_payload_last;
  assign inst_io_axi_arw_payload_write = streamArbiter_1_io_chosenOH[1];
  assign io_ddr_iface_O_ddr_addr = inst_io_ddr_iface_O_ddr_addr;
  assign io_ddr_iface_O_ddr_ba = inst_io_ddr_iface_O_ddr_ba;
  assign io_ddr_iface_O_ddr_cs_n = inst_io_ddr_iface_O_ddr_cs_n;
  assign io_ddr_iface_O_ddr_ras_n = inst_io_ddr_iface_O_ddr_ras_n;
  assign io_ddr_iface_O_ddr_cas_n = inst_io_ddr_iface_O_ddr_cas_n;
  assign io_ddr_iface_O_ddr_we_n = inst_io_ddr_iface_O_ddr_we_n;
  assign io_ddr_iface_O_ddr_clk = inst_io_ddr_iface_O_ddr_clk;
  assign io_ddr_iface_O_ddr_clk_n = inst_io_ddr_iface_O_ddr_clk_n;
  assign io_ddr_iface_O_ddr_cke = inst_io_ddr_iface_O_ddr_cke;
  assign io_ddr_iface_O_ddr_odt = inst_io_ddr_iface_O_ddr_odt;
  assign io_ddr_iface_O_ddr_reset_n = inst_io_ddr_iface_O_ddr_reset_n;
  assign io_ddr_iface_O_ddr_dqm = inst_io_ddr_iface_O_ddr_dqm;
  assign io_ddr_iface_IO_ddr_dq = io_ddr_iface_IO_ddr_dq;
  assign io_ddr_iface_IO_ddr_dqs = io_ddr_iface_IO_ddr_dqs;
  assign io_ddr_iface_IO_ddr_dqs_n = io_ddr_iface_IO_ddr_dqs_n;

endmodule

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [26:0]   io_inputs_0_payload_addr,
  input      [3:0]    io_inputs_0_payload_id,
  input      [7:0]    io_inputs_0_payload_len,
  input      [2:0]    io_inputs_0_payload_size,
  input      [1:0]    io_inputs_0_payload_burst,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [26:0]   io_inputs_1_payload_addr,
  input      [3:0]    io_inputs_1_payload_id,
  input      [7:0]    io_inputs_1_payload_len,
  input      [2:0]    io_inputs_1_payload_size,
  input      [1:0]    io_inputs_1_payload_burst,
  output              io_output_valid,
  input               io_output_ready,
  output     [26:0]   io_output_payload_addr,
  output     [3:0]    io_output_payload_id,
  output     [7:0]    io_output_payload_len,
  output     [2:0]    io_output_payload_size,
  output     [1:0]    io_output_payload_burst,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               sys_clk_clk,
  input               sys_clk_resetn
);
  wire       [3:0]    _zz__zz_maskProposal_0_2;
  wire       [3:0]    _zz__zz_maskProposal_0_2_1;
  wire       [1:0]    _zz__zz_maskProposal_0_2_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_0;
  wire       [3:0]    _zz_maskProposal_0_1;
  wire       [3:0]    _zz_maskProposal_0_2;
  wire       [1:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_0,maskLocked_1};
  assign _zz__zz_maskProposal_0_2_1 = {2'd0, _zz__zz_maskProposal_0_2_2};
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_0 = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[3 : 2] | _zz_maskProposal_0_2[1 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge sys_clk_clk or negedge sys_clk_resetn) begin
    if(!sys_clk_resetn) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module Paski_GowinDDR_AXI4 (
  input               sys_clk_resetn,
  input               sys_clk_clk,
  input               mem_clk_clk,
  input               io_pll_lock,
  input               io_axi_arw_valid,
  output              io_axi_arw_ready,
  input      [26:0]   io_axi_arw_payload_addr,
  input      [3:0]    io_axi_arw_payload_id,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [1:0]    io_axi_arw_payload_burst,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [3:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [3:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  output     [12:0]   io_ddr_iface_O_ddr_addr,
  output     [2:0]    io_ddr_iface_O_ddr_ba,
  output              io_ddr_iface_O_ddr_cs_n,
  output              io_ddr_iface_O_ddr_ras_n,
  output              io_ddr_iface_O_ddr_cas_n,
  output              io_ddr_iface_O_ddr_we_n,
  output              io_ddr_iface_O_ddr_clk,
  output              io_ddr_iface_O_ddr_clk_n,
  output              io_ddr_iface_O_ddr_cke,
  output              io_ddr_iface_O_ddr_odt,
  output              io_ddr_iface_O_ddr_reset_n,
  output     [1:0]    io_ddr_iface_O_ddr_dqm,
   inout     [15:0]   io_ddr_iface_IO_ddr_dq,
   inout     [1:0]    io_ddr_iface_IO_ddr_dqs,
   inout     [1:0]    io_ddr_iface_IO_ddr_dqs_n
);
  wire                gowin_DDR3_cmd_ready;
  wire                gowin_DDR3_wr_data_rdy;
  wire       [127:0]  gowin_DDR3_rd_data;
  wire                gowin_DDR3_rd_data_valid;
  wire                gowin_DDR3_rd_data_end;
  wire                gowin_DDR3_sr_ack;
  wire                gowin_DDR3_ref_ack;
  wire                gowin_DDR3_init_calib_complete;
  wire                gowin_DDR3_clk_out;
  wire                gowin_DDR3_ddr_rst;
  wire       [12:0]   gowin_DDR3_O_ddr_addr;
  wire       [2:0]    gowin_DDR3_O_ddr_ba;
  wire                gowin_DDR3_O_ddr_cs_n;
  wire                gowin_DDR3_O_ddr_ras_n;
  wire                gowin_DDR3_O_ddr_cas_n;
  wire                gowin_DDR3_O_ddr_we_n;
  wire                gowin_DDR3_O_ddr_clk;
  wire                gowin_DDR3_O_ddr_clk_n;
  wire                gowin_DDR3_O_ddr_cke;
  wire                gowin_DDR3_O_ddr_odt;
  wire                gowin_DDR3_O_ddr_reset_n;
  wire       [1:0]    gowin_DDR3_O_ddr_dqm;
  wire                axiController_io_axi_arw_ready;
  wire                axiController_io_axi_w_ready;
  wire                axiController_io_axi_b_valid;
  wire       [3:0]    axiController_io_axi_b_payload_id;
  wire       [1:0]    axiController_io_axi_b_payload_resp;
  wire                axiController_io_axi_r_valid;
  wire       [31:0]   axiController_io_axi_r_payload_data;
  wire       [3:0]    axiController_io_axi_r_payload_id;
  wire       [1:0]    axiController_io_axi_r_payload_resp;
  wire                axiController_io_axi_r_payload_last;
  wire                axiController_io_ddr_cmd_valid;
  wire       `Paski_GowinDDR_CMDTYPE_binary_sequential_type axiController_io_ddr_cmd_payload_cmdtype;
  wire       [26:0]   axiController_io_ddr_cmd_payload_addr;
  wire       [5:0]    axiController_io_ddr_cmd_payload_burst_cnt;
  wire       [127:0]  axiController_io_ddr_cmd_payload_wr_data;
  wire       [15:0]   axiController_io_ddr_cmd_payload_wr_mask;
  wire       [0:0]    axiController_io_ddr_cmd_payload_context;
  wire                axiController_io_ddr_rsp_ready;
  wire       [5:0]    controller_io_app_burst_number;
  wire       [2:0]    controller_io_cmd;
  wire                controller_io_cmd_en;
  wire       [26:0]   controller_io_addr;
  wire       [127:0]  controller_io_wr_data;
  wire                controller_io_wr_data_en;
  wire       [15:0]   controller_io_wr_data_mask;
  wire                controller_io_ddr_cmd_ready;
  wire                controller_io_ddr_rsp_valid;
  wire       [127:0]  controller_io_ddr_rsp_payload_rsp_data;
  wire       [0:0]    controller_io_ddr_rsp_payload_context;

  DDR3_Memory_Interface_Top gowin_DDR3 (
    .memory_clk             (mem_clk_clk                     ), //i
    .clk                    (sys_clk_clk                     ), //i
    .pll_lock               (io_pll_lock                     ), //i
    .rst_n                  (sys_clk_resetn                  ), //i
    .app_burst_number       (controller_io_app_burst_number  ), //i
    .cmd_ready              (gowin_DDR3_cmd_ready            ), //o
    .cmd                    (controller_io_cmd               ), //i
    .cmd_en                 (controller_io_cmd_en            ), //i
    .addr                   (controller_io_addr              ), //i
    .wr_data_rdy            (gowin_DDR3_wr_data_rdy          ), //o
    .wr_data                (controller_io_wr_data           ), //i
    .wr_data_en             (controller_io_wr_data_en        ), //i
    .wr_data_end            (controller_io_wr_data_en        ), //i
    .wr_data_mask           (controller_io_wr_data_mask      ), //i
    .rd_data                (gowin_DDR3_rd_data              ), //o
    .rd_data_valid          (gowin_DDR3_rd_data_valid        ), //o
    .rd_data_end            (gowin_DDR3_rd_data_end          ), //o
    .sr_req                 (1'b0                            ), //i
    .ref_req                (1'b0                            ), //i
    .sr_ack                 (gowin_DDR3_sr_ack               ), //o
    .ref_ack                (gowin_DDR3_ref_ack              ), //o
    .init_calib_complete    (gowin_DDR3_init_calib_complete  ), //o
    .clk_out                (gowin_DDR3_clk_out              ), //o
    .ddr_rst                (gowin_DDR3_ddr_rst              ), //o
    .burst                  (1'b1                            ), //i
    .O_ddr_addr             (gowin_DDR3_O_ddr_addr           ), //o
    .O_ddr_ba               (gowin_DDR3_O_ddr_ba             ), //o
    .O_ddr_cs_n             (gowin_DDR3_O_ddr_cs_n           ), //o
    .O_ddr_ras_n            (gowin_DDR3_O_ddr_ras_n          ), //o
    .O_ddr_cas_n            (gowin_DDR3_O_ddr_cas_n          ), //o
    .O_ddr_we_n             (gowin_DDR3_O_ddr_we_n           ), //o
    .O_ddr_clk              (gowin_DDR3_O_ddr_clk            ), //o
    .O_ddr_clk_n            (gowin_DDR3_O_ddr_clk_n          ), //o
    .O_ddr_cke              (gowin_DDR3_O_ddr_cke            ), //o
    .O_ddr_odt              (gowin_DDR3_O_ddr_odt            ), //o
    .O_ddr_reset_n          (gowin_DDR3_O_ddr_reset_n        ), //o
    .O_ddr_dqm              (gowin_DDR3_O_ddr_dqm            ), //o
    .IO_ddr_dq              (IO_ddr_dq                       ), //~
    .IO_ddr_dqs             (IO_ddr_dqs                      ), //~
    .IO_ddr_dqs_n           (IO_ddr_dqs_n                    )  //~
  );
  Paski_GowinDDR_AXI4WithCache axiController (
    .io_axi_arw_valid                (io_axi_arw_valid                            ), //i
    .io_axi_arw_ready                (axiController_io_axi_arw_ready              ), //o
    .io_axi_arw_payload_addr         (io_axi_arw_payload_addr                     ), //i
    .io_axi_arw_payload_id           (io_axi_arw_payload_id                       ), //i
    .io_axi_arw_payload_len          (io_axi_arw_payload_len                      ), //i
    .io_axi_arw_payload_size         (io_axi_arw_payload_size                     ), //i
    .io_axi_arw_payload_burst        (io_axi_arw_payload_burst                    ), //i
    .io_axi_arw_payload_write        (io_axi_arw_payload_write                    ), //i
    .io_axi_w_valid                  (io_axi_w_valid                              ), //i
    .io_axi_w_ready                  (axiController_io_axi_w_ready                ), //o
    .io_axi_w_payload_data           (io_axi_w_payload_data                       ), //i
    .io_axi_w_payload_strb           (io_axi_w_payload_strb                       ), //i
    .io_axi_w_payload_last           (io_axi_w_payload_last                       ), //i
    .io_axi_b_valid                  (axiController_io_axi_b_valid                ), //o
    .io_axi_b_ready                  (io_axi_b_ready                              ), //i
    .io_axi_b_payload_id             (axiController_io_axi_b_payload_id           ), //o
    .io_axi_b_payload_resp           (axiController_io_axi_b_payload_resp         ), //o
    .io_axi_r_valid                  (axiController_io_axi_r_valid                ), //o
    .io_axi_r_ready                  (io_axi_r_ready                              ), //i
    .io_axi_r_payload_data           (axiController_io_axi_r_payload_data         ), //o
    .io_axi_r_payload_id             (axiController_io_axi_r_payload_id           ), //o
    .io_axi_r_payload_resp           (axiController_io_axi_r_payload_resp         ), //o
    .io_axi_r_payload_last           (axiController_io_axi_r_payload_last         ), //o
    .io_ddr_cmd_valid                (axiController_io_ddr_cmd_valid              ), //o
    .io_ddr_cmd_ready                (controller_io_ddr_cmd_ready                 ), //i
    .io_ddr_cmd_payload_cmdtype      (axiController_io_ddr_cmd_payload_cmdtype    ), //o
    .io_ddr_cmd_payload_addr         (axiController_io_ddr_cmd_payload_addr       ), //o
    .io_ddr_cmd_payload_burst_cnt    (axiController_io_ddr_cmd_payload_burst_cnt  ), //o
    .io_ddr_cmd_payload_wr_data      (axiController_io_ddr_cmd_payload_wr_data    ), //o
    .io_ddr_cmd_payload_wr_mask      (axiController_io_ddr_cmd_payload_wr_mask    ), //o
    .io_ddr_cmd_payload_context      (axiController_io_ddr_cmd_payload_context    ), //o
    .io_ddr_rsp_valid                (controller_io_ddr_rsp_valid                 ), //i
    .io_ddr_rsp_ready                (axiController_io_ddr_rsp_ready              ), //o
    .io_ddr_rsp_payload_rsp_data     (controller_io_ddr_rsp_payload_rsp_data      ), //i
    .io_ddr_rsp_payload_context      (controller_io_ddr_rsp_payload_context       ), //i
    .sys_clk_clk                     (sys_clk_clk                                 ), //i
    .sys_clk_resetn                  (sys_clk_resetn                              )  //i
  );
  Paski_GowinDDR14_Controller controller (
    .io_app_burst_number             (controller_io_app_burst_number              ), //o
    .io_cmd_ready                    (gowin_DDR3_cmd_ready                        ), //i
    .io_cmd                          (controller_io_cmd                           ), //o
    .io_cmd_en                       (controller_io_cmd_en                        ), //o
    .io_addr                         (controller_io_addr                          ), //o
    .io_wr_data_rdy                  (gowin_DDR3_wr_data_rdy                      ), //i
    .io_wr_data                      (controller_io_wr_data                       ), //o
    .io_wr_data_en                   (controller_io_wr_data_en                    ), //o
    .io_wr_data_mask                 (controller_io_wr_data_mask                  ), //o
    .io_rd_data                      (gowin_DDR3_rd_data                          ), //i
    .io_rd_data_valid                (gowin_DDR3_rd_data_valid                    ), //i
    .io_init_calib_complete          (gowin_DDR3_init_calib_complete              ), //i
    .io_ddr_cmd_valid                (axiController_io_ddr_cmd_valid              ), //i
    .io_ddr_cmd_ready                (controller_io_ddr_cmd_ready                 ), //o
    .io_ddr_cmd_payload_cmdtype      (axiController_io_ddr_cmd_payload_cmdtype    ), //i
    .io_ddr_cmd_payload_addr         (axiController_io_ddr_cmd_payload_addr       ), //i
    .io_ddr_cmd_payload_burst_cnt    (axiController_io_ddr_cmd_payload_burst_cnt  ), //i
    .io_ddr_cmd_payload_wr_data      (axiController_io_ddr_cmd_payload_wr_data    ), //i
    .io_ddr_cmd_payload_wr_mask      (axiController_io_ddr_cmd_payload_wr_mask    ), //i
    .io_ddr_cmd_payload_context      (axiController_io_ddr_cmd_payload_context    ), //i
    .io_ddr_rsp_valid                (controller_io_ddr_rsp_valid                 ), //o
    .io_ddr_rsp_ready                (axiController_io_ddr_rsp_ready              ), //i
    .io_ddr_rsp_payload_rsp_data     (controller_io_ddr_rsp_payload_rsp_data      ), //o
    .io_ddr_rsp_payload_context      (controller_io_ddr_rsp_payload_context       ), //o
    .clk_out                         (gowin_DDR3_clk_out                          ), //i
    .ddr_rst                         (gowin_DDR3_ddr_rst                          ), //i
    .sys_clk_clk                     (sys_clk_clk                                 ), //i
    .sys_clk_resetn                  (sys_clk_resetn                              )  //i
  );
  assign io_axi_arw_ready = axiController_io_axi_arw_ready;
  assign io_axi_w_ready = axiController_io_axi_w_ready;
  assign io_axi_b_valid = axiController_io_axi_b_valid;
  assign io_axi_b_payload_id = axiController_io_axi_b_payload_id;
  assign io_axi_b_payload_resp = axiController_io_axi_b_payload_resp;
  assign io_axi_r_valid = axiController_io_axi_r_valid;
  assign io_axi_r_payload_data = axiController_io_axi_r_payload_data;
  assign io_axi_r_payload_id = axiController_io_axi_r_payload_id;
  assign io_axi_r_payload_resp = axiController_io_axi_r_payload_resp;
  assign io_axi_r_payload_last = axiController_io_axi_r_payload_last;
  assign io_ddr_iface_O_ddr_addr = gowin_DDR3_O_ddr_addr;
  assign io_ddr_iface_O_ddr_ba = gowin_DDR3_O_ddr_ba;
  assign io_ddr_iface_O_ddr_cs_n = gowin_DDR3_O_ddr_cs_n;
  assign io_ddr_iface_O_ddr_ras_n = gowin_DDR3_O_ddr_ras_n;
  assign io_ddr_iface_O_ddr_cas_n = gowin_DDR3_O_ddr_cas_n;
  assign io_ddr_iface_O_ddr_we_n = gowin_DDR3_O_ddr_we_n;
  assign io_ddr_iface_O_ddr_clk = gowin_DDR3_O_ddr_clk;
  assign io_ddr_iface_O_ddr_clk_n = gowin_DDR3_O_ddr_clk_n;
  assign io_ddr_iface_O_ddr_cke = gowin_DDR3_O_ddr_cke;
  assign io_ddr_iface_O_ddr_odt = gowin_DDR3_O_ddr_odt;
  assign io_ddr_iface_O_ddr_reset_n = gowin_DDR3_O_ddr_reset_n;
  assign io_ddr_iface_O_ddr_dqm = gowin_DDR3_O_ddr_dqm;
  assign io_ddr_iface_IO_ddr_dq = IO_ddr_dq;
  assign io_ddr_iface_IO_ddr_dqs = IO_ddr_dqs;
  assign io_ddr_iface_IO_ddr_dqs_n = IO_ddr_dqs_n;

endmodule

module Paski_GowinDDR14_Controller (
  output     [5:0]    io_app_burst_number,
  input               io_cmd_ready,
  output reg [2:0]    io_cmd,
  output              io_cmd_en,
  output     [26:0]   io_addr,
  input               io_wr_data_rdy,
  output     [127:0]  io_wr_data,
  output reg          io_wr_data_en,
  output     [15:0]   io_wr_data_mask,
  input      [127:0]  io_rd_data,
  input               io_rd_data_valid,
  input               io_init_calib_complete,
  input               io_ddr_cmd_valid,
  output              io_ddr_cmd_ready,
  input      `Paski_GowinDDR_CMDTYPE_binary_sequential_type io_ddr_cmd_payload_cmdtype,
  input      [26:0]   io_ddr_cmd_payload_addr,
  input      [5:0]    io_ddr_cmd_payload_burst_cnt,
  input      [127:0]  io_ddr_cmd_payload_wr_data,
  input      [15:0]   io_ddr_cmd_payload_wr_mask,
  input      [0:0]    io_ddr_cmd_payload_context,
  output              io_ddr_rsp_valid,
  input               io_ddr_rsp_ready,
  output     [127:0]  io_ddr_rsp_payload_rsp_data,
  output     [0:0]    io_ddr_rsp_payload_context,
  input               clk_out,
  input               ddr_rst,
  input               sys_clk_clk,
  input               sys_clk_resetn
);
  wire                cmd_fifo_io_pop_ready;
  wire                cmd_fifo_io_push_ready;
  wire                cmd_fifo_io_pop_valid;
  wire       `Paski_GowinDDR_CMDTYPE_binary_sequential_type cmd_fifo_io_pop_payload_cmdtype;
  wire       [26:0]   cmd_fifo_io_pop_payload_addr;
  wire       [5:0]    cmd_fifo_io_pop_payload_burst_cnt;
  wire       [127:0]  cmd_fifo_io_pop_payload_wr_data;
  wire       [15:0]   cmd_fifo_io_pop_payload_wr_mask;
  wire       [0:0]    cmd_fifo_io_pop_payload_context;
  wire       [2:0]    cmd_fifo_io_pushOccupancy;
  wire       [2:0]    cmd_fifo_io_popOccupancy;
  wire                rsp_fifo_io_push_ready;
  wire                rsp_fifo_io_pop_valid;
  wire       [127:0]  rsp_fifo_io_pop_payload_rsp_data;
  wire       [0:0]    rsp_fifo_io_pop_payload_context;
  wire       [2:0]    rsp_fifo_io_pushOccupancy;
  wire       [2:0]    rsp_fifo_io_popOccupancy;
  wire       [6:0]    _zz_when_Paski_GowinDDR14_Controller_l93;
  wire       [6:0]    _zz_when_Paski_GowinDDR14_Controller_l93_1;
  wire       [1:0]    _zz_when_Paski_GowinDDR14_Controller_l93_2;
  wire       [6:0]    _zz_io_wr_data_en;
  wire       [6:0]    _zz_io_wr_data_en_1;
  wire       [1:0]    _zz_io_wr_data_en_2;
  reg                 ddr_control_area_cmd_free;
  reg                 ddr_control_area_cmd_can_send;
  reg                 ddr_control_area_cmd_trigger;
  reg        [6:0]    ddr_control_area_burst_cnt;
  wire                ddr_control_area_wr_fire;
  wire                ddr_control_area_data_fire;
  wire                cmd_fifo_io_pop_fire;
  wire                cmd_fifo_io_pop_fire_1;
  reg        `Paski_GowinDDR_CMDTYPE_binary_sequential_type ddr_control_area_cmd_cmdtype;
  reg        [26:0]   ddr_control_area_cmd_addr;
  reg        [5:0]    ddr_control_area_cmd_burst_cnt;
  reg        [127:0]  ddr_control_area_cmd_wr_data;
  reg        [15:0]   ddr_control_area_cmd_wr_mask;
  reg        [0:0]    ddr_control_area_cmd_context;
  wire                when_Paski_GowinDDR14_Controller_l93;
  wire                when_Paski_GowinDDR14_Controller_l94;
  wire                when_Paski_GowinDDR14_Controller_l102;
  `ifndef SYNTHESIS
  reg [39:0] io_ddr_cmd_payload_cmdtype_string;
  reg [39:0] ddr_control_area_cmd_cmdtype_string;
  `endif


  assign _zz_when_Paski_GowinDDR14_Controller_l93 = ({1'b0,ddr_control_area_cmd_burst_cnt} + _zz_when_Paski_GowinDDR14_Controller_l93_1);
  assign _zz_when_Paski_GowinDDR14_Controller_l93_2 = {1'b0,1'b1};
  assign _zz_when_Paski_GowinDDR14_Controller_l93_1 = {5'd0, _zz_when_Paski_GowinDDR14_Controller_l93_2};
  assign _zz_io_wr_data_en = ({1'b0,ddr_control_area_cmd_burst_cnt} + _zz_io_wr_data_en_1);
  assign _zz_io_wr_data_en_2 = {1'b0,1'b1};
  assign _zz_io_wr_data_en_1 = {5'd0, _zz_io_wr_data_en_2};
  StreamFifoCC cmd_fifo (
    .io_push_valid                (io_ddr_cmd_valid                   ), //i
    .io_push_ready                (cmd_fifo_io_push_ready             ), //o
    .io_push_payload_cmdtype      (io_ddr_cmd_payload_cmdtype         ), //i
    .io_push_payload_addr         (io_ddr_cmd_payload_addr            ), //i
    .io_push_payload_burst_cnt    (io_ddr_cmd_payload_burst_cnt       ), //i
    .io_push_payload_wr_data      (io_ddr_cmd_payload_wr_data         ), //i
    .io_push_payload_wr_mask      (io_ddr_cmd_payload_wr_mask         ), //i
    .io_push_payload_context      (io_ddr_cmd_payload_context         ), //i
    .io_pop_valid                 (cmd_fifo_io_pop_valid              ), //o
    .io_pop_ready                 (cmd_fifo_io_pop_ready              ), //i
    .io_pop_payload_cmdtype       (cmd_fifo_io_pop_payload_cmdtype    ), //o
    .io_pop_payload_addr          (cmd_fifo_io_pop_payload_addr       ), //o
    .io_pop_payload_burst_cnt     (cmd_fifo_io_pop_payload_burst_cnt  ), //o
    .io_pop_payload_wr_data       (cmd_fifo_io_pop_payload_wr_data    ), //o
    .io_pop_payload_wr_mask       (cmd_fifo_io_pop_payload_wr_mask    ), //o
    .io_pop_payload_context       (cmd_fifo_io_pop_payload_context    ), //o
    .io_pushOccupancy             (cmd_fifo_io_pushOccupancy          ), //o
    .io_popOccupancy              (cmd_fifo_io_popOccupancy           ), //o
    .sys_clk_clk                  (sys_clk_clk                        ), //i
    .sys_clk_resetn               (sys_clk_resetn                     ), //i
    .clk_out                      (clk_out                            ), //i
    .ddr_rst                      (ddr_rst                            )  //i
  );
  StreamFifoCC_1 rsp_fifo (
    .io_push_valid               (io_rd_data_valid                  ), //i
    .io_push_ready               (rsp_fifo_io_push_ready            ), //o
    .io_push_payload_rsp_data    (io_rd_data                        ), //i
    .io_push_payload_context     (ddr_control_area_cmd_context      ), //i
    .io_pop_valid                (rsp_fifo_io_pop_valid             ), //o
    .io_pop_ready                (io_ddr_rsp_ready                  ), //i
    .io_pop_payload_rsp_data     (rsp_fifo_io_pop_payload_rsp_data  ), //o
    .io_pop_payload_context      (rsp_fifo_io_pop_payload_context   ), //o
    .io_pushOccupancy            (rsp_fifo_io_pushOccupancy         ), //o
    .io_popOccupancy             (rsp_fifo_io_popOccupancy          ), //o
    .clk_out                     (clk_out                           ), //i
    .ddr_rst                     (ddr_rst                           ), //i
    .sys_clk_clk                 (sys_clk_clk                       ), //i
    .sys_clk_resetn              (sys_clk_resetn                    )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_ddr_cmd_payload_cmdtype)
      `Paski_GowinDDR_CMDTYPE_binary_sequential_read : io_ddr_cmd_payload_cmdtype_string = "read ";
      `Paski_GowinDDR_CMDTYPE_binary_sequential_write : io_ddr_cmd_payload_cmdtype_string = "write";
      default : io_ddr_cmd_payload_cmdtype_string = "?????";
    endcase
  end
  always @(*) begin
    case(ddr_control_area_cmd_cmdtype)
      `Paski_GowinDDR_CMDTYPE_binary_sequential_read : ddr_control_area_cmd_cmdtype_string = "read ";
      `Paski_GowinDDR_CMDTYPE_binary_sequential_write : ddr_control_area_cmd_cmdtype_string = "write";
      default : ddr_control_area_cmd_cmdtype_string = "?????";
    endcase
  end
  `endif

  assign io_ddr_cmd_ready = cmd_fifo_io_push_ready;
  assign io_ddr_rsp_valid = rsp_fifo_io_pop_valid;
  assign io_ddr_rsp_payload_rsp_data = rsp_fifo_io_pop_payload_rsp_data;
  assign io_ddr_rsp_payload_context = rsp_fifo_io_pop_payload_context;
  assign ddr_control_area_wr_fire = (io_wr_data_en && io_wr_data_rdy);
  assign ddr_control_area_data_fire = (io_rd_data_valid || ddr_control_area_wr_fire);
  assign cmd_fifo_io_pop_ready = (ddr_control_area_cmd_free && ddr_control_area_cmd_can_send);
  assign cmd_fifo_io_pop_fire = (cmd_fifo_io_pop_valid && cmd_fifo_io_pop_ready);
  assign cmd_fifo_io_pop_fire_1 = (cmd_fifo_io_pop_valid && cmd_fifo_io_pop_ready);
  assign when_Paski_GowinDDR14_Controller_l93 = (ddr_control_area_burst_cnt == _zz_when_Paski_GowinDDR14_Controller_l93);
  assign when_Paski_GowinDDR14_Controller_l94 = (ddr_control_area_cmd_free == 1'b0);
  assign io_cmd_en = ddr_control_area_cmd_trigger;
  assign io_app_burst_number = ddr_control_area_cmd_burst_cnt;
  assign io_addr = ddr_control_area_cmd_addr;
  assign io_wr_data = ddr_control_area_cmd_wr_data;
  assign io_wr_data_mask = ddr_control_area_cmd_wr_mask;
  assign when_Paski_GowinDDR14_Controller_l102 = (ddr_control_area_cmd_cmdtype == `Paski_GowinDDR_CMDTYPE_binary_sequential_read);
  always @(*) begin
    if(when_Paski_GowinDDR14_Controller_l102) begin
      io_cmd = 3'b001;
    end else begin
      io_cmd = 3'b000;
    end
  end

  always @(*) begin
    if(when_Paski_GowinDDR14_Controller_l102) begin
      io_wr_data_en = 1'b0;
    end else begin
      io_wr_data_en = ((ddr_control_area_burst_cnt != _zz_io_wr_data_en) && io_wr_data_rdy);
    end
  end

  always @(posedge clk_out or posedge ddr_rst) begin
    if(ddr_rst) begin
      ddr_control_area_cmd_free <= 1'b1;
      ddr_control_area_cmd_can_send <= 1'b0;
      ddr_control_area_cmd_trigger <= 1'b0;
      ddr_control_area_burst_cnt <= 7'h0;
      ddr_control_area_cmd_burst_cnt <= 6'h01;
    end else begin
      ddr_control_area_cmd_can_send <= ((io_cmd_ready && io_wr_data_rdy) && io_init_calib_complete);
      if(cmd_fifo_io_pop_fire) begin
        ddr_control_area_cmd_free <= 1'b0;
        ddr_control_area_cmd_trigger <= 1'b1;
        ddr_control_area_burst_cnt <= 7'h0;
      end
      if(ddr_control_area_data_fire) begin
        ddr_control_area_burst_cnt <= (ddr_control_area_burst_cnt + 7'h01);
      end
      if(ddr_control_area_cmd_trigger) begin
        ddr_control_area_cmd_trigger <= 1'b0;
      end
      if(cmd_fifo_io_pop_fire_1) begin
        ddr_control_area_cmd_burst_cnt <= cmd_fifo_io_pop_payload_burst_cnt;
      end
      if(when_Paski_GowinDDR14_Controller_l93) begin
        if(when_Paski_GowinDDR14_Controller_l94) begin
          ddr_control_area_cmd_free <= 1'b1;
        end
      end
    end
  end

  always @(posedge clk_out) begin
    if(cmd_fifo_io_pop_fire_1) begin
      ddr_control_area_cmd_cmdtype <= cmd_fifo_io_pop_payload_cmdtype;
      ddr_control_area_cmd_addr <= cmd_fifo_io_pop_payload_addr;
      ddr_control_area_cmd_wr_data <= cmd_fifo_io_pop_payload_wr_data;
      ddr_control_area_cmd_wr_mask <= cmd_fifo_io_pop_payload_wr_mask;
      ddr_control_area_cmd_context <= cmd_fifo_io_pop_payload_context;
    end
  end


endmodule

module Paski_GowinDDR_AXI4WithCache (
  input               io_axi_arw_valid,
  output reg          io_axi_arw_ready,
  input      [26:0]   io_axi_arw_payload_addr,
  input      [3:0]    io_axi_arw_payload_id,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [1:0]    io_axi_arw_payload_burst,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [3:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output reg [31:0]   io_axi_r_payload_data,
  output     [3:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  output              io_ddr_cmd_valid,
  input               io_ddr_cmd_ready,
  output     `Paski_GowinDDR_CMDTYPE_binary_sequential_type io_ddr_cmd_payload_cmdtype,
  output     [26:0]   io_ddr_cmd_payload_addr,
  output     [5:0]    io_ddr_cmd_payload_burst_cnt,
  output     [127:0]  io_ddr_cmd_payload_wr_data,
  output     [15:0]   io_ddr_cmd_payload_wr_mask,
  output     [0:0]    io_ddr_cmd_payload_context,
  input               io_ddr_rsp_valid,
  output              io_ddr_rsp_ready,
  input      [127:0]  io_ddr_rsp_payload_rsp_data,
  input      [0:0]    io_ddr_rsp_payload_context,
  input               sys_clk_clk,
  input               sys_clk_resetn
);
  wire       [1:0]    _zz_Axi4Incr_alignMask;
  wire       [11:0]   _zz_Axi4Incr_base;
  wire       [11:0]   _zz_Axi4Incr_base_1;
  wire       [11:0]   _zz_Axi4Incr_baseIncr;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_1;
  wire       [2:0]    _zz_Axi4Incr_wrapCase_2;
  reg        [11:0]   _zz_Axi4Incr_result;
  wire       [10:0]   _zz_Axi4Incr_result_1;
  wire       [0:0]    _zz_Axi4Incr_result_2;
  wire       [9:0]    _zz_Axi4Incr_result_3;
  wire       [1:0]    _zz_Axi4Incr_result_4;
  wire       [8:0]    _zz_Axi4Incr_result_5;
  wire       [2:0]    _zz_Axi4Incr_result_6;
  wire       [7:0]    _zz_Axi4Incr_result_7;
  wire       [3:0]    _zz_Axi4Incr_result_8;
  wire       [6:0]    _zz_Axi4Incr_result_9;
  wire       [4:0]    _zz_Axi4Incr_result_10;
  wire       [5:0]    _zz_Axi4Incr_result_11;
  wire       [5:0]    _zz_Axi4Incr_result_12;
  wire       [0:0]    context_type;
  reg                 sys_area_ddr_cmd_valid;
  reg        `Paski_GowinDDR_CMDTYPE_binary_sequential_type sys_area_ddr_cmd_payload_cmdtype;
  reg        [26:0]   sys_area_ddr_cmd_payload_addr;
  wire       [5:0]    sys_area_ddr_cmd_payload_burst_cnt;
  wire       [127:0]  sys_area_ddr_cmd_payload_wr_data;
  wire       [15:0]   sys_area_ddr_cmd_payload_wr_mask;
  wire       [0:0]    sys_area_ddr_cmd_payload_context;
  reg        [26:0]   sys_area_cache_addr;
  reg        [127:0]  sys_area_cache_data;
  reg        [15:0]   sys_area_cache_dirty_bit;
  reg                 sys_area_pageNotSame_Trigger;
  reg                 sys_area_pageDirty_Trigger;
  wire                sys_area_pageDirty;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [26:0]   unburstify_result_payload_fragment_addr;
  reg        [3:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [26:0]   unburstify_buffer_transaction_addr;
  reg        [3:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [1:0]    Axi4Incr_validSize;
  reg        [26:0]   Axi4Incr_result;
  wire       [14:0]   Axi4Incr_highCat;
  wire       [2:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_Axi4Incr_wrapCase;
  wire       [2:0]    Axi4Incr_wrapCase;
  wire                when_Axi4Channel_l181;
  reg                 sys_area_arwcmd_free;
  wire                unburstify_result_fire;
  reg                 sys_area_arwcmd_last;
  reg        [26:0]   sys_area_arwcmd_fragment_addr;
  reg        [3:0]    sys_area_arwcmd_fragment_id;
  reg        [2:0]    sys_area_arwcmd_fragment_size;
  reg        [1:0]    sys_area_arwcmd_fragment_burst;
  reg                 sys_area_arwcmd_fragment_write;
  wire                unburstify_result_fire_1;
  reg                 sys_area_write_data_ready;
  reg                 sys_area_write_response_valid;
  reg                 sys_area_read_response_valid;
  wire                sys_area_pageNotSame;
  wire                when_Paski_GowinDDR_AXI4WithCache_l88;
  wire                io_ddr_cmd_fire;
  wire                io_ddr_cmd_fire_1;
  wire                io_ddr_cmd_fire_2;
  wire                io_ddr_cmd_fire_3;
  wire                when_Paski_GowinDDR_AXI4WithCache_l102;
  wire                io_axi_w_fire;
  wire       [1:0]    switch_Paski_GowinDDR_AXI4WithCache_l104;
  wire                when_Paski_GowinDDR_AXI4WithCache_l110;
  wire                when_Paski_GowinDDR_AXI4WithCache_l110_1;
  wire                when_Paski_GowinDDR_AXI4WithCache_l110_2;
  wire                when_Paski_GowinDDR_AXI4WithCache_l110_3;
  wire                when_Paski_GowinDDR_AXI4WithCache_l121;
  wire                when_Paski_GowinDDR_AXI4WithCache_l121_1;
  wire                when_Paski_GowinDDR_AXI4WithCache_l121_2;
  wire                when_Paski_GowinDDR_AXI4WithCache_l121_3;
  wire                when_Paski_GowinDDR_AXI4WithCache_l132;
  wire                when_Paski_GowinDDR_AXI4WithCache_l132_1;
  wire                when_Paski_GowinDDR_AXI4WithCache_l132_2;
  wire                when_Paski_GowinDDR_AXI4WithCache_l132_3;
  wire                when_Paski_GowinDDR_AXI4WithCache_l143;
  wire                when_Paski_GowinDDR_AXI4WithCache_l143_1;
  wire                when_Paski_GowinDDR_AXI4WithCache_l143_2;
  wire                when_Paski_GowinDDR_AXI4WithCache_l143_3;
  wire                io_axi_w_fire_1;
  wire                io_axi_b_fire;
  wire       [1:0]    switch_Paski_GowinDDR_AXI4WithCache_l161;
  wire                io_axi_r_fire;
  wire                io_axi_r_fire_1;
  wire                io_ddr_rsp_fire;
  `ifndef SYNTHESIS
  reg [39:0] io_ddr_cmd_payload_cmdtype_string;
  reg [39:0] sys_area_ddr_cmd_payload_cmdtype_string;
  `endif


  assign _zz_Axi4Incr_alignMask = {(2'b01 < Axi4Incr_validSize),(2'b00 < Axi4Incr_validSize)};
  assign _zz_Axi4Incr_base_1 = unburstify_buffer_transaction_addr[11 : 0];
  assign _zz_Axi4Incr_base = _zz_Axi4Incr_base_1;
  assign _zz_Axi4Incr_baseIncr = {9'd0, Axi4Incr_sizeValue};
  assign _zz_Axi4Incr_wrapCase_1 = {1'd0, Axi4Incr_validSize};
  assign _zz_Axi4Incr_wrapCase_2 = {1'd0, _zz_Axi4Incr_wrapCase};
  assign _zz_Axi4Incr_result_1 = Axi4Incr_base[11 : 1];
  assign _zz_Axi4Incr_result_2 = Axi4Incr_baseIncr[0 : 0];
  assign _zz_Axi4Incr_result_3 = Axi4Incr_base[11 : 2];
  assign _zz_Axi4Incr_result_4 = Axi4Incr_baseIncr[1 : 0];
  assign _zz_Axi4Incr_result_5 = Axi4Incr_base[11 : 3];
  assign _zz_Axi4Incr_result_6 = Axi4Incr_baseIncr[2 : 0];
  assign _zz_Axi4Incr_result_7 = Axi4Incr_base[11 : 4];
  assign _zz_Axi4Incr_result_8 = Axi4Incr_baseIncr[3 : 0];
  assign _zz_Axi4Incr_result_9 = Axi4Incr_base[11 : 5];
  assign _zz_Axi4Incr_result_10 = Axi4Incr_baseIncr[4 : 0];
  assign _zz_Axi4Incr_result_11 = Axi4Incr_base[11 : 6];
  assign _zz_Axi4Incr_result_12 = Axi4Incr_baseIncr[5 : 0];
  always @(*) begin
    case(Axi4Incr_wrapCase)
      3'b000 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_1,_zz_Axi4Incr_result_2};
      end
      3'b001 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_3,_zz_Axi4Incr_result_4};
      end
      3'b010 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_5,_zz_Axi4Incr_result_6};
      end
      3'b011 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_7,_zz_Axi4Incr_result_8};
      end
      3'b100 : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_9,_zz_Axi4Incr_result_10};
      end
      default : begin
        _zz_Axi4Incr_result = {_zz_Axi4Incr_result_11,_zz_Axi4Incr_result_12};
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(io_ddr_cmd_payload_cmdtype)
      `Paski_GowinDDR_CMDTYPE_binary_sequential_read : io_ddr_cmd_payload_cmdtype_string = "read ";
      `Paski_GowinDDR_CMDTYPE_binary_sequential_write : io_ddr_cmd_payload_cmdtype_string = "write";
      default : io_ddr_cmd_payload_cmdtype_string = "?????";
    endcase
  end
  always @(*) begin
    case(sys_area_ddr_cmd_payload_cmdtype)
      `Paski_GowinDDR_CMDTYPE_binary_sequential_read : sys_area_ddr_cmd_payload_cmdtype_string = "read ";
      `Paski_GowinDDR_CMDTYPE_binary_sequential_write : sys_area_ddr_cmd_payload_cmdtype_string = "write";
      default : sys_area_ddr_cmd_payload_cmdtype_string = "?????";
    endcase
  end
  `endif

  assign io_ddr_cmd_valid = sys_area_ddr_cmd_valid;
  assign io_ddr_cmd_payload_cmdtype = sys_area_ddr_cmd_payload_cmdtype;
  assign io_ddr_cmd_payload_addr = sys_area_ddr_cmd_payload_addr;
  assign io_ddr_cmd_payload_burst_cnt = sys_area_ddr_cmd_payload_burst_cnt;
  assign io_ddr_cmd_payload_wr_data = sys_area_ddr_cmd_payload_wr_data;
  assign io_ddr_cmd_payload_wr_mask = sys_area_ddr_cmd_payload_wr_mask;
  assign io_ddr_cmd_payload_context = sys_area_ddr_cmd_payload_context;
  assign io_ddr_rsp_ready = 1'b1;
  assign sys_area_pageDirty = (sys_area_cache_dirty_bit != 16'hffff);
  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[1 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[26 : 12];
  assign Axi4Incr_sizeValue = {(2'b10 == Axi4Incr_validSize),{(2'b01 == Axi4Incr_validSize),(2'b00 == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_Axi4Incr_alignMask};
  assign Axi4Incr_base = (_zz_Axi4Incr_base & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_Axi4Incr_baseIncr);
  always @(*) begin
    casez(unburstify_buffer_len)
      8'b????1??? : begin
        _zz_Axi4Incr_wrapCase = 2'b11;
      end
      8'b????01?? : begin
        _zz_Axi4Incr_wrapCase = 2'b10;
      end
      8'b????001? : begin
        _zz_Axi4Incr_wrapCase = 2'b01;
      end
      default : begin
        _zz_Axi4Incr_wrapCase = 2'b00;
      end
    endcase
  end

  assign Axi4Incr_wrapCase = (_zz_Axi4Incr_wrapCase_1 + _zz_Axi4Incr_wrapCase_2);
  always @(*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_Axi4Incr_result};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @(*) begin
    io_axi_arw_ready = 1'b0;
    if(!unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      if(when_Axi4Channel_l181) begin
        unburstify_result_payload_last = 1'b1;
      end else begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @(*) begin
    if(unburstify_buffer_valid) begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign when_Axi4Channel_l181 = (io_axi_arw_payload_len == 8'h0);
  assign unburstify_result_fire = (unburstify_result_valid && unburstify_result_ready);
  assign unburstify_result_fire_1 = (unburstify_result_valid && unburstify_result_ready);
  assign unburstify_result_ready = sys_area_arwcmd_free;
  assign io_axi_r_payload_id = sys_area_arwcmd_fragment_id;
  assign io_axi_r_payload_last = sys_area_arwcmd_last;
  assign io_axi_r_payload_resp = 2'b00;
  assign io_axi_r_valid = sys_area_read_response_valid;
  assign io_axi_b_valid = sys_area_write_response_valid;
  assign io_axi_b_payload_id = sys_area_arwcmd_fragment_id;
  assign io_axi_b_payload_resp = 2'b00;
  assign io_axi_w_ready = sys_area_write_data_ready;
  assign sys_area_pageNotSame = (sys_area_cache_addr[26 : 4] != sys_area_arwcmd_fragment_addr[26 : 4]);
  always @(*) begin
    sys_area_ddr_cmd_payload_addr = 27'h0;
    if(when_Paski_GowinDDR_AXI4WithCache_l88) begin
      if(sys_area_pageNotSame) begin
        if(sys_area_pageDirty_Trigger) begin
          sys_area_ddr_cmd_payload_addr = {sys_area_cache_addr[26 : 4],4'b0000};
        end else begin
          if(sys_area_pageNotSame_Trigger) begin
            sys_area_ddr_cmd_payload_addr = {sys_area_arwcmd_fragment_addr[26 : 4],4'b0000};
          end
        end
      end
    end
  end

  always @(*) begin
    sys_area_ddr_cmd_payload_cmdtype = `Paski_GowinDDR_CMDTYPE_binary_sequential_write;
    if(when_Paski_GowinDDR_AXI4WithCache_l88) begin
      if(sys_area_pageNotSame) begin
        if(sys_area_pageDirty_Trigger) begin
          sys_area_ddr_cmd_payload_cmdtype = `Paski_GowinDDR_CMDTYPE_binary_sequential_write;
        end else begin
          if(sys_area_pageNotSame_Trigger) begin
            sys_area_ddr_cmd_payload_cmdtype = `Paski_GowinDDR_CMDTYPE_binary_sequential_read;
          end
        end
      end
    end
  end

  assign sys_area_ddr_cmd_payload_burst_cnt = 6'h0;
  assign sys_area_ddr_cmd_payload_wr_data = sys_area_cache_data;
  assign sys_area_ddr_cmd_payload_wr_mask = sys_area_cache_dirty_bit;
  assign sys_area_ddr_cmd_payload_context = 1'b0;
  always @(*) begin
    io_axi_r_payload_data = 32'h0;
    if(when_Paski_GowinDDR_AXI4WithCache_l88) begin
      if(!sys_area_pageNotSame) begin
        if(!when_Paski_GowinDDR_AXI4WithCache_l102) begin
          case(switch_Paski_GowinDDR_AXI4WithCache_l161)
            2'b00 : begin
              io_axi_r_payload_data = sys_area_cache_data[31 : 0];
            end
            2'b01 : begin
              io_axi_r_payload_data = sys_area_cache_data[63 : 32];
            end
            2'b10 : begin
              io_axi_r_payload_data = sys_area_cache_data[95 : 64];
            end
            default : begin
              io_axi_r_payload_data = sys_area_cache_data[127 : 96];
            end
          endcase
        end
      end
    end
  end

  assign when_Paski_GowinDDR_AXI4WithCache_l88 = (sys_area_arwcmd_free == 1'b0);
  assign io_ddr_cmd_fire = (io_ddr_cmd_valid && io_ddr_cmd_ready);
  assign io_ddr_cmd_fire_1 = (io_ddr_cmd_valid && io_ddr_cmd_ready);
  assign io_ddr_cmd_fire_2 = (io_ddr_cmd_valid && io_ddr_cmd_ready);
  assign io_ddr_cmd_fire_3 = (io_ddr_cmd_valid && io_ddr_cmd_ready);
  assign when_Paski_GowinDDR_AXI4WithCache_l102 = (sys_area_arwcmd_fragment_write == 1'b1);
  assign io_axi_w_fire = (io_axi_w_valid && io_axi_w_ready);
  assign switch_Paski_GowinDDR_AXI4WithCache_l104 = sys_area_arwcmd_fragment_addr[3 : 2];
  assign when_Paski_GowinDDR_AXI4WithCache_l110 = io_axi_w_payload_strb[0];
  assign when_Paski_GowinDDR_AXI4WithCache_l110_1 = io_axi_w_payload_strb[1];
  assign when_Paski_GowinDDR_AXI4WithCache_l110_2 = io_axi_w_payload_strb[2];
  assign when_Paski_GowinDDR_AXI4WithCache_l110_3 = io_axi_w_payload_strb[3];
  assign when_Paski_GowinDDR_AXI4WithCache_l121 = io_axi_w_payload_strb[0];
  assign when_Paski_GowinDDR_AXI4WithCache_l121_1 = io_axi_w_payload_strb[1];
  assign when_Paski_GowinDDR_AXI4WithCache_l121_2 = io_axi_w_payload_strb[2];
  assign when_Paski_GowinDDR_AXI4WithCache_l121_3 = io_axi_w_payload_strb[3];
  assign when_Paski_GowinDDR_AXI4WithCache_l132 = io_axi_w_payload_strb[0];
  assign when_Paski_GowinDDR_AXI4WithCache_l132_1 = io_axi_w_payload_strb[1];
  assign when_Paski_GowinDDR_AXI4WithCache_l132_2 = io_axi_w_payload_strb[2];
  assign when_Paski_GowinDDR_AXI4WithCache_l132_3 = io_axi_w_payload_strb[3];
  assign when_Paski_GowinDDR_AXI4WithCache_l143 = io_axi_w_payload_strb[0];
  assign when_Paski_GowinDDR_AXI4WithCache_l143_1 = io_axi_w_payload_strb[1];
  assign when_Paski_GowinDDR_AXI4WithCache_l143_2 = io_axi_w_payload_strb[2];
  assign when_Paski_GowinDDR_AXI4WithCache_l143_3 = io_axi_w_payload_strb[3];
  assign io_axi_w_fire_1 = (io_axi_w_valid && io_axi_w_ready);
  assign io_axi_b_fire = (io_axi_b_valid && io_axi_b_ready);
  assign switch_Paski_GowinDDR_AXI4WithCache_l161 = sys_area_arwcmd_fragment_addr[3 : 2];
  assign io_axi_r_fire = (io_axi_r_valid && io_axi_r_ready);
  assign io_axi_r_fire_1 = (io_axi_r_valid && io_axi_r_ready);
  assign io_ddr_rsp_fire = (io_ddr_rsp_valid && io_ddr_rsp_ready);
  always @(posedge sys_clk_clk or negedge sys_clk_resetn) begin
    if(!sys_clk_resetn) begin
      sys_area_ddr_cmd_valid <= 1'b0;
      sys_area_cache_addr <= 27'h0;
      sys_area_cache_data <= 128'h0;
      sys_area_cache_dirty_bit <= 16'hffff;
      sys_area_pageNotSame_Trigger <= 1'b0;
      sys_area_pageDirty_Trigger <= 1'b0;
      unburstify_buffer_valid <= 1'b0;
      sys_area_arwcmd_free <= 1'b1;
      sys_area_write_data_ready <= 1'b0;
      sys_area_write_response_valid <= 1'b0;
      sys_area_read_response_valid <= 1'b0;
    end else begin
      if(unburstify_result_ready) begin
        if(unburstify_buffer_last) begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(!unburstify_buffer_valid) begin
        if(!when_Axi4Channel_l181) begin
          if(unburstify_result_ready) begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(unburstify_result_fire_1) begin
        sys_area_arwcmd_free <= 1'b0;
        sys_area_pageNotSame_Trigger <= 1'b1;
        sys_area_pageDirty_Trigger <= sys_area_pageDirty;
      end
      if(when_Paski_GowinDDR_AXI4WithCache_l88) begin
        if(sys_area_pageNotSame) begin
          if(sys_area_pageDirty_Trigger) begin
            sys_area_ddr_cmd_valid <= (! io_ddr_cmd_fire);
            if(io_ddr_cmd_fire_1) begin
              sys_area_pageDirty_Trigger <= 1'b0;
            end
          end else begin
            if(sys_area_pageNotSame_Trigger) begin
              sys_area_ddr_cmd_valid <= (! io_ddr_cmd_fire_2);
              if(io_ddr_cmd_fire_3) begin
                sys_area_pageNotSame_Trigger <= 1'b0;
              end
            end
          end
        end else begin
          if(when_Paski_GowinDDR_AXI4WithCache_l102) begin
            if(io_axi_w_fire) begin
              case(switch_Paski_GowinDDR_AXI4WithCache_l104)
                2'b00 : begin
                  if(when_Paski_GowinDDR_AXI4WithCache_l110) begin
                    sys_area_cache_data[7 : 0] <= io_axi_w_payload_data[7 : 0];
                    sys_area_cache_dirty_bit[0] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l110_1) begin
                    sys_area_cache_data[15 : 8] <= io_axi_w_payload_data[15 : 8];
                    sys_area_cache_dirty_bit[1] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l110_2) begin
                    sys_area_cache_data[23 : 16] <= io_axi_w_payload_data[23 : 16];
                    sys_area_cache_dirty_bit[2] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l110_3) begin
                    sys_area_cache_data[31 : 24] <= io_axi_w_payload_data[31 : 24];
                    sys_area_cache_dirty_bit[3] <= 1'b0;
                  end
                end
                2'b01 : begin
                  if(when_Paski_GowinDDR_AXI4WithCache_l121) begin
                    sys_area_cache_data[39 : 32] <= io_axi_w_payload_data[7 : 0];
                    sys_area_cache_dirty_bit[4] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l121_1) begin
                    sys_area_cache_data[47 : 40] <= io_axi_w_payload_data[15 : 8];
                    sys_area_cache_dirty_bit[5] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l121_2) begin
                    sys_area_cache_data[55 : 48] <= io_axi_w_payload_data[23 : 16];
                    sys_area_cache_dirty_bit[6] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l121_3) begin
                    sys_area_cache_data[63 : 56] <= io_axi_w_payload_data[31 : 24];
                    sys_area_cache_dirty_bit[7] <= 1'b0;
                  end
                end
                2'b10 : begin
                  if(when_Paski_GowinDDR_AXI4WithCache_l132) begin
                    sys_area_cache_data[71 : 64] <= io_axi_w_payload_data[7 : 0];
                    sys_area_cache_dirty_bit[8] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l132_1) begin
                    sys_area_cache_data[79 : 72] <= io_axi_w_payload_data[15 : 8];
                    sys_area_cache_dirty_bit[9] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l132_2) begin
                    sys_area_cache_data[87 : 80] <= io_axi_w_payload_data[23 : 16];
                    sys_area_cache_dirty_bit[10] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l132_3) begin
                    sys_area_cache_data[95 : 88] <= io_axi_w_payload_data[31 : 24];
                    sys_area_cache_dirty_bit[11] <= 1'b0;
                  end
                end
                default : begin
                  if(when_Paski_GowinDDR_AXI4WithCache_l143) begin
                    sys_area_cache_data[103 : 96] <= io_axi_w_payload_data[7 : 0];
                    sys_area_cache_dirty_bit[12] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l143_1) begin
                    sys_area_cache_data[111 : 104] <= io_axi_w_payload_data[15 : 8];
                    sys_area_cache_dirty_bit[13] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l143_2) begin
                    sys_area_cache_data[119 : 112] <= io_axi_w_payload_data[23 : 16];
                    sys_area_cache_dirty_bit[14] <= 1'b0;
                  end
                  if(when_Paski_GowinDDR_AXI4WithCache_l143_3) begin
                    sys_area_cache_data[127 : 120] <= io_axi_w_payload_data[31 : 24];
                    sys_area_cache_dirty_bit[15] <= 1'b0;
                  end
                end
              endcase
            end
            sys_area_write_data_ready <= (! sys_area_write_response_valid);
            if(io_axi_w_fire_1) begin
              sys_area_write_data_ready <= 1'b0;
              sys_area_write_response_valid <= 1'b1;
            end
            if(io_axi_b_fire) begin
              sys_area_write_response_valid <= 1'b0;
              sys_area_arwcmd_free <= 1'b1;
            end
          end else begin
            sys_area_read_response_valid <= (! io_axi_r_fire);
            if(io_axi_r_fire_1) begin
              sys_area_arwcmd_free <= 1'b1;
            end
          end
        end
      end
      if(io_ddr_rsp_fire) begin
        sys_area_cache_addr <= {sys_area_arwcmd_fragment_addr[26 : 4],4'b0000};
        sys_area_cache_data <= io_ddr_rsp_payload_rsp_data;
        sys_area_cache_dirty_bit <= 16'h0;
      end
    end
  end

  always @(posedge sys_clk_clk) begin
    if(unburstify_result_ready) begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(!unburstify_buffer_valid) begin
      if(!when_Axi4Channel_l181) begin
        if(unburstify_result_ready) begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(unburstify_result_fire) begin
      sys_area_arwcmd_last <= unburstify_result_payload_last;
      sys_area_arwcmd_fragment_addr <= unburstify_result_payload_fragment_addr;
      sys_area_arwcmd_fragment_id <= unburstify_result_payload_fragment_id;
      sys_area_arwcmd_fragment_size <= unburstify_result_payload_fragment_size;
      sys_area_arwcmd_fragment_burst <= unburstify_result_payload_fragment_burst;
      sys_area_arwcmd_fragment_write <= unburstify_result_payload_fragment_write;
    end
  end


endmodule

module StreamFifoCC_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [127:0]  io_push_payload_rsp_data,
  input      [0:0]    io_push_payload_context,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [127:0]  io_pop_payload_rsp_data,
  output     [0:0]    io_pop_payload_context,
  output     [2:0]    io_pushOccupancy,
  output     [2:0]    io_popOccupancy,
  input               clk_out,
  input               ddr_rst,
  input               sys_clk_clk,
  input               sys_clk_resetn
);
  reg        [128:0]  _zz_ram_port1;
  wire       [2:0]    popToPushGray_buffercc_io_dataOut;
  wire       [2:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [2:0]    _zz_pushCC_pushPtrGray;
  wire       [1:0]    _zz_ram_port;
  wire       [128:0]  _zz_ram_port_1;
  wire       [2:0]    _zz_popCC_popPtrGray;
  wire       [1:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [1:0]    _zz__zz_io_pop_payload_rsp_data_1;
  wire                _zz__zz_io_pop_payload_rsp_data_1_1;
  reg                 _zz_1;
  wire       [2:0]    popToPushGray;
  wire       [2:0]    pushToPopGray;
  reg        [2:0]    pushCC_pushPtr;
  wire       [2:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [2:0]    pushCC_pushPtrGray;
  wire       [2:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  reg        [2:0]    popCC_popPtr;
  wire       [2:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [2:0]    popCC_popPtrGray;
  wire       [2:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [2:0]    _zz_io_pop_payload_rsp_data;
  wire       [128:0]  _zz_io_pop_payload_rsp_data_1;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  reg [128:0] ram [0:3];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[1:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_rsp_data_1 = _zz_io_pop_payload_rsp_data[1:0];
  assign _zz_ram_port_1 = {io_push_payload_context,io_push_payload_rsp_data};
  assign _zz__zz_io_pop_payload_rsp_data_1_1 = 1'b1;
  always @(posedge clk_out) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge sys_clk_clk) begin
    if(_zz__zz_io_pop_payload_rsp_data_1_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_rsp_data_1];
    end
  end

  BufferCC_1 popToPushGray_buffercc (
    .io_dataIn     (popToPushGray                      ), //i
    .io_dataOut    (popToPushGray_buffercc_io_dataOut  ), //o
    .clk_out       (clk_out                            ), //i
    .ddr_rst       (ddr_rst                            )  //i
  );
  BufferCC pushToPopGray_buffercc (
    .io_dataIn         (pushToPopGray                      ), //i
    .io_dataOut        (pushToPopGray_buffercc_io_dataOut  ), //o
    .sys_clk_clk       (sys_clk_clk                        ), //i
    .sys_clk_resetn    (sys_clk_resetn                     )  //i
  );
  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 3'b001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[2 : 1] == (~ pushCC_popPtrGray[2 : 1])) && (pushCC_pushPtrGray[0 : 0] == pushCC_popPtrGray[0 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = pushCC_popPtrGray[2];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}});
  assign popCC_popPtrPlus = (popCC_popPtr + 3'b001);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_rsp_data = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_rsp_data_1 = _zz_ram_port1;
  assign io_pop_payload_rsp_data = _zz_io_pop_payload_rsp_data_1[127 : 0];
  assign io_pop_payload_context = _zz_io_pop_payload_rsp_data_1[128 : 128];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = popCC_pushPtrGray[2];
  assign io_popOccupancy = ({_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge clk_out or posedge ddr_rst) begin
    if(ddr_rst) begin
      pushCC_pushPtr <= 3'b000;
      pushCC_pushPtrGray <= 3'b000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge sys_clk_clk or negedge sys_clk_resetn) begin
    if(!sys_clk_resetn) begin
      popCC_popPtr <= 3'b000;
      popCC_popPtrGray <= 3'b000;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

module StreamFifoCC (
  input               io_push_valid,
  output              io_push_ready,
  input      `Paski_GowinDDR_CMDTYPE_binary_sequential_type io_push_payload_cmdtype,
  input      [26:0]   io_push_payload_addr,
  input      [5:0]    io_push_payload_burst_cnt,
  input      [127:0]  io_push_payload_wr_data,
  input      [15:0]   io_push_payload_wr_mask,
  input      [0:0]    io_push_payload_context,
  output              io_pop_valid,
  input               io_pop_ready,
  output     `Paski_GowinDDR_CMDTYPE_binary_sequential_type io_pop_payload_cmdtype,
  output     [26:0]   io_pop_payload_addr,
  output     [5:0]    io_pop_payload_burst_cnt,
  output     [127:0]  io_pop_payload_wr_data,
  output     [15:0]   io_pop_payload_wr_mask,
  output     [0:0]    io_pop_payload_context,
  output     [2:0]    io_pushOccupancy,
  output     [2:0]    io_popOccupancy,
  input               sys_clk_clk,
  input               sys_clk_resetn,
  input               clk_out,
  input               ddr_rst
);
  reg        [178:0]  _zz_ram_port1;
  wire       [2:0]    popToPushGray_buffercc_io_dataOut;
  wire       [2:0]    pushToPopGray_buffercc_io_dataOut;
  wire       [2:0]    _zz_pushCC_pushPtrGray;
  wire       [1:0]    _zz_ram_port;
  wire       [178:0]  _zz_ram_port_1;
  wire       [2:0]    _zz_popCC_popPtrGray;
  wire       [1:0]    _zz_ram_port_2;
  wire                _zz_ram_port_3;
  wire       [1:0]    _zz__zz_io_pop_payload_cmdtype_2;
  wire                _zz__zz_io_pop_payload_cmdtype_2_1;
  reg                 _zz_1;
  wire       [2:0]    popToPushGray;
  wire       [2:0]    pushToPopGray;
  reg        [2:0]    pushCC_pushPtr;
  wire       [2:0]    pushCC_pushPtrPlus;
  wire                io_push_fire;
  reg        [2:0]    pushCC_pushPtrGray;
  wire       [2:0]    pushCC_popPtrGray;
  wire                pushCC_full;
  wire                io_push_fire_1;
  wire                _zz_io_pushOccupancy;
  wire                _zz_io_pushOccupancy_1;
  reg        [2:0]    popCC_popPtr;
  wire       [2:0]    popCC_popPtrPlus;
  wire                io_pop_fire;
  reg        [2:0]    popCC_popPtrGray;
  wire       [2:0]    popCC_pushPtrGray;
  wire                popCC_empty;
  wire                io_pop_fire_1;
  wire       [2:0]    _zz_io_pop_payload_cmdtype;
  wire       `Paski_GowinDDR_CMDTYPE_binary_sequential_type _zz_io_pop_payload_cmdtype_1;
  wire       [178:0]  _zz_io_pop_payload_cmdtype_2;
  wire       `Paski_GowinDDR_CMDTYPE_binary_sequential_type _zz_io_pop_payload_cmdtype_3;
  wire                io_pop_fire_2;
  wire                _zz_io_popOccupancy;
  wire                _zz_io_popOccupancy_1;
  `ifndef SYNTHESIS
  reg [39:0] io_push_payload_cmdtype_string;
  reg [39:0] io_pop_payload_cmdtype_string;
  reg [39:0] _zz_io_pop_payload_cmdtype_1_string;
  reg [39:0] _zz_io_pop_payload_cmdtype_3_string;
  `endif

  reg [178:0] ram [0:3];

  assign _zz_pushCC_pushPtrGray = (pushCC_pushPtrPlus >>> 1'b1);
  assign _zz_ram_port = pushCC_pushPtr[1:0];
  assign _zz_popCC_popPtrGray = (popCC_popPtrPlus >>> 1'b1);
  assign _zz__zz_io_pop_payload_cmdtype_2 = _zz_io_pop_payload_cmdtype[1:0];
  assign _zz_ram_port_1 = {io_push_payload_context,{io_push_payload_wr_mask,{io_push_payload_wr_data,{io_push_payload_burst_cnt,{io_push_payload_addr,io_push_payload_cmdtype}}}}};
  assign _zz__zz_io_pop_payload_cmdtype_2_1 = 1'b1;
  always @(posedge sys_clk_clk) begin
    if(_zz_1) begin
      ram[_zz_ram_port] <= _zz_ram_port_1;
    end
  end

  always @(posedge clk_out) begin
    if(_zz__zz_io_pop_payload_cmdtype_2_1) begin
      _zz_ram_port1 <= ram[_zz__zz_io_pop_payload_cmdtype_2];
    end
  end

  BufferCC popToPushGray_buffercc (
    .io_dataIn         (popToPushGray                      ), //i
    .io_dataOut        (popToPushGray_buffercc_io_dataOut  ), //o
    .sys_clk_clk       (sys_clk_clk                        ), //i
    .sys_clk_resetn    (sys_clk_resetn                     )  //i
  );
  BufferCC_1 pushToPopGray_buffercc (
    .io_dataIn     (pushToPopGray                      ), //i
    .io_dataOut    (pushToPopGray_buffercc_io_dataOut  ), //o
    .clk_out       (clk_out                            ), //i
    .ddr_rst       (ddr_rst                            )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_push_payload_cmdtype)
      `Paski_GowinDDR_CMDTYPE_binary_sequential_read : io_push_payload_cmdtype_string = "read ";
      `Paski_GowinDDR_CMDTYPE_binary_sequential_write : io_push_payload_cmdtype_string = "write";
      default : io_push_payload_cmdtype_string = "?????";
    endcase
  end
  always @(*) begin
    case(io_pop_payload_cmdtype)
      `Paski_GowinDDR_CMDTYPE_binary_sequential_read : io_pop_payload_cmdtype_string = "read ";
      `Paski_GowinDDR_CMDTYPE_binary_sequential_write : io_pop_payload_cmdtype_string = "write";
      default : io_pop_payload_cmdtype_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_io_pop_payload_cmdtype_1)
      `Paski_GowinDDR_CMDTYPE_binary_sequential_read : _zz_io_pop_payload_cmdtype_1_string = "read ";
      `Paski_GowinDDR_CMDTYPE_binary_sequential_write : _zz_io_pop_payload_cmdtype_1_string = "write";
      default : _zz_io_pop_payload_cmdtype_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_io_pop_payload_cmdtype_3)
      `Paski_GowinDDR_CMDTYPE_binary_sequential_read : _zz_io_pop_payload_cmdtype_3_string = "read ";
      `Paski_GowinDDR_CMDTYPE_binary_sequential_write : _zz_io_pop_payload_cmdtype_3_string = "write";
      default : _zz_io_pop_payload_cmdtype_3_string = "?????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    if(io_push_fire_1) begin
      _zz_1 = 1'b1;
    end
  end

  assign pushCC_pushPtrPlus = (pushCC_pushPtr + 3'b001);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign pushCC_popPtrGray = popToPushGray_buffercc_io_dataOut;
  assign pushCC_full = ((pushCC_pushPtrGray[2 : 1] == (~ pushCC_popPtrGray[2 : 1])) && (pushCC_pushPtrGray[0 : 0] == pushCC_popPtrGray[0 : 0]));
  assign io_push_ready = (! pushCC_full);
  assign io_push_fire_1 = (io_push_valid && io_push_ready);
  assign _zz_io_pushOccupancy = (pushCC_popPtrGray[1] ^ _zz_io_pushOccupancy_1);
  assign _zz_io_pushOccupancy_1 = pushCC_popPtrGray[2];
  assign io_pushOccupancy = (pushCC_pushPtr - {_zz_io_pushOccupancy_1,{_zz_io_pushOccupancy,(pushCC_popPtrGray[0] ^ _zz_io_pushOccupancy)}});
  assign popCC_popPtrPlus = (popCC_popPtr + 3'b001);
  assign io_pop_fire = (io_pop_valid && io_pop_ready);
  assign popCC_pushPtrGray = pushToPopGray_buffercc_io_dataOut;
  assign popCC_empty = (popCC_popPtrGray == popCC_pushPtrGray);
  assign io_pop_valid = (! popCC_empty);
  assign io_pop_fire_1 = (io_pop_valid && io_pop_ready);
  assign _zz_io_pop_payload_cmdtype = (io_pop_fire_1 ? popCC_popPtrPlus : popCC_popPtr);
  assign _zz_io_pop_payload_cmdtype_2 = _zz_ram_port1;
  assign _zz_io_pop_payload_cmdtype_3 = _zz_io_pop_payload_cmdtype_2[0 : 0];
  assign _zz_io_pop_payload_cmdtype_1 = _zz_io_pop_payload_cmdtype_3;
  assign io_pop_payload_cmdtype = _zz_io_pop_payload_cmdtype_1;
  assign io_pop_payload_addr = _zz_io_pop_payload_cmdtype_2[27 : 1];
  assign io_pop_payload_burst_cnt = _zz_io_pop_payload_cmdtype_2[33 : 28];
  assign io_pop_payload_wr_data = _zz_io_pop_payload_cmdtype_2[161 : 34];
  assign io_pop_payload_wr_mask = _zz_io_pop_payload_cmdtype_2[177 : 162];
  assign io_pop_payload_context = _zz_io_pop_payload_cmdtype_2[178 : 178];
  assign io_pop_fire_2 = (io_pop_valid && io_pop_ready);
  assign _zz_io_popOccupancy = (popCC_pushPtrGray[1] ^ _zz_io_popOccupancy_1);
  assign _zz_io_popOccupancy_1 = popCC_pushPtrGray[2];
  assign io_popOccupancy = ({_zz_io_popOccupancy_1,{_zz_io_popOccupancy,(popCC_pushPtrGray[0] ^ _zz_io_popOccupancy)}} - popCC_popPtr);
  assign pushToPopGray = pushCC_pushPtrGray;
  assign popToPushGray = popCC_popPtrGray;
  always @(posedge sys_clk_clk or negedge sys_clk_resetn) begin
    if(!sys_clk_resetn) begin
      pushCC_pushPtr <= 3'b000;
      pushCC_pushPtrGray <= 3'b000;
    end else begin
      if(io_push_fire) begin
        pushCC_pushPtrGray <= (_zz_pushCC_pushPtrGray ^ pushCC_pushPtrPlus);
      end
      if(io_push_fire_1) begin
        pushCC_pushPtr <= pushCC_pushPtrPlus;
      end
    end
  end

  always @(posedge clk_out or posedge ddr_rst) begin
    if(ddr_rst) begin
      popCC_popPtr <= 3'b000;
      popCC_popPtrGray <= 3'b000;
    end else begin
      if(io_pop_fire) begin
        popCC_popPtrGray <= (_zz_popCC_popPtrGray ^ popCC_popPtrPlus);
      end
      if(io_pop_fire_2) begin
        popCC_popPtr <= popCC_popPtrPlus;
      end
    end
  end


endmodule

//BufferCC replaced by BufferCC

//BufferCC_1 replaced by BufferCC_1

module BufferCC_1 (
  input      [2:0]    io_dataIn,
  output     [2:0]    io_dataOut,
  input               clk_out,
  input               ddr_rst
);
  (* async_reg = "true" *) reg        [2:0]    buffers_0;
  (* async_reg = "true" *) reg        [2:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge clk_out or posedge ddr_rst) begin
    if(ddr_rst) begin
      buffers_0 <= 3'b000;
      buffers_1 <= 3'b000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC (
  input      [2:0]    io_dataIn,
  output     [2:0]    io_dataOut,
  input               sys_clk_clk,
  input               sys_clk_resetn
);
  (* async_reg = "true" *) reg        [2:0]    buffers_0;
  (* async_reg = "true" *) reg        [2:0]    buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge sys_clk_clk or negedge sys_clk_resetn) begin
    if(!sys_clk_resetn) begin
      buffers_0 <= 3'b000;
      buffers_1 <= 3'b000;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
