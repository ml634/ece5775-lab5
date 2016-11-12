// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.2
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="arraycopy_axis,hls_ip_2015_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=8.500000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.258000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=170,HLS_SYN_LUT=206}" *)

module arraycopy_axis (
        s_axi_s_axilite_AWVALID,
        s_axi_s_axilite_AWREADY,
        s_axi_s_axilite_AWADDR,
        s_axi_s_axilite_WVALID,
        s_axi_s_axilite_WREADY,
        s_axi_s_axilite_WDATA,
        s_axi_s_axilite_WSTRB,
        s_axi_s_axilite_ARVALID,
        s_axi_s_axilite_ARREADY,
        s_axi_s_axilite_ARADDR,
        s_axi_s_axilite_RVALID,
        s_axi_s_axilite_RREADY,
        s_axi_s_axilite_RDATA,
        s_axi_s_axilite_RRESP,
        s_axi_s_axilite_BVALID,
        s_axi_s_axilite_BREADY,
        s_axi_s_axilite_BRESP,
        ap_clk,
        ap_rst_n,
        A_TDATA,
        A_TVALID,
        A_TREADY,
        A_TKEEP,
        A_TSTRB,
        A_TUSER,
        A_TLAST,
        A_TID,
        A_TDEST,
        B_TDATA,
        B_TVALID,
        B_TREADY,
        B_TKEEP,
        B_TSTRB,
        B_TUSER,
        B_TLAST,
        B_TID,
        B_TDEST,
        interrupt
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 4'b1;
parameter    ap_ST_st2_fsm_1 = 4'b10;
parameter    ap_ST_pp0_stg0_fsm_2 = 4'b100;
parameter    ap_ST_st5_fsm_3 = 4'b1000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    C_S_AXI_S_AXILITE_DATA_WIDTH = 32;
parameter    ap_const_int64_8 = 8;
parameter    C_S_AXI_S_AXILITE_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv6_1 = 6'b1;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_20 = 32'b100000;
parameter    ap_const_lv6_20 = 6'b100000;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_true = 1'b1;
parameter    C_S_AXI_S_AXILITE_WSTRB_WIDTH = (C_S_AXI_S_AXILITE_DATA_WIDTH / ap_const_int64_8);
parameter    C_S_AXI_WSTRB_WIDTH = (C_S_AXI_DATA_WIDTH / ap_const_int64_8);

input   s_axi_s_axilite_AWVALID;
output   s_axi_s_axilite_AWREADY;
input  [C_S_AXI_S_AXILITE_ADDR_WIDTH - 1 : 0] s_axi_s_axilite_AWADDR;
input   s_axi_s_axilite_WVALID;
output   s_axi_s_axilite_WREADY;
input  [C_S_AXI_S_AXILITE_DATA_WIDTH - 1 : 0] s_axi_s_axilite_WDATA;
input  [C_S_AXI_S_AXILITE_WSTRB_WIDTH - 1 : 0] s_axi_s_axilite_WSTRB;
input   s_axi_s_axilite_ARVALID;
output   s_axi_s_axilite_ARREADY;
input  [C_S_AXI_S_AXILITE_ADDR_WIDTH - 1 : 0] s_axi_s_axilite_ARADDR;
output   s_axi_s_axilite_RVALID;
input   s_axi_s_axilite_RREADY;
output  [C_S_AXI_S_AXILITE_DATA_WIDTH - 1 : 0] s_axi_s_axilite_RDATA;
output  [1:0] s_axi_s_axilite_RRESP;
output   s_axi_s_axilite_BVALID;
input   s_axi_s_axilite_BREADY;
output  [1:0] s_axi_s_axilite_BRESP;
input   ap_clk;
input   ap_rst_n;
input  [31:0] A_TDATA;
input   A_TVALID;
output   A_TREADY;
input  [3:0] A_TKEEP;
input  [3:0] A_TSTRB;
input  [0:0] A_TUSER;
input  [0:0] A_TLAST;
input  [0:0] A_TID;
input  [0:0] A_TDEST;
output  [31:0] B_TDATA;
output   B_TVALID;
input   B_TREADY;
output  [3:0] B_TKEEP;
output  [3:0] B_TSTRB;
output  [0:0] B_TUSER;
output  [0:0] B_TLAST;
output  [0:0] B_TID;
output  [0:0] B_TDEST;
output   interrupt;

reg A_TREADY;
reg B_TVALID;
reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_45;
reg    ap_ready;
wire   [31:0] M;
wire   [31:0] ap_return;
wire    arraycopy_axis_s_axilite_s_axi_U_ap_dummy_ce;
reg   [5:0] i_reg_163;
wire   [5:0] M_assign_fu_290_p3;
reg   [5:0] M_assign_reg_351;
reg    ap_sig_bdd_92;
wire   [0:0] tmp_fu_298_p2;
reg   [0:0] tmp_reg_356;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_2;
reg    ap_sig_bdd_102;
reg    ap_sig_bdd_108;
reg    ap_reg_ppiten_pp0_it0 = 1'b0;
reg    ap_sig_ioackin_B_TREADY;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
wire   [5:0] i_1_fu_303_p2;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_133;
reg   [31:0] tmp_data_V_fu_86;
reg   [3:0] tmp_keep_V_fu_90;
reg   [3:0] tmp_strb_V_fu_94;
reg   [0:0] tmp_user_V_fu_98;
reg   [0:0] tmp_last_V_fu_102;
reg   [0:0] tmp_id_V_fu_106;
reg   [0:0] tmp_dest_V_fu_110;
reg    ap_reg_ioackin_B_TREADY = 1'b0;
wire   [0:0] tmp_1_fu_266_p3;
wire   [0:0] tmp_2_fu_274_p2;
wire   [0:0] or_cond_fu_280_p2;
wire   [5:0] tmp_3_fu_286_p1;
reg    ap_sig_cseq_ST_st5_fsm_3;
reg    ap_sig_bdd_309;
reg   [3:0] ap_NS_fsm;


arraycopy_axis_s_axilite_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_S_AXILITE_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_S_AXILITE_DATA_WIDTH ))
arraycopy_axis_s_axilite_s_axi_U(
    .AWVALID( s_axi_s_axilite_AWVALID ),
    .AWREADY( s_axi_s_axilite_AWREADY ),
    .AWADDR( s_axi_s_axilite_AWADDR ),
    .WVALID( s_axi_s_axilite_WVALID ),
    .WREADY( s_axi_s_axilite_WREADY ),
    .WDATA( s_axi_s_axilite_WDATA ),
    .WSTRB( s_axi_s_axilite_WSTRB ),
    .ARVALID( s_axi_s_axilite_ARVALID ),
    .ARREADY( s_axi_s_axilite_ARREADY ),
    .ARADDR( s_axi_s_axilite_ARADDR ),
    .RVALID( s_axi_s_axilite_RVALID ),
    .RREADY( s_axi_s_axilite_RREADY ),
    .RDATA( s_axi_s_axilite_RDATA ),
    .RRESP( s_axi_s_axilite_RRESP ),
    .BVALID( s_axi_s_axilite_BVALID ),
    .BREADY( s_axi_s_axilite_BREADY ),
    .BRESP( s_axi_s_axilite_BRESP ),
    .ACLK( ap_clk ),
    .ARESET( ap_rst_n_inv ),
    .ACLK_EN( arraycopy_axis_s_axilite_s_axi_U_ap_dummy_ce ),
    .ap_start( ap_start ),
    .interrupt( interrupt ),
    .ap_ready( ap_ready ),
    .ap_done( ap_done ),
    .ap_idle( ap_idle ),
    .ap_return( ap_return ),
    .M( M )
);



