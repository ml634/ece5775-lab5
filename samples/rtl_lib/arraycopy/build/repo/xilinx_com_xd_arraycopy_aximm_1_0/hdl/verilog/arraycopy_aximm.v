// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.2
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="arraycopy_aximm,hls_ip_2015_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=8.500000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.437500,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=1087,HLS_SYN_LUT=1288}" *)

module arraycopy_aximm (
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP,
        ap_clk,
        ap_rst_n,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        interrupt
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 26'b1;
parameter    ap_ST_st2_fsm_1 = 26'b10;
parameter    ap_ST_st3_fsm_2 = 26'b100;
parameter    ap_ST_st4_fsm_3 = 26'b1000;
parameter    ap_ST_st5_fsm_4 = 26'b10000;
parameter    ap_ST_st6_fsm_5 = 26'b100000;
parameter    ap_ST_st7_fsm_6 = 26'b1000000;
parameter    ap_ST_st8_fsm_7 = 26'b10000000;
parameter    ap_ST_st9_fsm_8 = 26'b100000000;
parameter    ap_ST_st10_fsm_9 = 26'b1000000000;
parameter    ap_ST_st11_fsm_10 = 26'b10000000000;
parameter    ap_ST_st12_fsm_11 = 26'b100000000000;
parameter    ap_ST_st13_fsm_12 = 26'b1000000000000;
parameter    ap_ST_st14_fsm_13 = 26'b10000000000000;
parameter    ap_ST_st15_fsm_14 = 26'b100000000000000;
parameter    ap_ST_st16_fsm_15 = 26'b1000000000000000;
parameter    ap_ST_st17_fsm_16 = 26'b10000000000000000;
parameter    ap_ST_st18_fsm_17 = 26'b100000000000000000;
parameter    ap_ST_st19_fsm_18 = 26'b1000000000000000000;
parameter    ap_ST_st20_fsm_19 = 26'b10000000000000000000;
parameter    ap_ST_st21_fsm_20 = 26'b100000000000000000000;
parameter    ap_ST_st22_fsm_21 = 26'b1000000000000000000000;
parameter    ap_ST_st23_fsm_22 = 26'b10000000000000000000000;
parameter    ap_ST_st24_fsm_23 = 26'b100000000000000000000000;
parameter    ap_ST_st25_fsm_24 = 26'b1000000000000000000000000;
parameter    ap_ST_st26_fsm_25 = 26'b10000000000000000000000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
parameter    ap_const_int64_8 = 8;
parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM_ADDR_WIDTH = 32;
parameter    C_M_AXI_GMEM_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_BUSER_WIDTH = 1;
parameter    C_M_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_USER_VALUE = 0;
parameter    C_M_AXI_GMEM_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM_CACHE_VALUE = 3;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_C = 32'b1100;
parameter    ap_const_lv32_D = 32'b1101;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_E = 32'b1110;
parameter    ap_const_lv32_14 = 32'b10100;
parameter    ap_const_lv32_15 = 32'b10101;
parameter    ap_const_lv32_19 = 32'b11001;
parameter    ap_const_lv6_1 = 6'b1;
parameter    ap_const_lv3_0 = 3'b000;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv4_F = 4'b1111;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv32_20 = 32'b100000;
parameter    ap_const_lv6_20 = 6'b100000;
parameter    ap_true = 1'b1;
parameter    C_S_AXI_AXILITES_WSTRB_WIDTH = (C_S_AXI_AXILITES_DATA_WIDTH / ap_const_int64_8);
parameter    C_S_AXI_WSTRB_WIDTH = (C_S_AXI_DATA_WIDTH / ap_const_int64_8);
parameter    C_M_AXI_GMEM_WSTRB_WIDTH = (C_M_AXI_GMEM_DATA_WIDTH / ap_const_int64_8);
parameter    C_M_AXI_WSTRB_WIDTH = (C_M_AXI_DATA_WIDTH / ap_const_int64_8);

input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1 : 0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1 : 0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1 : 0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1 : 0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1 : 0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;
input   ap_clk;
input   ap_rst_n;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [C_M_AXI_GMEM_ADDR_WIDTH - 1 : 0] m_axi_gmem_AWADDR;
output  [C_M_AXI_GMEM_ID_WIDTH - 1 : 0] m_axi_gmem_AWID;
output  [7:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [C_M_AXI_GMEM_AWUSER_WIDTH - 1 : 0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [C_M_AXI_GMEM_DATA_WIDTH - 1 : 0] m_axi_gmem_WDATA;
output  [C_M_AXI_GMEM_WSTRB_WIDTH - 1 : 0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [C_M_AXI_GMEM_ID_WIDTH - 1 : 0] m_axi_gmem_WID;
output  [C_M_AXI_GMEM_WUSER_WIDTH - 1 : 0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [C_M_AXI_GMEM_ADDR_WIDTH - 1 : 0] m_axi_gmem_ARADDR;
output  [C_M_AXI_GMEM_ID_WIDTH - 1 : 0] m_axi_gmem_ARID;
output  [7:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [C_M_AXI_GMEM_ARUSER_WIDTH - 1 : 0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [C_M_AXI_GMEM_DATA_WIDTH - 1 : 0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [C_M_AXI_GMEM_ID_WIDTH - 1 : 0] m_axi_gmem_RID;
input  [C_M_AXI_GMEM_RUSER_WIDTH - 1 : 0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [C_M_AXI_GMEM_ID_WIDTH - 1 : 0] m_axi_gmem_BID;
input  [C_M_AXI_GMEM_BUSER_WIDTH - 1 : 0] m_axi_gmem_BUSER;
output   interrupt;

reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [25:0] ap_CS_fsm = 26'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_67;
reg    ap_ready;
wire   [31:0] a;
wire   [31:0] b;
wire   [31:0] M;
wire   [31:0] ap_return;
wire    arraycopy_aximm_AXILiteS_s_axi_U_ap_dummy_ce;
reg    gmem_AWVALID;
wire    gmem_AWREADY;
reg   [31:0] gmem_AWADDR;
wire   [0:0] gmem_AWID;
wire   [31:0] gmem_AWLEN;
wire   [2:0] gmem_AWSIZE;
wire   [1:0] gmem_AWBURST;
wire   [1:0] gmem_AWLOCK;
wire   [3:0] gmem_AWCACHE;
wire   [2:0] gmem_AWPROT;
wire   [3:0] gmem_AWQOS;
wire   [3:0] gmem_AWREGION;
wire   [0:0] gmem_AWUSER;
reg    gmem_WVALID;
wire    gmem_WREADY;
reg   [31:0] gmem_WDATA;
wire   [3:0] gmem_WSTRB;
wire    gmem_WLAST;
wire   [0:0] gmem_WID;
wire   [0:0] gmem_WUSER;
reg    gmem_ARVALID;
wire    gmem_ARREADY;
reg   [31:0] gmem_ARADDR;
wire   [0:0] gmem_ARID;
wire   [31:0] gmem_ARLEN;
wire   [2:0] gmem_ARSIZE;
wire   [1:0] gmem_ARBURST;
wire   [1:0] gmem_ARLOCK;
wire   [3:0] gmem_ARCACHE;
wire   [2:0] gmem_ARPROT;
wire   [3:0] gmem_ARQOS;
wire   [3:0] gmem_ARREGION;
wire   [0:0] gmem_ARUSER;
wire    gmem_RVALID;
reg    gmem_RREADY;
wire   [31:0] gmem_RDATA;
wire    gmem_RLAST;
wire   [0:0] gmem_RID;
wire   [0:0] gmem_RUSER;
wire   [1:0] gmem_RRESP;
wire    gmem_BVALID;
reg    gmem_BREADY;
wire   [1:0] gmem_BRESP;
wire   [0:0] gmem_BID;
wire   [0:0] gmem_BUSER;
wire    arraycopy_aximm_gmem_m_axi_U_ap_dummy_ce;
reg   [29:0] b3_reg_268;
reg   [29:0] a1_reg_274;
wire   [5:0] M_assign_fu_177_p3;
reg   [5:0] M_assign_reg_280;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_235;
reg    ap_sig_ioackin_gmem_ARREADY;
reg    ap_sig_cseq_ST_st8_fsm_7;
reg    ap_sig_bdd_248;
reg    ap_sig_ioackin_gmem_AWREADY;
reg   [31:0] tmp_9_reg_296;
wire   [30:0] tmp_2_cast_fu_205_p1;
reg   [30:0] tmp_2_cast_reg_302;
reg    ap_sig_cseq_ST_st13_fsm_12;
reg    ap_sig_bdd_265;
wire   [30:0] tmp_5_cast_fu_208_p1;
reg   [30:0] tmp_5_cast_reg_307;
wire   [30:0] a2_sum_fu_220_p2;
reg   [30:0] a2_sum_reg_315;
reg    ap_sig_cseq_ST_st14_fsm_13;
reg    ap_sig_bdd_279;
wire   [0:0] tmp_3_fu_211_p2;
wire   [30:0] b4_sum_fu_225_p2;
reg   [30:0] b4_sum_reg_320;
wire   [5:0] i_1_fu_230_p2;
reg   [5:0] i_1_reg_325;
reg    ap_sig_cseq_ST_st15_fsm_14;
reg    ap_sig_bdd_297;
reg   [31:0] max_reg_336;
reg    ap_sig_cseq_ST_st21_fsm_20;
reg    ap_sig_bdd_306;
wire   [31:0] p_max_fu_261_p3;
reg   [31:0] p_max_reg_348;
reg    ap_sig_cseq_ST_st22_fsm_21;
reg    ap_sig_bdd_318;
reg    ap_sig_ioackin_gmem_WREADY;
reg   [31:0] max1_reg_111;
reg    ap_sig_cseq_ST_st26_fsm_25;
reg    ap_sig_bdd_331;
reg   [5:0] i_reg_121;
wire   [63:0] tmp_5_fu_185_p1;
wire   [63:0] tmp_2_fu_195_p1;
wire   [63:0] a2_sum_cast_fu_236_p1;
wire   [63:0] b4_sum_cast_fu_246_p1;
reg    ap_reg_ioackin_gmem_ARREADY = 1'b0;
reg    ap_reg_ioackin_gmem_AWREADY = 1'b0;
reg    ap_reg_ioackin_gmem_WREADY = 1'b0;
reg    ap_sig_cseq_ST_st9_fsm_8;
reg    ap_sig_bdd_365;
wire   [0:0] tmp_fu_153_p3;
wire   [0:0] tmp_1_fu_161_p2;
wire   [0:0] or_cond_fu_167_p2;
wire   [5:0] tmp_4_fu_173_p1;
wire   [30:0] tmp_4_cast_fu_216_p1;
wire   [0:0] tmp_6_fu_256_p2;
reg   [25:0] ap_NS_fsm;
reg    ap_sig_bdd_527;


arraycopy_aximm_AXILiteS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITES_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITES_DATA_WIDTH ))
arraycopy_aximm_AXILiteS_s_axi_U(
    .AWVALID( s_axi_AXILiteS_AWVALID ),
    .AWREADY( s_axi_AXILiteS_AWREADY ),
    .AWADDR( s_axi_AXILiteS_AWADDR ),
    .WVALID( s_axi_AXILiteS_WVALID ),
    .WREADY( s_axi_AXILiteS_WREADY ),
    .WDATA( s_axi_AXILiteS_WDATA ),
    .WSTRB( s_axi_AXILiteS_WSTRB ),
    .ARVALID( s_axi_AXILiteS_ARVALID ),
    .ARREADY( s_axi_AXILiteS_ARREADY ),
    .ARADDR( s_axi_AXILiteS_ARADDR ),
    .RVALID( s_axi_AXILiteS_RVALID ),
    .RREADY( s_axi_AXILiteS_RREADY ),
    .RDATA( s_axi_AXILiteS_RDATA ),
    .RRESP( s_axi_AXILiteS_RRESP ),
    .BVALID( s_axi_AXILiteS_BVALID ),
    .BREADY( s_axi_AXILiteS_BREADY ),
    .BRESP( s_axi_AXILiteS_BRESP ),
    .ACLK( ap_clk ),
    .ARESET( ap_rst_n_inv ),
    .ACLK_EN( arraycopy_aximm_AXILiteS_s_axi_U_ap_dummy_ce ),
    .ap_start( ap_start ),
    .interrupt( interrupt ),
    .ap_ready( ap_ready ),
    .ap_done( ap_done ),
    .ap_idle( ap_idle ),
    .ap_return( ap_return ),
    .a( a ),
    .b( b ),
    .M( M )
);

arraycopy_aximm_gmem_m_axi #(
    .USER_DW( 32 ),
    .USER_AW( 32 ),
    .USER_MAXREQS( 5 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM_CACHE_VALUE ))
arraycopy_aximm_gmem_m_axi_U(
    .AWVALID( m_axi_gmem_AWVALID ),
    .AWREADY( m_axi_gmem_AWREADY ),
    .AWADDR( m_axi_gmem_AWADDR ),
    .AWID( m_axi_gmem_AWID ),
    .AWLEN( m_axi_gmem_AWLEN ),
    .AWSIZE( m_axi_gmem_AWSIZE ),
    .AWBURST( m_axi_gmem_AWBURST ),
    .AWLOCK( m_axi_gmem_AWLOCK ),
    .AWCACHE( m_axi_gmem_AWCACHE ),
    .AWPROT( m_axi_gmem_AWPROT ),
    .AWQOS( m_axi_gmem_AWQOS ),
    .AWREGION( m_axi_gmem_AWREGION ),
    .AWUSER( m_axi_gmem_AWUSER ),
    .WVALID( m_axi_gmem_WVALID ),
    .WREADY( m_axi_gmem_WREADY ),
    .WDATA( m_axi_gmem_WDATA ),
    .WSTRB( m_axi_gmem_WSTRB ),
    .WLAST( m_axi_gmem_WLAST ),
    .WID( m_axi_gmem_WID ),
    .WUSER( m_axi_gmem_WUSER ),
    .ARVALID( m_axi_gmem_ARVALID ),
    .ARREADY( m_axi_gmem_ARREADY ),
    .ARADDR( m_axi_gmem_ARADDR ),
    .ARID( m_axi_gmem_ARID ),
    .ARLEN( m_axi_gmem_ARLEN ),
    .ARSIZE( m_axi_gmem_ARSIZE ),
    .ARBURST( m_axi_gmem_ARBURST ),
    .ARLOCK( m_axi_gmem_ARLOCK ),
    .ARCACHE( m_axi_gmem_ARCACHE ),
    .ARPROT( m_axi_gmem_ARPROT ),
    .ARQOS( m_axi_gmem_ARQOS ),
    .ARREGION( m_axi_gmem_ARREGION ),
    .ARUSER( m_axi_gmem_ARUSER ),
    .RVALID( m_axi_gmem_RVALID ),
    .RREADY( m_axi_gmem_RREADY ),
    .RDATA( m_axi_gmem_RDATA ),
    .RLAST( m_axi_gmem_RLAST ),
    .RID( m_axi_gmem_RID ),
    .RUSER( m_axi_gmem_RUSER ),
    .RRESP( m_axi_gmem_RRESP ),
    .BVALID( m_axi_gmem_BVALID ),
    .BREADY( m_axi_gmem_BREADY ),
    .BRESP( m_axi_gmem_BRESP ),
    .BID( m_axi_gmem_BID ),
    .BUSER( m_axi_gmem_BUSER ),
    .ACLK( ap_clk ),
    .ARESET( ap_rst_n_inv ),
    .ACLK_EN( arraycopy_aximm_gmem_m_axi_U_ap_dummy_ce ),
    .I_ARVALID( gmem_ARVALID ),
    .I_ARREADY( gmem_ARREADY ),
    .I_ARADDR( gmem_ARADDR ),
    .I_ARID( gmem_ARID ),
    .I_ARLEN( gmem_ARLEN ),
    .I_ARSIZE( gmem_ARSIZE ),
    .I_ARLOCK( gmem_ARLOCK ),
    .I_ARCACHE( gmem_ARCACHE ),
    .I_ARQOS( gmem_ARQOS ),
    .I_ARPROT( gmem_ARPROT ),
    .I_ARUSER( gmem_ARUSER ),
    .I_ARBURST( gmem_ARBURST ),
    .I_ARREGION( gmem_ARREGION ),
    .I_RVALID( gmem_RVALID ),
    .I_RREADY( gmem_RREADY ),
    .I_RDATA( gmem_RDATA ),
    .I_RID( gmem_RID ),
    .I_RUSER( gmem_RUSER ),
    .I_RRESP( gmem_RRESP ),
    .I_RLAST( gmem_RLAST ),
    .I_AWVALID( gmem_AWVALID ),
    .I_AWREADY( gmem_AWREADY ),
    .I_AWADDR( gmem_AWADDR ),
    .I_AWID( gmem_AWID ),
    .I_AWLEN( gmem_AWLEN ),
    .I_AWSIZE( gmem_AWSIZE ),
    .I_AWLOCK( gmem_AWLOCK ),
    .I_AWCACHE( gmem_AWCACHE ),
    .I_AWQOS( gmem_AWQOS ),
    .I_AWPROT( gmem_AWPROT ),
    .I_AWUSER( gmem_AWUSER ),
    .I_AWBURST( gmem_AWBURST ),
    .I_AWREGION( gmem_AWREGION ),
    .I_WVALID( gmem_WVALID ),
    .I_WREADY( gmem_WREADY ),
    .I_WDATA( gmem_WDATA ),
    .I_WID( gmem_WID ),
    .I_WUSER( gmem_WUSER ),
    .I_WLAST( gmem_WLAST ),
    .I_WSTRB( gmem_WSTRB ),
    .I_BVALID( gmem_BVALID ),
    .I_BREADY( gmem_BREADY ),
    .I_BRESP( gmem_BRESP ),
    .I_BID( gmem_BID ),
    .I_BUSER( gmem_BUSER )
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

/// ap_reg_ioackin_gmem_ARREADY assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ioackin_gmem_ARREADY
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_gmem_ARREADY <= ap_const_logic_0;
    end else begin
        if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(ap_const_logic_0 == ap_sig_ioackin_gmem_ARREADY)) | (~(ap_const_logic_0 == ap_sig_ioackin_gmem_ARREADY) & (ap_const_logic_1 == ap_sig_cseq_ST_st15_fsm_14)))) begin
            ap_reg_ioackin_gmem_ARREADY <= ap_const_logic_0;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (ap_const_logic_1 == gmem_ARREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st15_fsm_14) & (ap_const_logic_1 == gmem_ARREADY)))) begin
            ap_reg_ioackin_gmem_ARREADY <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ioackin_gmem_AWREADY assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ioackin_gmem_AWREADY
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_gmem_AWREADY <= ap_const_logic_0;
    end else begin
        if ((((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) & ~((gmem_RVALID == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_gmem_AWREADY))) | (~((gmem_RVALID == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_gmem_AWREADY)) & (ap_const_logic_1 == ap_sig_cseq_ST_st21_fsm_20)))) begin
            ap_reg_ioackin_gmem_AWREADY <= ap_const_logic_0;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) & (ap_const_logic_1 == gmem_AWREADY) & ~(gmem_RVALID == ap_const_logic_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st21_fsm_20) & (ap_const_logic_1 == gmem_AWREADY) & ~(gmem_RVALID == ap_const_logic_0)))) begin
            ap_reg_ioackin_gmem_AWREADY <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ioackin_gmem_WREADY assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ioackin_gmem_WREADY
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_gmem_WREADY <= ap_const_logic_0;
    end else begin
        if ((((ap_const_logic_1 == ap_sig_cseq_ST_st22_fsm_21) & ~(ap_const_logic_0 == ap_sig_ioackin_gmem_WREADY)) | (~(ap_const_logic_0 == ap_sig_ioackin_gmem_WREADY) & (ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8)))) begin
            ap_reg_ioackin_gmem_WREADY <= ap_const_logic_0;
        end else if ((((ap_const_logic_1 == gmem_WREADY) & (ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st22_fsm_21) & (ap_const_logic_1 == gmem_WREADY)))) begin
            ap_reg_ioackin_gmem_WREADY <= ap_const_logic_1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (~(gmem_BVALID == ap_const_logic_0)) begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st26_fsm_25)) begin
            i_reg_121 <= i_1_reg_325;
        end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12)) begin
            i_reg_121 <= ap_const_lv6_1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (~(gmem_BVALID == ap_const_logic_0)) begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st26_fsm_25)) begin
            max1_reg_111 <= p_max_reg_348;
        end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12)) begin
            max1_reg_111 <= tmp_9_reg_296;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        M_assign_reg_280 <= M_assign_fu_177_p3;
        a1_reg_274 <= {{a[ap_const_lv32_1F : ap_const_lv32_2]}};
        b3_reg_268 <= {{b[ap_const_lv32_1F : ap_const_lv32_2]}};
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st14_fsm_13) & ~(tmp_3_fu_211_p2 == ap_const_lv1_0))) begin
        a2_sum_reg_315 <= a2_sum_fu_220_p2;
        b4_sum_reg_320 <= b4_sum_fu_225_p2;
        i_1_reg_325 <= i_1_fu_230_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if ((~((gmem_RVALID == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_gmem_AWREADY)) & (ap_const_logic_1 == ap_sig_cseq_ST_st21_fsm_20))) begin
        max_reg_336 <= gmem_RDATA;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st22_fsm_21) & ~(ap_const_logic_0 == ap_sig_ioackin_gmem_WREADY))) begin
        p_max_reg_348 <= p_max_fu_261_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12) & ~(gmem_BVALID == ap_const_logic_0))) begin
        tmp_2_cast_reg_302[29 : 0] <= tmp_2_cast_fu_205_p1[29 : 0];
        tmp_5_cast_reg_307[29 : 0] <= tmp_5_cast_fu_208_p1[29 : 0];
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) & ~((gmem_RVALID == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_gmem_AWREADY)))) begin
        tmp_9_reg_296 <= gmem_RDATA;
    end
