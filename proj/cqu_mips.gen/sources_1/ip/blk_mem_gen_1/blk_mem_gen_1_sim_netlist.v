// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Jan  2 21:00:00 2025
// Host        : napbad-archlinux running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim
//               /home/napbad/Project/cqu_mips/proj/cqu_mips.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v
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
cjy1ogL2OFjrX6WWnDcAvz+T26+pLY4ToK0=
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
