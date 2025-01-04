// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sun Jan  5 02:13:21 2025
// Host        : ZHANGHW running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Projects/cqu_mips/proj/cqu_mips.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_1
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
  blk_mem_gen_1_blk_mem_gen_v8_4_9 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19520)
`pragma protect data_block
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
1UB2KlYSsnUnOGSLuTn7FW7eIcwTBnLmMWg=
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