end

/// ap_done assign process. ///
always @ (ap_sig_cseq_ST_st14_fsm_13 or tmp_3_fu_211_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st14_fsm_13) & (tmp_3_fu_211_p2 == ap_const_lv1_0))) begin
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
always @ (ap_sig_cseq_ST_st14_fsm_13 or tmp_3_fu_211_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st14_fsm_13) & (tmp_3_fu_211_p2 == ap_const_lv1_0))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st13_fsm_12 assign process. ///
always @ (ap_sig_bdd_265)
begin
    if (ap_sig_bdd_265) begin
        ap_sig_cseq_ST_st13_fsm_12 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st13_fsm_12 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st14_fsm_13 assign process. ///
always @ (ap_sig_bdd_279)
begin
    if (ap_sig_bdd_279) begin
        ap_sig_cseq_ST_st14_fsm_13 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st14_fsm_13 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st15_fsm_14 assign process. ///
always @ (ap_sig_bdd_297)
begin
    if (ap_sig_bdd_297) begin
        ap_sig_cseq_ST_st15_fsm_14 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st15_fsm_14 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st1_fsm_0 assign process. ///
always @ (ap_sig_bdd_67)
begin
    if (ap_sig_bdd_67) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st21_fsm_20 assign process. ///
always @ (ap_sig_bdd_306)
begin
    if (ap_sig_bdd_306) begin
        ap_sig_cseq_ST_st21_fsm_20 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st21_fsm_20 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st22_fsm_21 assign process. ///
