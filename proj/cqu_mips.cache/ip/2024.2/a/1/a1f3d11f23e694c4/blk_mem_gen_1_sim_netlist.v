// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Jan  2 21:00:00 2025
// Host        : napbad-archlinux running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [4:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [3:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [4:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "5" *) 
  (* C_ADDRB_WIDTH = "5" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.53845 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "32" *) 
  (* C_READ_DEPTH_B = "32" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "32" *) 
  (* C_WRITE_DEPTH_B = "32" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[4:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[4:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0}));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19552)
`pragma protect data_block
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
bQ==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