/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_reg_ioackin_B_TREADY assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ioackin_B_TREADY
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_B_TREADY <= ap_const_logic_0;
    end else begin
        if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(ap_const_logic_0 == ap_sig_ioackin_B_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
            ap_reg_ioackin_B_TREADY <= ap_const_logic_0;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (ap_const_logic_1 == B_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) & (ap_const_logic_1 == B_TREADY)))) begin
            ap_reg_ioackin_B_TREADY <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it0 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it0
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (tmp_fu_298_p2 == ap_const_lv1_0) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(ap_const_logic_0 == ap_sig_ioackin_B_TREADY))) begin
            ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it1 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(tmp_fu_298_p2 == ap_const_lv1_0) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(ap_const_logic_0 == ap_sig_ioackin_B_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & (tmp_fu_298_p2 == ap_const_lv1_0) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
            ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(tmp_fu_298_p2 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        i_reg_163 <= i_1_fu_303_p2;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(ap_const_logic_0 == ap_sig_ioackin_B_TREADY))) begin
        i_reg_163 <= ap_const_lv6_1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_92)) begin
        M_assign_reg_351 <= M_assign_fu_290_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_92) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(tmp_fu_298_p2 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
        tmp_data_V_fu_86 <= A_TDATA;
        tmp_dest_V_fu_110 <= A_TDEST;
        tmp_id_V_fu_106 <= A_TID;
        tmp_keep_V_fu_90 <= A_TKEEP;
        tmp_last_V_fu_102 <= A_TLAST;
        tmp_strb_V_fu_94 <= A_TSTRB;
        tmp_user_V_fu_98 <= A_TUSER;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp_reg_356 <= tmp_fu_298_p2;
    end
end

/// A_TREADY assign process. ///
always @ (ap_sig_cseq_ST_st1_fsm_0 or ap_sig_bdd_92 or tmp_fu_298_p2 or tmp_reg_356 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_108 or ap_reg_ppiten_pp0_it0 or ap_sig_ioackin_B_TREADY or ap_reg_ppiten_pp0_it1)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_bdd_92) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(tmp_fu_298_p2 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
        A_TREADY = ap_const_logic_1;
    end else begin
        A_TREADY = ap_const_logic_0;
    end
end

/// B_TVALID assign process. ///
always @ (tmp_reg_356 or ap_sig_cseq_ST_pp0_stg0_fsm_2 or ap_sig_bdd_108 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_cseq_ST_st2_fsm_1 or ap_reg_ioackin_B_TREADY)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (ap_const_logic_0 == ap_reg_ioackin_B_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_2) & ~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~(ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) & (ap_const_logic_0 == ap_reg_ioackin_B_TREADY)))) begin
        B_TVALID = ap_const_logic_1;
    end else begin
        B_TVALID = ap_const_logic_0;
    end