always @ (ap_sig_bdd_318)
begin
    if (ap_sig_bdd_318) begin
        ap_sig_cseq_ST_st22_fsm_21 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st22_fsm_21 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st26_fsm_25 assign process. ///
always @ (ap_sig_bdd_331)
begin
    if (ap_sig_bdd_331) begin
        ap_sig_cseq_ST_st26_fsm_25 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st26_fsm_25 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st2_fsm_1 assign process. ///
always @ (ap_sig_bdd_235)
begin
    if (ap_sig_bdd_235) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st8_fsm_7 assign process. ///
always @ (ap_sig_bdd_248)
begin
    if (ap_sig_bdd_248) begin
        ap_sig_cseq_ST_st8_fsm_7 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st8_fsm_7 = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_st9_fsm_8 assign process. ///
always @ (ap_sig_bdd_365)
begin
    if (ap_sig_bdd_365) begin
        ap_sig_cseq_ST_st9_fsm_8 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st9_fsm_8 = ap_const_logic_0;
    end
end

/// ap_sig_ioackin_gmem_ARREADY assign process. ///
always @ (gmem_ARREADY or ap_reg_ioackin_gmem_ARREADY)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_gmem_ARREADY)) begin
        ap_sig_ioackin_gmem_ARREADY = gmem_ARREADY;
    end else begin
        ap_sig_ioackin_gmem_ARREADY = ap_const_logic_1;
    end
