// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Sat Jan  4 17:47:51 2025
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
n2WuJiNZo2ri93zT/VKGud0pS8hMYxFSh2Q=
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