end

/// ap_done assign process. ///
always @ (ap_sig_cseq_ST_st5_fsm_3)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_3)) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_sig_cseq_ST_st5_fsm_3)
begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_3)) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp0_stg0_fsm_2 assign process. ///
always @ (ap_sig_bdd_102)
begin
    if (ap_sig_bdd_102) begin
        ap_sig_cseq_ST_pp0_stg0_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_pp0_stg0_fsm_2 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_45)
begin
    if (ap_sig_bdd_45) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st2_fsm_1 assign process. ///
always @ (ap_sig_bdd_133)
begin
    if (ap_sig_bdd_133) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st5_fsm_3 assign process. ///
always @ (ap_sig_bdd_309)
begin
    if (ap_sig_bdd_309) begin
        ap_sig_cseq_ST_st5_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_3 = ap_const_logic_0;
    end
end

/// ap_sig_ioackin_B_TREADY assign process. ///
always @ (B_TREADY or ap_reg_ioackin_B_TREADY)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_B_TREADY)) begin
        ap_sig_ioackin_B_TREADY = B_TREADY;
    end else begin
        ap_sig_ioackin_B_TREADY = ap_const_logic_1;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_CS_fsm or ap_sig_bdd_92 or tmp_fu_298_p2 or tmp_reg_356 or ap_sig_bdd_108 or ap_reg_ppiten_pp0_it0 or ap_sig_ioackin_B_TREADY or ap_reg_ppiten_pp0_it1)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~ap_sig_bdd_92) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(ap_const_logic_0 == ap_sig_ioackin_B_TREADY)) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        ap_ST_pp0_stg0_fsm_2 : 
        begin
            if (~((tmp_fu_298_p2 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end else if (((tmp_fu_298_p2 == ap_const_lv1_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_sig_bdd_108 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0)) | (~(tmp_reg_356 == ap_const_lv1_0) & (ap_const_logic_0 == ap_sig_ioackin_B_TREADY) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
                ap_NS_fsm = ap_ST_st5_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_pp0_stg0_fsm_2;
            end
        end
        ap_ST_st5_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign B_TDATA = tmp_data_V_fu_86;
assign B_TDEST = tmp_dest_V_fu_110;
assign B_TID = tmp_id_V_fu_106;
assign B_TKEEP = tmp_keep_V_fu_90;
assign B_TLAST = tmp_last_V_fu_102;
assign B_TSTRB = tmp_strb_V_fu_94;
assign B_TUSER = tmp_user_V_fu_98;
assign M_assign_fu_290_p3 = ((or_cond_fu_280_p2[0:0]===1'b1)? ap_const_lv6_20: tmp_3_fu_286_p1);
assign ap_return = ap_const_lv32_0;

/// ap_rst_n_inv assign process. ///
always @ (ap_rst_n)
begin
    ap_rst_n_inv = ~ap_rst_n;
end

/// ap_sig_bdd_102 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_102 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end

/// ap_sig_bdd_108 assign process. ///
always @ (A_TVALID or tmp_fu_298_p2)
begin
    ap_sig_bdd_108 = ((A_TVALID == ap_const_logic_0) & ~(tmp_fu_298_p2 == ap_const_lv1_0));
end

/// ap_sig_bdd_133 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_133 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_309 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_309 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end

/// ap_sig_bdd_45 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_45 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_92 assign process. ///
always @ (ap_start or A_TVALID)
begin
    ap_sig_bdd_92 = ((A_TVALID == ap_const_logic_0) | (ap_start == ap_const_logic_0));
end
assign arraycopy_axis_s_axilite_s_axi_U_ap_dummy_ce = ap_const_logic_1;
assign i_1_fu_303_p2 = (i_reg_163 + ap_const_lv6_1);
assign or_cond_fu_280_p2 = (tmp_1_fu_266_p3 | tmp_2_fu_274_p2);
assign tmp_1_fu_266_p3 = M[ap_const_lv32_1F];
assign tmp_2_fu_274_p2 = ($signed(M) > $signed(32'b100000)? 1'b1: 1'b0);
assign tmp_3_fu_286_p1 = M[5:0];
assign tmp_fu_298_p2 = (i_reg_163 < M_assign_reg_351? 1'b1: 1'b0);


endmodule //arraycopy_axis