end

/// ap_sig_ioackin_gmem_AWREADY assign process. ///
always @ (gmem_AWREADY or ap_reg_ioackin_gmem_AWREADY)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_gmem_AWREADY)) begin
        ap_sig_ioackin_gmem_AWREADY = gmem_AWREADY;
    end else begin
        ap_sig_ioackin_gmem_AWREADY = ap_const_logic_1;
    end
end

/// ap_sig_ioackin_gmem_WREADY assign process. ///
always @ (gmem_WREADY or ap_reg_ioackin_gmem_WREADY)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_gmem_WREADY)) begin
        ap_sig_ioackin_gmem_WREADY = gmem_WREADY;
    end else begin
        ap_sig_ioackin_gmem_WREADY = ap_const_logic_1;
    end
end

/// gmem_ARADDR assign process. ///
always @ (ap_sig_cseq_ST_st2_fsm_1 or ap_sig_cseq_ST_st15_fsm_14 or tmp_5_fu_185_p1 or a2_sum_cast_fu_236_p1 or ap_reg_ioackin_gmem_ARREADY)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_gmem_ARREADY)) begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st15_fsm_14)) begin
            gmem_ARADDR = a2_sum_cast_fu_236_p1;
        end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
            gmem_ARADDR = tmp_5_fu_185_p1;
        end else begin
            gmem_ARADDR = 'bx;
        end
    end else begin
        gmem_ARADDR = 'bx;
    end
end

/// gmem_ARVALID assign process. ///
always @ (ap_sig_cseq_ST_st2_fsm_1 or ap_sig_cseq_ST_st15_fsm_14 or ap_reg_ioackin_gmem_ARREADY)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (ap_const_logic_0 == ap_reg_ioackin_gmem_ARREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st15_fsm_14) & (ap_const_logic_0 == ap_reg_ioackin_gmem_ARREADY)))) begin
        gmem_ARVALID = ap_const_logic_1;
    end else begin
        gmem_ARVALID = ap_const_logic_0;
    end
end

/// gmem_AWADDR assign process. ///
always @ (ap_sig_cseq_ST_st8_fsm_7 or ap_sig_cseq_ST_st21_fsm_20 or tmp_2_fu_195_p1 or b4_sum_cast_fu_246_p1 or ap_sig_bdd_527)
begin
    if (ap_sig_bdd_527) begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st21_fsm_20)) begin
            gmem_AWADDR = b4_sum_cast_fu_246_p1;
        end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7)) begin
            gmem_AWADDR = tmp_2_fu_195_p1;
        end else begin
            gmem_AWADDR = 'bx;
        end
    end else begin
        gmem_AWADDR = 'bx;
    end
end

/// gmem_AWVALID assign process. ///
always @ (gmem_RVALID or ap_sig_cseq_ST_st8_fsm_7 or ap_sig_cseq_ST_st21_fsm_20 or ap_reg_ioackin_gmem_AWREADY)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) & ~(gmem_RVALID == ap_const_logic_0) & (ap_const_logic_0 == ap_reg_ioackin_gmem_AWREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st21_fsm_20) & ~(gmem_RVALID == ap_const_logic_0) & (ap_const_logic_0 == ap_reg_ioackin_gmem_AWREADY)))) begin
        gmem_AWVALID = ap_const_logic_1;
    end else begin
        gmem_AWVALID = ap_const_logic_0;
    end
end

/// gmem_BREADY assign process. ///
always @ (gmem_BVALID or ap_sig_cseq_ST_st13_fsm_12 or ap_sig_cseq_ST_st26_fsm_25)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st13_fsm_12) & ~(gmem_BVALID == ap_const_logic_0)) | (~(gmem_BVALID == ap_const_logic_0) & (ap_const_logic_1 == ap_sig_cseq_ST_st26_fsm_25)))) begin
        gmem_BREADY = ap_const_logic_1;
    end else begin
        gmem_BREADY = ap_const_logic_0;
    end
end

/// gmem_RREADY assign process. ///
always @ (gmem_RVALID or ap_sig_cseq_ST_st8_fsm_7 or ap_sig_ioackin_gmem_AWREADY or ap_sig_cseq_ST_st21_fsm_20)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st8_fsm_7) & ~((gmem_RVALID == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_gmem_AWREADY))) | (~((gmem_RVALID == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_gmem_AWREADY)) & (ap_const_logic_1 == ap_sig_cseq_ST_st21_fsm_20)))) begin
        gmem_RREADY = ap_const_logic_1;
    end else begin
        gmem_RREADY = ap_const_logic_0;
    end
end

/// gmem_WDATA assign process. ///
always @ (tmp_9_reg_296 or max_reg_336 or ap_sig_cseq_ST_st22_fsm_21 or ap_reg_ioackin_gmem_WREADY or ap_sig_cseq_ST_st9_fsm_8)
begin
    if ((ap_const_logic_0 == ap_reg_ioackin_gmem_WREADY)) begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st22_fsm_21)) begin
            gmem_WDATA = max_reg_336;
        end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8)) begin
            gmem_WDATA = tmp_9_reg_296;
        end else begin
            gmem_WDATA = 'bx;
        end
    end else begin
        gmem_WDATA = 'bx;
    end
end

/// gmem_WVALID assign process. ///
always @ (ap_sig_cseq_ST_st22_fsm_21 or ap_reg_ioackin_gmem_WREADY or ap_sig_cseq_ST_st9_fsm_8)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st9_fsm_8) & (ap_const_logic_0 == ap_reg_ioackin_gmem_WREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st22_fsm_21) & (ap_const_logic_0 == ap_reg_ioackin_gmem_WREADY)))) begin
        gmem_WVALID = ap_const_logic_1;
    end else begin
        gmem_WVALID = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_start or ap_CS_fsm or gmem_RVALID or gmem_BVALID or ap_sig_ioackin_gmem_ARREADY or ap_sig_ioackin_gmem_AWREADY or tmp_3_fu_211_p2 or ap_sig_ioackin_gmem_WREADY)
begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(ap_const_logic_0 == ap_sig_ioackin_gmem_ARREADY)) begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        ap_ST_st3_fsm_2 : 
        begin
            ap_NS_fsm = ap_ST_st4_fsm_3;
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        ap_ST_st5_fsm_4 : 
        begin
            ap_NS_fsm = ap_ST_st6_fsm_5;
        end
        ap_ST_st6_fsm_5 : 
        begin
            ap_NS_fsm = ap_ST_st7_fsm_6;
        end
        ap_ST_st7_fsm_6 : 
        begin
            ap_NS_fsm = ap_ST_st8_fsm_7;
        end
        ap_ST_st8_fsm_7 : 
        begin
            if (~((gmem_RVALID == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_gmem_AWREADY))) begin
                ap_NS_fsm = ap_ST_st9_fsm_8;
            end else begin
                ap_NS_fsm = ap_ST_st8_fsm_7;
            end
        end
        ap_ST_st9_fsm_8 : 
        begin
            if (~(ap_const_logic_0 == ap_sig_ioackin_gmem_WREADY)) begin
                ap_NS_fsm = ap_ST_st10_fsm_9;
            end else begin
                ap_NS_fsm = ap_ST_st9_fsm_8;
            end
        end
        ap_ST_st10_fsm_9 : 
        begin
            ap_NS_fsm = ap_ST_st11_fsm_10;
        end
        ap_ST_st11_fsm_10 : 
        begin
            ap_NS_fsm = ap_ST_st12_fsm_11;
        end
        ap_ST_st12_fsm_11 : 
        begin
            ap_NS_fsm = ap_ST_st13_fsm_12;
        end
        ap_ST_st13_fsm_12 : 
        begin
            if (~(gmem_BVALID == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st14_fsm_13;
            end else begin
                ap_NS_fsm = ap_ST_st13_fsm_12;
            end
        end
        ap_ST_st14_fsm_13 : 
        begin
            if ((tmp_3_fu_211_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st15_fsm_14;
            end
        end
        ap_ST_st15_fsm_14 : 
        begin
            if (~(ap_const_logic_0 == ap_sig_ioackin_gmem_ARREADY)) begin
                ap_NS_fsm = ap_ST_st16_fsm_15;
            end else begin
                ap_NS_fsm = ap_ST_st15_fsm_14;
            end
        end
        ap_ST_st16_fsm_15 : 
        begin
            ap_NS_fsm = ap_ST_st17_fsm_16;
        end
        ap_ST_st17_fsm_16 : 
        begin
            ap_NS_fsm = ap_ST_st18_fsm_17;
        end
        ap_ST_st18_fsm_17 : 
        begin
            ap_NS_fsm = ap_ST_st19_fsm_18;
        end
        ap_ST_st19_fsm_18 : 
        begin
            ap_NS_fsm = ap_ST_st20_fsm_19;
        end
        ap_ST_st20_fsm_19 : 
        begin
            ap_NS_fsm = ap_ST_st21_fsm_20;
        end
        ap_ST_st21_fsm_20 : 
        begin
            if (~((gmem_RVALID == ap_const_logic_0) | (ap_const_logic_0 == ap_sig_ioackin_gmem_AWREADY))) begin
                ap_NS_fsm = ap_ST_st22_fsm_21;
            end else begin
                ap_NS_fsm = ap_ST_st21_fsm_20;
            end
        end
        ap_ST_st22_fsm_21 : 
        begin
            if (~(ap_const_logic_0 == ap_sig_ioackin_gmem_WREADY)) begin
                ap_NS_fsm = ap_ST_st23_fsm_22;
            end else begin
                ap_NS_fsm = ap_ST_st22_fsm_21;
            end
        end
        ap_ST_st23_fsm_22 : 
        begin
            ap_NS_fsm = ap_ST_st24_fsm_23;
        end
        ap_ST_st24_fsm_23 : 
        begin
            ap_NS_fsm = ap_ST_st25_fsm_24;
        end
        ap_ST_st25_fsm_24 : 
        begin
            ap_NS_fsm = ap_ST_st26_fsm_25;
        end
        ap_ST_st26_fsm_25 : 
        begin
            if (~(gmem_BVALID == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st14_fsm_13;
            end else begin
                ap_NS_fsm = ap_ST_st26_fsm_25;
            end
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign M_assign_fu_177_p3 = ((or_cond_fu_167_p2[0:0]===1'b1)? ap_const_lv6_20: tmp_4_fu_173_p1);
assign a2_sum_cast_fu_236_p1 = a2_sum_reg_315;
assign a2_sum_fu_220_p2 = (tmp_4_cast_fu_216_p1 + tmp_5_cast_reg_307);
assign ap_return = max1_reg_111;

/// ap_rst_n_inv assign process. ///
always @ (ap_rst_n)
begin
    ap_rst_n_inv = ~ap_rst_n;
end

/// ap_sig_bdd_235 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_235 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end

/// ap_sig_bdd_248 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_248 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_7]);
end

/// ap_sig_bdd_265 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_265 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_C]);
end

/// ap_sig_bdd_279 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_279 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_D]);
end

/// ap_sig_bdd_297 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_297 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_E]);
end

/// ap_sig_bdd_306 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_306 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_14]);
end

/// ap_sig_bdd_318 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_318 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_15]);
end

/// ap_sig_bdd_331 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_331 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_19]);
end

/// ap_sig_bdd_365 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_365 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_8]);
end

/// ap_sig_bdd_527 assign process. ///
always @ (gmem_RVALID or ap_reg_ioackin_gmem_AWREADY)
begin
    ap_sig_bdd_527 = (~(gmem_RVALID == ap_const_logic_0) & (ap_const_logic_0 == ap_reg_ioackin_gmem_AWREADY));
end

/// ap_sig_bdd_67 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_67 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end
assign arraycopy_aximm_AXILiteS_s_axi_U_ap_dummy_ce = ap_const_logic_1;
assign arraycopy_aximm_gmem_m_axi_U_ap_dummy_ce = ap_const_logic_1;
assign b4_sum_cast_fu_246_p1 = b4_sum_reg_320;
assign b4_sum_fu_225_p2 = (tmp_4_cast_fu_216_p1 + tmp_2_cast_reg_302);
assign gmem_ARBURST = ap_const_lv2_0;
assign gmem_ARCACHE = ap_const_lv4_0;
assign gmem_ARID = ap_const_lv1_0;
assign gmem_ARLEN = ap_const_lv32_1;
assign gmem_ARLOCK = ap_const_lv2_0;
assign gmem_ARPROT = ap_const_lv3_0;
assign gmem_ARQOS = ap_const_lv4_0;
assign gmem_ARREGION = ap_const_lv4_0;
assign gmem_ARSIZE = ap_const_lv3_0;
assign gmem_ARUSER = ap_const_lv1_0;
assign gmem_AWBURST = ap_const_lv2_0;
assign gmem_AWCACHE = ap_const_lv4_0;
assign gmem_AWID = ap_const_lv1_0;
assign gmem_AWLEN = ap_const_lv32_1;
assign gmem_AWLOCK = ap_const_lv2_0;
assign gmem_AWPROT = ap_const_lv3_0;
assign gmem_AWQOS = ap_const_lv4_0;
assign gmem_AWREGION = ap_const_lv4_0;
assign gmem_AWSIZE = ap_const_lv3_0;
assign gmem_AWUSER = ap_const_lv1_0;
assign gmem_WID = ap_const_lv1_0;
assign gmem_WLAST = ap_const_logic_0;
assign gmem_WSTRB = ap_const_lv4_F;
assign gmem_WUSER = ap_const_lv1_0;
assign i_1_fu_230_p2 = (i_reg_121 + ap_const_lv6_1);
assign or_cond_fu_167_p2 = (tmp_fu_153_p3 | tmp_1_fu_161_p2);
assign p_max_fu_261_p3 = ((tmp_6_fu_256_p2[0:0]===1'b1)? max_reg_336: max1_reg_111);
assign tmp_1_fu_161_p2 = ($signed(M) > $signed(32'b100000)? 1'b1: 1'b0);
assign tmp_2_cast_fu_205_p1 = b3_reg_268;
assign tmp_2_fu_195_p1 = b3_reg_268;
assign tmp_3_fu_211_p2 = (i_reg_121 < M_assign_reg_280? 1'b1: 1'b0);
assign tmp_4_cast_fu_216_p1 = i_reg_121;
assign tmp_4_fu_173_p1 = M[5:0];
assign tmp_5_cast_fu_208_p1 = a1_reg_274;
assign tmp_5_fu_185_p1 = a1_reg_274;
assign tmp_6_fu_256_p2 = ($signed(max1_reg_111) < $signed(max_reg_336)? 1'b1: 1'b0);
assign tmp_fu_153_p3 = M[ap_const_lv32_1F];
always @ (posedge ap_clk)
begin
    tmp_2_cast_reg_302[30] <= 1'b0;
    tmp_5_cast_reg_307[30] <= 1'b0;
end



endmodule //arraycopy_aximm
