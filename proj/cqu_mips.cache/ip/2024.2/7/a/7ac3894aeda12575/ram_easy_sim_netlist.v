// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Fri Jan  3 15:18:26 2025
// Host        : napbad-archlinux running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ram_easy_sim_netlist.v
// Design      : ram_easy
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_easy,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [4:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
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
  (* C_BYTE_SIZE = "9" *) 
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
  (* C_INIT_FILE = "ram_easy.mem" *) 
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
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
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
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
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
kCpjOECYLqe4k4sYy0SLuZE+9+LT6khJ5V+JO+KnkVtOV4O98/2UP2IINm+PAuQcPy10hycoNkWT
4z/V3qNC8oTz/LxjZ8E6OBEWL1K7394hkPTqeZflDJ4yHy22ckfJJDi40BzGFGpsoXkvPHrK3dVB
1fWzK8mqV0mt0KB1mxiEs5bFLBOfuW4Sv5ihQ092z8dzBq16b6PXFkfAUOQkSBmc/iw7JMJCdItu
p9zxYnzpVI3Yg1yV+qrcimw3+14ILCTlwdWMrFcm0dh4rOv/eokWFOXUlFQzWnNzrr1aC8bTdFkv
tnwARPZfbKgY0LAcZHuRIuB4o7tYqCP7Qc8SmLxnM/3gjPyZflHxD17ASr4QSBUB1l1SirL+RY19
F+XU5IjI+2cpxGW00QwrkjOS+TTTEtUXZcpnPWUOPbP0ciimUKEAlx7sCv3d+N3KOtXU6Ikwk+Ru
390qzd5EuE10GVFXyLB8z3Xs83UxHiiMx+lWsp/a87mbbs69bJydE2pOUPdT4BUMkaGZxuRjOQBK
mfSSZTDtj7pXcqcFa+oRMaWWN+Rw69hA1Eo8LJoI4gjyqmn+dv1/lIwAjasRhDwWa/i5QX6r/CFu
o8+gnJoPA2TsIY2C7QortVxcy5jjlTxZK37UeXjLaN5QhjBxF5PDK3L2WGORXdSZNJT/tZtQvUgg
vDxYU5OZfwZudQosDJATAGWUUC6AgDgr4LVGRTuX9gYOmmxdyVEcQuTmlF8RE8R5VyAlKDF3aIH5
YEMqWkdSM7aPjBa4RX4HpfDLSIUTMKzmkI3WyqPS0qXh0lx2JsVRU+5FPGkn4U918PTEpprf7hl1
d31nazq8Gs+c/h0EFi6dFHaRnlf9/TzZC+/VQFapjy7PD0zOWK/bt4Wwf+2jjWWMlSTRzfhnTlvp
+1pkxexwV77VsXLOma3VYtQRZMlXOzGOLDSOrZeIwM1hb6MXKuThCLBMoXnRQ2IIg+NHyDqdPVKJ
HQXXvDBwmDgc2a5kxzNuUsTyJHjgjJZJjSAiL6QddTK82Qla4kORvuvA3Lf+gcFcjo9r6zXGogR8
9hH96ByZACV2fSWq+kcuaNyC/66MLF6yVfDt1aV9fJzUo3Cq//wyTaZ4NuY3b1kcJ/+vNPgpjR+8
jK4LdD6Oi0U1cTpQZV2tS4ORa5LH2OpgVnug3I2CI2T48uDHTGYaGJHi/Fkpkde34eOp4fU+wm4J
8L1CztUxp31i/sQGSjo3Dk3f7cxoHje/hxnRsipwewacG4k3f2XFtTnWyAVD9JIWgO1hlMbhau6g
F+3W8LRt+1BMIAM6vW3CyrgY4HNdGy6vNdGH5wPt0SsxSNRsG7SsYtS0ADZhyCfY6ugCTAmrLmfR
gRlt/ebGSR/+7kc7KsvyXm2qLmgKp6LTqQymYQSbyIpd9xl1XrO9XAsV8OtBTRblc/p71P+jQvdX
Jn/0crmtyM0+WGtOGtDmQ1F8lntyWBRsq9TTvbNVKJbtRGbmhYgrI3Fk++G3QZiTbsKjzS+92ucl
8eL/0OaCedxanW/i8a6nhMa8t2ce/Nmsg95rFj+Ewu3yLPv1yshxQpzmBWqNQqgyENJe1JgL5ya0
SRO70tDu1YyX/GBOowNyofrgZ5GfuGz/Gxjdq02xBxn60HGsAPLoiVHvSykjJs7hy3NQkHDB8l9u
H24/L6drm9jvxr+iAppc5oQlk+e1nf9Ir2tW7FqWdoowpT7s3LcdUwgIFn1676Kzr4kc1+w66nTH
iKelrrW2tQwsCO42bFZCtruLc+uzru2VzNagEIdgqAg2F423XRUx+Oy6w+5CY8jsiaJMSY6YWmfY
Nitt4lFX+3+btNOoUwTQHNwPSCqpqpJuEu4+3Ad4GjGglFZtE7OubxcawCg3zxRjA29g8q+tildB
lIk+Z5qk0xFFaWwBrftAEQ6tlaziKismQcJA8vrw8jT3wyKa5EfhV+1bpzmhV3aX+qvFJwxg0osW
1MEE++yj7rfI+vIhkmAlr3KuVxV+AIZz2l7G/ofWrhncIJo4/VsYTkDLCPvwKmqFvkkTJW3ZocMd
A0U4+apkHfIWkvytUxEo1UC5BS3825RbvIyhERKGnEb/qAnwSUX3R4aJd/URvOIkMmtfX1CN/Abw
SejB7qVHByNxlL3cUaBJIhX+NolNW3af1vpcgerHTaq6eYp3+5kbHaFFyHpe1LGlApZmUHqdqGKQ
em3v0OzA3XTsvouzAu4bvTTkzMBFgg0n5zKYbUTIebsLf9ThBcGeWQO1GKkMAXebyKDd8figR8ua
FwStysvi3xF4on+bShFr08y2UuGvLgdKi0po3+5RPEGzXtaHow0AyBeWeKfo5KvqLbcoCDhF059p
aQWvllHkQZ3OVcQ7odkZDEsjDmwBV1ueDM1pinrMi6MUFQ3hj/rLCUEhZRUOtVrkqj9ZlT7Bcf9u
BhPgxm0/kLO5woVcmOziSsMlPiELjdaxnvqehWfWQ0m0tz4a3zS9vWi/ETipe5ytpCz7oZzeyXzb
Ekamh0aHkOCPf5FsmJuqhznCnyeGpyL3YMfXOWqWHjO7p+ZcPCPwYb5GU7pMdQoHzGCUe/lJR/wT
1O9AYB3063RN/rY281oP3JhDDOh6vbWy4LVz8GxnZNnsWNEGZtLhPHp9xi7cbiXaZlPy3woygfrH
67MjSKnnFHKrvqSgK7oCdUJa3BBYzkAdEdRjZAAmgzFyu5+qVXp/ueR1+RDJTQzVaO1CHfRfbjzl
NDJuGqM9svif8Bf7t7GMDt2iRUgKfvZ6GbRQUn70KtGwEMQspmffS3NWJV50qRG+66cTDUgiu77x
z02CbMziBmA7JgFNDpW09TcScZw0rOAUlr2lFa5w4XkzJ7/bObPvC0/cp28hL7SKMviSCOSih9fR
KlVj8Cv75pJB/HGp5DpMPCSjwxXKYYEEywe5YUDmUw8KnfthEuntbGR6tHBNe3bJW+ShiOfToRGU
istN344lQslaJSIc9AWV48DvghsxAHXQJOGWg6VDvKtyovXIzc1VahFJ2dD4JbDSCgndhcf4yZ/M
CcUlzo84/LYZbvXVbyDe8n+62E9zVR5UiNIoWYw8V5Fk4L0Nhrgvup0xzqpGTQgiMC2JGxB5Djac
JZv8vjF7iDVW95qtvzX3j2syEwQ4nqE3oAVWLgd4oSW47LYhQW4pJIbikhSSiibUIcE22+LAwNAP
wVBHARt3jhcCyvcwfRObz8t2LNty+z+XVpY4CPZkldqE485gkYE2TPof+FdijBJDnMMI4M66G/jR
bIdb5F8EuNONDTGdRHiJMRDIgov9p/ce1N6lUbdtu0HjxLJ2eBeqzQ/6+xYr6eVD1KoFUL8K3jnu
Oihzddy/nEpUZXG3MxYOVeQ4zjCFY5gTIxHDTaJPUkeGh6sbjSLX4PDGThke7vPdxrAfoNS1dx2v
94CYwvUQM8uXJQr0Rg4j4kHqgSkHYeDBR4SsBf7Vf8XvlWcJVVd1VxEPBbL2WbhSDHPjPlC7IILe
L/tPgtU8ilGV0UXyzlwUeHjck9M6ExHj6KnJAZ6QScCJL55KVqL2a5LmXVa7zYFyr2WOHIU3ZVhp
V9yOi5YRNeankCwRFoYiSqecVkSHPVpxyqASyrOzuGtpYRQs3HbCWbe3IJOiV6Jy2UJVChkg7cUl
8o2bzFTfTGj8q7Wg34MG7QN+MKUjxpZBFTaQ7ZAz3Gw8haJa4B6Ztow+bn1R9ItTje2wYFn+ztP6
mQVTHMltwzoc+4gZ2XpdBZXcySHXC8eYOiK33ZY25zpm+HQ1+l31zUeYh6E1ZOd+ou3hEeezA5Pm
QsUt9l1c9tBPPj9Ts0mmhqX6xybvr3GEhIY/he6FjizlDLwfJ39vUIL7d2R8ZXLcKM0Q+htuAose
SN1guyUgJmjqZ+HHetFrdB8dfZ5k84O6Zz8Wb+hj/IC3Q/Vh1HxiX+o3GRgUPUAGiYLxTSPMvsD/
WzK0LK6wyp0PClzZWwZfxqUvvA3cahDltHdwWu0q15764HhFe+XNNfrg5rvQAVhKMIn6lgdv4Znf
vPVPxL2VJG3kZNb4qv/yt5hQyWbPiIGBD54dcmK3jlAXztznlLBmgAETp5hdqpocGjPP8F0kyz/v
5HqqNa8mKy43O7I0a4isNGZKeQhNrrtQcAFRyRlPBUdzXAJWs5nEL6rLNXTc2FAGwmwcqxPLUBp0
sAJOgTfhB39DzHaqxq5ZRpAJeEk6N3698ZBvOTk9vvBMkc3vxvrtH98CvaWEbvjo2i45iVbBHh98
zSptYGr+z06hRzvwBi9Ylk58kQWit4Fey38V+K+qt+YAj0GhWyTorXBm1ctf8fSM1g6TT2/osIIC
blWIT1ROXVEwtTf1drSyeTIVUdf65judHk60WFfv8IPpQToEPQHvabAm12b+/nCiyVMD6tBTFItm
aPPKnjBYBFGCvw/NR79M4gMNClhfOKqG5qrgXFMTaDIrTo0T0wErcvHTg4XWt8AI5ISqBKDtkTYk
rQpC6pDkL5uAsTWdbXoyUr17fA0XXKTwOU6UO9rjVCpiR9tEYIoVOYEEjxUEqMvdl1oeaC+rwWZP
+AkVR+R3Lz+e4xikMOGt90DNhT2lvRA2+Nsz2S07RgJzxq3XAkcPnj3TbmTeHZLwDUY2uRc5nffz
k3hbVeQ/JJiM3hTMHG1fT4REfjE7HkdEOPApRr0r7fBL0LfBaCYIwGJ3S1mRbMb7LzGk07Lq2aqi
nO9oe9WbfhZoHqypAlc62Dq/kfyLYj2lupp4ijAPRe4NXm/eni/QPeHmA4gycXh+7YQNB++WVibX
G/tsEKGa+vdqqr8KQGBnC7EfqnItURM3eKcuBDbIn0jME3edDVn6qSigMcDMRKoS6YbVWwpQ3Ps8
G0NPN2Bx5NfLvEV6g9bbPLh6rfU7947aQzvt4yVWI78XYB0bs+WVIgdUDI9IR8sQ4kMTUGrzaIC2
px/DZfqPwkPI5Qws4hMrtro/dD5zZ9VPGFZ3Ac2+exNm/f6VHpqThTthUUmsv3uSjE7tIWr0Zaby
HerEeCSQs/6pI0IJiB+wg1WwxQkN2hSNJjFNmSXoiG3LEs/oDPBC5ksQxuaUOLyT91S6ze+auS1o
SbtJYDSA4pRpWEWjRZK/4ZL1V4J3vU/TQ2uzkOnVLHP5C3/+eOJgOf6Ze6Qtn0uGiNCy5Ze7yr0Y
e0Zt8NTxzHkPk219b7s6Yp0QVJaovLRhsjfKsd/75jdfjFuJWSchtMlYU5auZC84I4yznTSpbkJy
HDdklmzJ2+wIzwKinEcWYJpuqyRA1VjhkZG/Z9Yl9h670kaabPxC5V3/yFloRzaIJz2kixAvsJiF
yd+TF+wUp9154xOsbjOVgI/8ItEckq/GfT3B27lXlv59TceSbteoCyclj4LaMpztAdByCZR2Tmd7
o9edXRtbCVg2sGdYd0hZ+81b/avxvyxCG68ymIyj+iCUn9jvUlCYDJlY1fyMdbztVeSVLz6jUVzn
W+MEMK1yPh2+dVlDFLJ4fbdIV2QDT2ksIae7ybpvGQDWZM0ZO6D4ZCQelt+6xH0jfUliSzxRPuPz
9UvRwql3u5gT8fEC4vrDSb2UGFdIEkgJejHsU3F0EdhbQgmYE/qQKNJA3RYQcg/F3hLQmgdMOHhs
Bc/wf4Cg6PDGJ8xYiDEOO4HJb9dR2pydu3F4FJ0haoIni3TpfosmsSifThGIdfaU6GoMrte6027t
dM7TtPHCW2kQ7oYRdvqbcSw8dcpGQ2lA2FRrf5zdLOb30EVQ2o0nrU/0TgHPFz/ClMaIJeI6sKGu
gKFaDYAmvM71KHZZ0tBUijhnzM1nsopGxhlko1AiNbqyijeTbLKlAatZHoLO4LkaaHOf3l83wLpS
7N/wTFeiREGDR5EHGzEcO3NbJgvTML1uWfVJ6yZDhg/qiXp7AGRkab6yNM/rjaBErgNov9Q2+Ppr
6oApVaQKIH1CjTg2SVqLOpGKL9mLaDpsElXPXE9qC3N8JV/5wNty/6bNPA1SOtFC9AGDn8XeQAAI
7LUOJahHSRGbJbQRyEV6h2MVKby9FYgmPDIN0zOMBjr3BOtQprS/dr1hmQ1l+PSNPwYQGTAfVl/L
3t2pJHn6xkvH11o31yVlbhSa7s8YNF0yvVX3ZR+INzSh346aDK+eoiy17AUGIExuwMxL2ytW7U0v
LcPxnT0E87bEiI/RsPgcNykjkdgrPHOevbgONkAO9bsEE6HrL6Ag3iNe7jz7N+JCah9e946Yfqpy
dFyCcE+Jktz/rqoMWaz2YFOnE0s/zjOXEvHYaC7lwE5wW+T5ZR9pvd+IWa2glp7AwoBrmPb2UBtM
1pwkv0JTHoCQFMD0BLjzYVlV7f87MVVPEsW5Vk4AZh2pYWVAUYBJqq0Ghu+AtYm1LM5pkKpE57Lo
EECYmcLpQf9cTkqcjBg8xDLgmdpiLQeuTJIdRAV8bzJBOEAne/lYiwMe14WZIDVZVb2iziPxTPIt
Nu/y1TFoiO2xiEkuyAQMsP7lOxNyHelsqh8cqc96OWc0XHI0o8wPvOG6UkyxcFpT8zeSyfKq/o3/
6Zw7UfwI4uMvaOiG5E6zc4GGI1CbOJH9UcC5BQtLZselltAEbmR9KdQrhlWzXSnnRxLpgGDEqywY
pnBDTXMbKMyja03wZWv6+Cmyuwq0okXoswWJbNrwOAfLsbaJRJA8iftAEnIltd6F73b3p4925H+F
kYnXkmuuSpJTv4Mb4AWNfGXCboFH65ZK1lIbJpd8VEv1Dt96KAAwRhjpDsn8K8mO77GBg5GxMDCh
yFHLz8VBK94iyhnoNmm/REw80NlfuWkDr9Y8Iw3GJXrGOs7tLfVuB+NFaOnybdrdHq126BB4w+0g
w+qVdwdRILDNJG/XSlNn3F5tS2bCJw4PzmKfdDmsmZsFWRDlFOUqKrIptNHwYX6K8AdhQ09mR7y6
IlNH/hsn/qpNkMMeorRUlx6sWIr7AnlIfiNrsXRjboKv42DeiZOwI8j8tQesOOzlNneT2LM/VkEo
7UFapGW8/K0HEMFQQORJXTeskn4Slt2v/A1odTm+9tu2l+JUyIv7hOijxFvBzO1PN6Id9dY9hcfd
t7aqi9y9p7ra0vKjL6UkaimCcXAjfWvE9i01OAvKIZrbx1fAWiCYNH/MiIohsVaYbXb5uXe+Om9/
hJMnSqkaigcuqWsp2i9txZ/QDwGKVt4zRRD/82ySkDUlzBjbkHGiATwsKeC6m1w5crmBwp+5Ikfa
bZJiAoB8fOieIEhDFD86bm+gynlTAibZdY/2wYW3kt10qe8Hfge27je5y97jegtoGzcN1bNL7Qzz
oWBm9HKbV6iH/eoi7KdGEZknDBI878ftEz99RvJsDUGSC0+ys0k0uQcRvCwrunsG0SRXwIaXIOFy
dDTFLwDoHpedXuPI848UQN+E7yqha8S2E8ALuZDDljjds7kcN0ZHFuj0MyW8ar3ZlzH6RkUQcRoZ
fNkQBJI2eInL0fzHLtvsfuPGxg6dhEvcTV2mo8Gt51IaGfqvO0BJ03RW/6jhd0wFhC0TIeMVHDFZ
OScWKu966hQE4pGB5kU/sSq8RU+KyRKs5hjzUwpVDFgp1YAfg/xNOmlsDA82xcWWO8zFqMvajGlU
uGWDh3NAyBmhdYVZSV5CvJ9b9aqOYpjfp/PQ0gYMDzzM6i/uldpY3WE86n9TflOaAUsTsK5jj0S7
w8VjCeSRmWqAmsFcZ/8cp4Mt74K7lm4qj5Pae9fSJ/am1BIGNAYEd77gsXjhHHIwi40WTdttinFJ
nklIQhlo2YAKWmQ0FbmbostRD2KloHFm+nMfk0NjXCcqsYM3BR9ikV/XrTHC7BwjCstZl9kA1HrY
3Joc0EmjW3G6jqH2o0OvnxL409FnbIEQslokvgbob81kz67gkT6yH37qVuOPuBlQx5ZJS4hk8La1
YR9J7n7HP72V93zMhmxFypv1u93vaSz7qcmhEFaDcMT2ECe20m3bKCgdMPXUL2u7US1SHtDUTR1m
wvc0MrYu+V6AysJL5MCm/txQ621WSunWF6QCC3cvnYa6vfprdnSJIDbk+gs4pxLeHpQS4btsOL1t
ZsU/8vRYrWCiAk7a5QmC5BjrU15VqlRjVHOgG36WxkgdtSrR9xS6xkZocRcHLiy42HiGnrVrZNhn
8htvihqekakQ2zInGQwiK2PsK3M3kkMKuP4z+E/FWmrEEzPzcoHNSDObRMpOl0IhddyaTzgYrfYr
T+7GT5UOg6KcdWM6+S37gVLUL4JMqbk4dO5iIC0dn0fHJsdf3APb2evfZzjseeN+vm3XRoNcfc9h
LaPH/DfuiLWG6Krc95vqIA5w+xAAMoXG488ww3x2OGoc6Ei0Hi82Q8ce6/HL/RAZvFD9bGSxN8CP
o4u6fpueohFWOuWc1YXG+sXLCZ9LJBLjgLtvlaOZlFo6sFqm3Qex4feKlHyCGSCeoSYNI2j2Ozvq
pkhifuQE1Xh+nJvyqNfH615znIyCKVOC8q93m4lNzIX/goKEq7i4RAd2iyd2FTkxrN1pUEUa/FMu
TcJAZpz2zmH0sievzL6Aj4cYqu/jOnNwKKnKzx2NzSUHanXOyZePlGAHaAqw09GZ+eGQuGdp25va
PrDc8Wst7rTaM5LJQEQvzPfafsYJ98Jc4tFGZ5AxoFkgi8Vb87BAo0X83d4AOHeprAhEmATjGj/V
vtuWVA5Pc0pN2QXP5S2nt1jPpFmnqxmBr033wmTNkrW9sTTRBWJiVXGBki4291zoEaaCQY5V7SlH
NPooBvKOZDv50acR6vg7ZNo35pIIT7nYMTE6HSfBmEfUZpF7R9MVx7OndbPsoTwZBmPEdP0A3k39
21JkgS83BH+H1tYp9dqCcLXzKvseRpSPh0B53vA7qUAGydf/WfOEPeu224vkdjL99Oag/5k/PM95
ns0fFJB6J+WvQKE2w+zH209MaPR3oZ6Kyqz85jO2gIOgHOOKNQrViAye58ToPJX/3DSZ9t+EqtVu
mLbcG4w7Bmi+5Yzt5qMsrDQYrG0m+1BnJxiwJiD718aZHRgi7eA9rlREbnPEwG8KiD8Km83Eq4Er
HVSoq1qpYvg2G/Q2C+FmxPaQW78/s+QM9raUK5X3dPtA9DCEeYqqIGKIWQ6Iv+NkOBnxAvDdAdyM
CQI/OIfPKdOI91ayMVYIY5CSK1Sx5ayQ6VPByt6PAKq40yCfjTLGHdOSP0EVrDZg2kh5N0fq60iT
yJSN2dZ3w8dInWZuzB1ltUCQaSxdDncaIctGKXZATm4T9CqAWJpmX2QjKTRcAP4jZycwem3q/aCC
EasLkFNgJMcY2YjHAqICKlFiU20/0vuQM8ZYPhyYdh6h8RPDWuQeApbFHfGv1I8fjZ49d9htJRrT
KhYUAdtBbtpx4lII2rbRH/E6RH2Q1tAKnolzKx0+478UbzHfNOo0HZTUwRC8Fju8IMOfCWR3hgpw
wWBJfwslCqXaHXVaZBy0+Gz/bK5Vsnn7Nq4wTPx3JlPGtrz7W7zwfxhlmEbKwUtPgiMnZlR2N9qE
f5oes/Q33DbMuzc8Ksge7o32QcE03ewuJVOua3Wb6S6iSJzGpGZdeGf05nXRsSiGk1+/j6V5lkt7
bwX/XwAyKhwxr5cTL84AOwx4VKc+YHlcccjkhLEkeO/3oe34Fz0VEIW8VXojSPxtmbVqw/Sipb76
fynEGljraHUXsAkoruIADl0MuEDXXCXjbVtsWy1k1I2TSIv1VGtEOILEsnclK8Roj7p7oLKK7cWi
BFaPA/ScvMPXJ+zeuI0HAVh8cLYX1LCBZphcVthtlsnHEljdJr+tx9YGYj/c/MeaV7jtYWNgjzzA
lXYxS3fRAjZ8NTCIuLD/t0Z8aRf2CFR97J6vug90pIMoijTpp/k5sOOU0zn/UG/aYC/zuBh9KO3M
tqk/NwyPf6VOxyql7Slf0hc3kCHZyWIyP51F/FVMOAKuaw0XHLZ/xcqnnXm507BupapzD7uD8gBz
1HS+LvZ+75VJBT5J2v7d+xNbVQ1DejPc/yvsDAsvGR4hIT8ChrwPbHE6cRx/N/35b50feJwXEctq
EtWkauPcxcrWYONDXzX4hv/sngRd8GNvKU7ceyHv/W9WYNxSiYthlEILWX/XfcXniql8O8xrur8f
v14N6OH6+FKvsexYaxn8r7PnLZL5FaYnlbZAuBXqiKSUPnas94PTbkSASUMGIZ+7c6P6SwPTL905
YFjngCeBF1MWdit26a66Hs/bzWWzbIto7x6GcOydDrPT7Em+xzdJ8Jpb3WhoztKch0ixzHiKwaq+
VQrIq5OvTiDIBow+/yd8xxj7zeGX02/sxWnDtWu3eY3xNN2LJjIz3I/RiitWcpDkxP3IMD/Yp+US
0k1jsOypYZYslAy/9yyEIY/7h5rZGwwq7suSuuuKRj9cfsjzBxiRp86T8X9u215AU4agKMl86dps
/JXTVR3n1y6PSzo/OXW3wirawqT8KDs8twjVwinywM3pdHo4xdSbIbbtKWCVNvqjoD+aIR+vNeA7
tAG09HE6aeTbj27KxyNXc+DZU4QFq37Cu0eiaV7/eoQXVq07bnICCYpmQyvLx7znATembK/zgJAx
emWJ14ylc/+S7YPn87/OsuU5oeC09e5V24nGJk0gKT3q3HkbQUsGHwZfREMxOb650ts06IEBbSfb
IAGXIOIbPLQtaLXzueg38/Mrz91kiEQC5u5rHmY+EjrLf8YjvpW8vgwTorgRTvHMsyI3sfTuaVu9
bmOT9V1+DteL7btIXrhIb8+xRXsY/81b2GC5iDBaFO+7t/qmPZtn9CZRWm7xp8lz1n8tfblBjcOB
OUG0MUHU5jwu30IqHdax6CrSu25t1w2eyt2yBSwvyWg8VCAhjrE47IbMrCY6K0XJ107Id7GPh+Fi
nsyQEZHcbrmb0Q4J4rpuA1mkhHZtjV5ywQU+TsFGCfv9x5LY1PEl4qL22pT2b+DZ4GcwgO4VSChO
j8npF2kUsw4HoWCF+2bSbRV2URhSfRJxfpm1521X7lTzcydHhlYaCxjEKpg9I9DJqFtyxHIdScxD
QrbFekDJoC6FlCvCvIAK+RpT5HxHbDccIkR0dpUAgWQHrDmLa1nF00RzroucqSNYhYicBaCupwlR
g2FJTWHoRvO77KVqdgoU/K10v50cy/V3mNrEPz935ysBBNdJptb3daFx9bL0o983k6At+KGt2giT
4FJu7zTzmLhCSKqaPS1q8LSaoqnuMFA+ucTrYOR2eUNn7hNmHVwPGNXfAueMXXfPYeP+4JZ2r/3z
2/OC+ba6pStNTBKHQcndBKhcnOCwe6suwNA3WtW6vCfVpI9bUkKWO1c2syq2GgkqbB+FhnDNojP+
GSbLOvUPgOBhrGKkhHqXvE+6URiHqxYPk+bImm+z1pezkhkdqzREvC7O54T++D14ci/9KnaOnkeZ
+4e/1N2f13P5leIJ4i/LvGrY5GP4x8AgkwiSkh0ZZ5tffTTyN3aNHtHbjdW07YwemzV9HRo95skC
bLWChsDJaJ6dPwbDHYneQpu1DxSGS8Sj43wD83Ku3VpU8BnL44C/ao9hifnXA0fn3uQUVIdlfc6I
VXPBaHn3vOft3ht445ASsJJ+Lt5m+45w4zySU5pGKqpg5Ar+Mmp6WtUJjjv1kn9FO3RRbrIEge13
ywK1QMcnr6TelmvOsW/E+aSH/6YBMXOa3t3jvnrcxi/nY2jt7piJoN2ZT6ATQUH8D1B6e7BrPMXl
yCdkHSMDElSpYT80TPqTWHoBJSaHQJABUBDiLKtAm2yJNFpzZTgCtRPKMadBmbetZDsdwlw3zOsI
PAgJ/AJD2x97Cwzgr41kBjqQKIbN9KG465XF7eQSLGxVTPcZvgSNNzKB9IErpWc8u/gO2JrbiLi9
H6AoRVvgnuN95zs1JoA6ViiaTpGF47dHs1gtqP3PUmVoIbJ/P4hkmmx1IrNvo6qMac60H7QkYIML
eUs17qR4Nemqnf97mxP6ZULGCO37Tx5sBdN7yAsYZacE8pV2vx+Orq25BNDE4zroghxB8DnQRw7g
iLndNdPM8R7kBxaRq0E/hqbvNCUQVlIHR0wvmUWhh3QoWmS5K72aZW3iCu1Nlh3jvMOKDNocDWES
EGMlgk7kcoEB5Cz5SgeDJF2kHQ6D20toFurpQCnDBj+S8ugWnw0K7VznBb7Yq40T7DdWk0Dj51SG
rfhLtpPAlFY/w/qhuRbebkqup1Ezqt7VskbSCG3nhlA4ZZm6rdrWux9m+qesFFbqjGN+yteWoXD4
BtOj24kJBagR9DR5olN3wDCFm7JaR2/epFljr49Opbig0hXvFzfDyMA7MZPQ4+bukQ+IvG7OY//l
+7f8EB+dBDvlkamDXNErr0GfLC5cRcVPi9LfFWDjryoF4/l1/hLj2hnnzzlGAkh1UgIJSIDC/voe
2duUopbj/ukxAuDwUSyxd9mejARAKqGAdcFog2o9Y5iDKWpANzKdS9rTZxKAIdVNKNnc5UdRrMPg
rYQbSryFiQsjr3xyJj4DHingWrdkejsElO/5Y1EpJbAiKdy/xAiNEewcyaLMNr6YwUAUDbR7dh11
EcNAYev2MxBoUxl35lcKFlUHgQ0/AxsVOiTCHzNk28gSHL5+41u1i8QbxVPoc4Sj0YZdt3K9l2Qo
AexjZsihUnr2bn5cH9jkoJlDqvcJ+t8WH+X9Gxh3L1zqi63YZSbXTj86WykeSzDMQ1NyGDxj8+4P
4kFKq40xiPxA7RUvrq0qNQYz9HRHR2QhWg391TdF5PqVbRTrIhbbHfKIgIhIx0YkZag5byVQ6y3g
+ev9jz202TBK7y/dR2iF362Ikk45Sg2JG1HgpbXGE+4p4Mfau5GQdsWHFmBGHqL6YZ75SKK4SoAc
PhjHkn8tNdDnkU6Qx5MdhRLQm19QfYIJY2n3XKOy0wZXtR/hEqk1nlNR2K6FikJgpdHbsvjnjzk8
V0gGglANdvc0G7QgHtYVDrANwUa0ZJfIg+9dEtx3WAp/yDEodq8XjnttxQLGRKMVg44IUUaCkemv
wo7LyZKYR86GmNbDiGXldkR+kqvpXOEVF2IHSIVE2ZOBBtSLp+TzMoVA4t6JAAA8+5JkAstaOBJQ
OOq010YTVS4uBoq5haEB1ZyhJkWSWdx7vMwkV4LNiYkkFV5d36e80BtW4vYO3lwim36qOsFLoBdg
LvkOZ7PkxmUk3FjbeEniBXAc01TzSXfF6GcvgSV7zMDFudUm/NR1C5w5tHrGNp0fFBy/5VmOFJJm
uTTyMYLTjzNXcM+7QiaS8tN1PKChVmadLGQnmRV/Khk1mgJPr9fJOAiAx+EuOtkjFNcLVvS+VdDY
+3hJED2Fc55yyDRTuq3Euw23pwAdRvO1kyzhSjpy7HJ+h15rwd39qNxqJSwGdKpoCUAGmCRkl1yx
trNL3uY/SqoSExDkcLsWuz0JQXVdwRzDC/3cMkMr5s7XA2AoveOmp2STmtRJbCl7GfXsuvzAUIm0
EGARbzO1U6+1+RxxjfO6PvoQFbiXv12Um6n5sGFcI05Vx65NpM0lnCtBU5TmJgbuWxQubX2jjpk0
uEJL3lUasizq6rlciUFv865XzJmJkXzx7eVci/++ewEYjRxo8rlP9TRKMMxwJEDjYPUoVyfSWi2V
8Y+WvASp6M+Xa0rr//4rj/k0d1gPb8Sup2CV7nLmRFzOWsbtrfq1KsA3v8RFdUVYrpI+H3L/X8XY
sNydwSnZcChKLkFNgOG3AssRYnnsb70y7IHLv3tyGvNDDpYXb5Yv24nShwhW0kc38xcQuAGKJojg
4YTSoMlJBCZPddfP0aX+E313w42oBHa5YWKt0qx7MmkCfRLMh50B7v1fYESwlHivg3N0oYdVzP5U
gCPkWW4jdHM+PC/xZFCwiPQes5laGvpMi8958WvQ8fm+PVWzs5pcKmZjbN0ana3xnOT9aXz8aw9+
KO8A9SNhngG4LYPay/vEIGKuB6JHrwEniuYH2m2pw3EwiEMubIjOLVZF79LlhU+Mk2mkQhYLq8ES
r5DD+MQAFF2nq000I6xvRB05tyFYPzoat/08gNfrLQmV8bLsTw/tJrPtEFMOS4d8tvs/b50+BzPw
HSWXU+dp43oKLL4kyIouyUHY3pzAaUb2OjAMMsjKpHIS5SJ2bvob6UuloKMvhG4xcI2DJFdwTl19
yel8vCniD7bf23fsEchJ2uRvSCL6OiGLKUOFlmudEiZAI/hAmVAC3nd9Xmk2zGbyw7DqqgVewizT
CJ/GYCEWN2t7zETSvdYOZ1l96Rp6p0HuNoKph7rno/grZF01RMbrBHwXFCL/xdgusXjcRI2RMznr
4Vtx8kmyZKmHrfsWVMaxNuoomyrYgYKO7JMt8ZbZtPI4yDhbuDOFBzzhpZUWlLCXwpaR9MHH7Xu3
+mqVSSGyQ3KWSixYBMnRiN4XODenqFshwgXG5OMkg2On9W6D2+d6cX48WaSp8+oXd14Ktv14atjE
5CaO+ehMyxyN+2W4Ans7gyKI4eMfl+WCiAg4WoejB6aw0xHUhIACkb9cISm2xmZ1MriqmF+uVLAS
Nh17z23YNYpQP6L0o8m7pcgKfO8dIlctKecJOD1hV4Ffnhc58Ow4tZxpfXq8s+HObzl5m3PkVa2Q
7BkLOrF/a1smKKkiZJs0TENGNlRXM4jfgWgGe4Yc5imq53JhR4WycVD6d1Z1G1VnWNAgWrNftqN8
t9RqB8ou947vxJAJqSBTpfUPvGpcdkC3EqC59yUotHd1kb3vH00ECJkYfzO2RZa+1T+kijNsGNJX
qAnnGSv61fHHDi+dz9WNzRWzRYjRFJw7jhmtYAYsF0RosRqGC0cTsp9qB3TC5nML/tHTIolQ79lG
UZpVSZpaW35vnxgOnDGibt9+d12KllOGTn7H22fdFf5/FJCT1NTtu9vr1LUbl52PSy8PN3IFE8qJ
Nmk06NU2E1/LWfm4vh2txnOpzoGXjdiNv6T+1BxjV6beYaYzBQoHYURrLZ46Fsw90gGZ+JNrOHnW
JMx31Hz+KVm5LeI58vXjNlKWN7YPVBQe46A5JnEJ6Aw/bWU+SkvOmt5nUxRGUuICYkc0+0jkHJs/
pofVBJ2QT0o0ADuPKGBv2NBlERmcpg07R/ndIe2+21UB4P+Jee+VqScaRU4aTdRZ54KlZELhwLTb
g3xzctxcXziVC3fnx9YCj13fHfM4v0CwO0GnLz4tqE+IWLsVP7DNlJaQZcaBSzmX0hmxIUpcPR+z
x3wWTW3n8BDl+tABnj5oOwRnCeo4X+T2ge3+uvFAvcgxx5rxNs9f3qJ4eepmKBQv9XBYS74RJV0w
/UHzPKuWlsRg0HT+rsBZMu2hGrESzrjQv2Ianah0qKbVvg4TKx6JKDZ37FrBo/HUH3hO5o4XL3/3
jKTUCgDwl5KG7kz99ep5a1isHQMNBsH8cWoH9+ZyN3C0cDnZi1zfVAKK8xMK6Tiqs6BDm3Cm6EdJ
NzogAzulXhTNa+mScm8tOENCmhFhGr6bRmKPdIoTztOeO09BIBMyPeZupkxUccLjGltlt4XpvjcP
OzfLyQBDM9GSAAnOABvXeLNaGfLRByhmdYPsi9aFtjyoMZusfmD8gL4Js7v3ROot9/kHh9Pq/UpZ
MInGB7ASSLG4DSu4mwbUWV6DZwEyW8SLCl6uyf1nnhfoi0GNOJ6yamIqx4axVjNudWDFMx5oNnWN
sZicsoeYciCy4DZafuiLPPBN8qEVdrYFlYx+h9lLmwkzK9IFsMgN3h+Ub8+fLOHba7OmZ995V/J3
65ey2xYRNpiCGknHggeQzpDgKlM6X40RtdChp8h2MW6Hj4BNmgYuuIQ4Qk/Kh2AWIQO/DVytoPF1
C7RD4R0KSfCInClIdwb2zoOjovnPIMyPnBdFsfC0Uf9fJ+JrgcYkNP170IBahgoiCNun09xzZ2B9
GYE1+y6L2BPa93uXoDuRn70mzsC7v7Ev4zuXr21WKd2opw0cygg+IIeNRDaQuxAfwveFE2gQpWFc
4rA3+A0K4FpXGkelVnm62UdUJ0ZvK3gcIu4KBbU4DL2BVkjl6ovFFJ3KB88LRTiTdXd2zUtgkbZr
JZA8KULBA/PCGqOn5asEwBYr5n76LpujjGO0LJ7sb0s9f9z75GVNG/i7nu9FknlY5kEACMUeLwlC
ZOmsdPHKPeeeDbeUWZXQJMxTOsXOCc3/2ydcJOLehxIlKwb85QorJLIv8pIJgkcY0yqp+AXM8hkz
9F/NEowBWP4q95eZQ3pDVs8q57sVLdBXQ8jgDp10hMaVYV1vdAi24xkz4kaHqZgWyiL6DlnzsCFF
B5NaJbFD6JnuhntQHDZPeLCvKAA8d7bmM1o3k1t9ghmpMM2MhqqTeoZ8he1X3AV+KIUBVQfAJdp6
MZgGhW33/vTtwxRtyD/3fvJyG4BTMEuM7c5XexMcqTWEfSh8Oii6IkOY59m0aTX0Zxn8zSAQFw/5
Hv300u72xY0d8g+oq9gVaRQDCKeJTMDuyw74Vepl/eh1sarJjrJIROeJ1yi6sNlLYmWhTUVnbNYw
KDaUukcN5j3BBjz5VLr6RNnKuU4NKAjJLJR3XyjE9LiHDNB+h0gtY2f3CEM2lJ3htyXX+bxbZvbS
w27Nwn4JCl4Pc6o9JQthPQQ5TBCL3qNnBnn2FdoGIJhA1/Jk7FpW/YiLixMApZpLQ6HRaGqD7+Kg
a+1NSmQqjiOyOzWP9nxxh6vB6OnnSBPFQ5Tik/VTz2saYrbkBsOajbwwalipbVIGOb6AnzdLuRIM
JVH3Mkf94S0ZLWiRIVotCC3UjlaYgW6bgdavH2qR5LUnhzlGz3baAQA6cz2PaQYZu/+s72ZxQ/yA
Ftrd443DpSO3qWIGW8hPeRdtbcqjmpR+77WHuCpiJOCv+ta8w306S+60hB+oT3lHtizydA+q1qcL
MwlKzEQU1Cx21dJS4ItrgMrO/zIEH4eWZA786nSYRPC51YsJKmjNECamNTUNcHgwNl1KqycwVyBI
/FuaZ1Z9dtcfxbGOEeEq0l+xS3Nog7eNo1c4gIZEyafwTzAa3V2goZzFfLlT9BhrhPZpzXH1TXIP
uy18efRcszbPY8G3knX4rcr2utBGqskOFpAQe+ImbwiOY3v1kLY9V08CP9FUIlqIxI1aA/JVJdtB
MprrYtyxB13K3v013mVQ52ryxhO8M1CLmPTrCkbrHxaqVQEkM3138spFGmw5p+r+aEm9tJrLDfoZ
BoWUuYx48dj3bSn58CvD9Nzf7kSaOA72TGNS2RdmOUsMrB3eHcqY7PP3H4YG7v2PENdoUyWfnK/a
UI38ThHDtsVsttde8oZ4Gq9tzI1NYo9XkRxoT30SR5t/yZzFOnRA8LR0fbd7m3HHNEnkJvvUwSsD
plB1Su1bHlv/GHee5DgZW+7PAfkB2tWfNnRVHw+dcYuXfiOnVlf54bEOX6UtJWr8EBf6b+BowXEZ
fhvvHBMkZ3Y/9+zC3XpqnYdQjfUPGI/puFjXr/TyAsP6hihza2NAMsF/63y3htRE+QTVMvkxHOkz
GgeCS1KQqd4JhU0hXWeoInxTQDtE/LKrEagG5KP2sJk0kB11/yxiCrI+QlviyGFRlyEXFFZf9/vw
7k2IsQ/WwhfXQ+BZUsY8gDIBQaM3JrryQyhwUEvvg5k8Uc3OkKiaqKEjUws8E8OoXjrVz40EOS7k
dP/IYtUnM52zgz5Nk8dpRKf/VOynK26OjRf4c5hr/5q6Y7m/dpZdjnpC0jVy/vhcy8EKGLTULc0q
rBQXFJ7JFp73oO6TB+O+IpAynSXIu3Oheq32JDF9BscQrDs/nNu21OcaTuADXmzJS8wQzPr+pafa
WTMFB4HvDphn4G9gP3V+cxVetDf+rsyXocq+YgaVNkytt/1WaHtVgEbPbeiWMcCGLM+GZgEdNlSE
52oeYntFTeqnAxpSM0Syso3pN3qFGhrTq2Nervl9YY2a+7DMhX9F1krs/UlUa7AoldSJp7DocUdd
Xt5JR0MR1M+t50ClkSqXS45MvM0YXaCrL4xj8+Cz8zajCkwzUk+rFIiGcyLGXiSjipn5xcg9kMkK
A4yQKT8Z1MdyID1RRYP6km6HSmV+Jy0/yeGBqm59Ocujjk8Iyfhu6wHLPbBv/GT0DhZKorpbZQnH
CeEyvR00M1Ev9TXzc+qXTkPXqNc0QgJEAXEx6UqOnbI9rAA+DZ1ZoZ3nenhzz3cDqklrqj6oTFGc
T0SXRrJOtrWvXZBZdk3O9OQouNYEALmYgGyAZN8rV5aYsZLW7vOe+veZ1Barjq3dSkAzfbPpxNCS
Np31Xa9YB1vU1JfEYr2kho1YubRRgi9+LWKAfAJT63AuaYGb6JrbWUUH/MoTS9Olx0dpF3BWg4Yz
K64ahWx8VVSqaN3ek3HkwnMtfLX2qE2V5Gf4L7DwZTbSFF6fCmUhDdIwkmR7ShQXhRjdDHpTv+HC
6FydGefMtMqINNh0f/TDCxDwv2pxKk2kWgV0JVg3MeTO9itKC/rAxpku3aUEEf5fW5vQzVrYVJ0y
LVIoBKt3/7eeNiJ9hn1EYbFS8H7sKB+EVhQ7MwPNLVTl66Ep7aJkcjtBepM1NP1sdoQmWzoFQOZ8
ZpuBVkjKbtHXh9XK4Dm33jNbC5B60CMqjliB8BKfcP2eUh0v7mBqu+H7RHIG1Wpk3lIOmZQl6O/l
3w20T4bkWSHL1RJ4npNj1jLapeKuzDjlbJcylwqh0km7HAbrElsYvVvglt94Cvwz27vpnSv9oqs+
XbquFDrAmyF0zG4Rm4kM3+E9qbIc+u6A1dpqcw+yC8YixahXG4TY4uyCW0r7CmcyOBipcJpo9nRb
r1QmpKSjYKyBG7eVmvucbCqXUCRKYmeaFsakhm/Us2wizFDcxtnv9lNBqwAz5MV3v6ezZQDuTNM8
3Z0bG3VYAWBPpfNusaZPizNLLhMUejdKeeL8eZ+Q6D+i+We7Hjc1cW/erwXn2uMaPptFqNkdwMqI
VO8TcrU9iD19dAPGyijyr2sM7g1cUSUsJjd7U7EIf5dNW3GyABV5xjr5E/ouzZc0fYfLWGAhYVu3
zGlkxqVWXv5EaWDxOMP5ye3lyn+eSYadLWg/32usVUw5MixtgcKAdUJEyFHTOpx/C/JC+AeYQF/s
toq6Xaibc8teYylTnoPWSwbNeYzTMt9/XoULOLMwyC1HH5gz2+mJTv5+a4lVcCY0Hscra4SqirmN
LVVGD1ivLiMZmfzymt0spNl3IkfgxUOiNNAAxTzu9hR2IDcQuXC+t/5a5E3aEyMubynwvQDsvomF
WvpaFtu48V9sUjQCBRnEJ+QhztAAg7oL2YwC82rpfXmP6IZDfNZ6fjwggKMl/xeY2+ZlmuiIZgZq
cuPZyIMQmk+WJBqHMrX6g53VREdbygol+4dxI4hV4cmoBVw4y/i7NIpB8zPasfQE/w3R+PJXjzqA
LCl/8Bk5b7JQMjEAfmK8FwJM6HBBa1L0/5+67NOy0ZIsOGEYIlcnmpqxvWS4tqcCVTpL4R41dENz
MFE5Q2+GVPGxmUmVm67CPmbo/ZNJ4ATGRT2YnREO1U2FIECV5L+FiyrCT9VCDvzCb6K8qInHJ+/9
scFXjepjxPTBPO+0r0WLOGFH7BvJpSOM/j5TbN+wevoLBNnnO4ZX5MLclT5+s2U4d8XFm76c6VsK
c8UJiIxakiyQnQLahYVF7HjCJ7tKFVvadTPf5Xo84Ag2bKTseA+RWsnF30RLNqqcNo1+ZjTWSPro
oQxyHfb8Q3bK9uL2U8peIt7ZVjzyrcitmJJTDUjOQWE01XTQ1q7VZREKJ9ldbtW6KKYol35xnc7V
5qtvqDwWgAcl9uTMOdUzbwLOu5Oh66jLF5hCZDfiViix4h+UfGUkvVRwyYypTcWjU1M1ld+S82qz
duXwrjEgrpNs143iNMGDG8taXKGfD3DCYb+5f3PZK70MkSSEwCyrecLpPqE6fVlp5sODKaVqkwBi
+aM2396ZFp2yC447+cSn5b7Pl7a+SEJ61N0bhVTL5wH4eQXZBnIJaCdTJp6mc+CoEwFI+sONxKzc
/yd3xcN9VsDXyGflcpgvcFHf1m1kxtryfcAlIfncgjqCbi1NV1TJM24VgZz1GGgYs5aUeqoYrnwm
Xx4eNQhUYgBHg+7AsUaeZUpvuQLkY8X0x1MspMkYQdDBAL9p7K7EjljiTjJXXCXH+gkT5v7BgZ/m
0Whv+K2kRe3JCcJQMVDLxmZzDXvDx4pcLBJLYNfyXPJAj9NP8orca9Jb63TlgvmV434+Vd8Gf3h+
8Q22xxEer1BnCJoI5jsPnUDUcA24roOYUIpVdqGhYyH8szSRq5gx3W4L9gIhRauL0UneK/m3a35A
KJEDCq6axjTg01D6I53jYqhiTng+9hIv0Xawh2ycx8S9ICNT5yBP6gc4KQmf//DLH9ftMc5aQUjP
t18DJbycO7u3ZXoF5ZK15hmdvEvZ5oyO6UPkW0E4IpvRkziV6Um0E5DG1TSHei7wYhe5RBYJaSwC
FhyTAoMtLOyFJcLtJQgMtB75rzCHZatY1kIMRimmLAGWyDY2kVHUgGnRdo+I1yrMGuTWSRKh8s5v
6zlZPP5MPp4nr1EV6OGDwjdjJLxbfohjIToK0q83lMbSSbPSemCIsEbmckCBHfk20W6eD+O52kSX
KaBOYMmVf5gUp7wlxSrMt2K+RvWMY8cPIN8KpwfjvSW/ZwismLnYcClCFmkKKDjtaX2LwI7pxDl2
2aAPwl33F4YmMNz0GlSmAjCAoVsN84cmB6SaWBt/2hKwo0GPZiU5XDMSqboKtqpCJtwI7C5Ka7P4
0H7x/coCfJBqABOiurVH7gJwZV0OaizFDwPPONjNYIlFnDLcQ59tDqOIYhvYzC09McxyfAkjh3Mc
AqQtvtoQrNHVf/tfHp4UcWakWP5urD33ixIC3J95EmF8YuypENFJN6EO2N42eDmhFbfgjhbMok7N
Z/jbQQtOpxWX2WLrFmF2pVBFlSs2nKSw36mlwIu6DF4taJTrtNopaCAuNHLbU8Cw3Cw45KZIJZxt
KFsOq4rSDvpPeu1rATa8pCisufoNfS7GT01ypswscFMNbm2/PhwpKdex6CjqRCC+kllwcwJVv8Jh
KIbrUWx0Nal1Q+OBa8x6qZIfQx0AxNTufd/TOKTJaSIpt5rSvdOKNTHAVrDB5iBarAGKZFuCBa72
xZpR5nbiaXpcxOmnWwZCxtaZZH3tFiM0ZOB2IKuCI0uQP1yA8Ck3+F+oCv5Qrf8ej8/p/NbmyHAR
NQUMj6GIIanQ1sOZRV5yryPzwsvHoAI5Im89gg3HJbd6bwPFqmqO9izqpquN2mrtjhaNIlHuYlfB
qjIN/le2IYYzfr7urMuXQOOnvuNYP3Sc1URu90N5k966L/gS1ZOQaPZapy0Y0FAdzks0GhQgdnJv
YIp3iyzC5ZjQcN83R0fxuMQCEeCrj65+EvibXWz4ydRlWRNbcZBNuSHXTYKhPtmj8cx1SEfZnSei
slzjfWAdsYaD+2zRuky82PuG2uRUBny4lQHS3CGre58rG7LHQ7Vw0/qUQzk1SmzuW4TwOLjfcpjZ
woFFR3UF5R5DU817fluaNQ2WmGvRV1uOifTIW2JOYyZcX7PjFok1FmvfwPMET/N3NhoaG5QIpGsi
pm5mdwJGTpusljdGYIzvg5r1tJLv2rq70nNNQP8PwMMh+J8jsw5c55lApz6cDOUgagGtfbm6Wx3c
eV9F9YODJKpGxAzb0SyzN4cWRW6zDt/zgiP7FA12wuH03fwtgDK1aUx0ZfBRTuBbDkI5PY5dbIvl
lv6TfQFbXWKzvMmoHiOecRxemOo80x1k6TO1majUzwK7o1lQ/dIBt0pPAc90iLKCedsxzEl7kNhS
tKf2jj8kPQIi+IO0R9N3Xo2+75O5HkF94R+DLOSitQ7Lusc9G4iAjsIRfdOnCqiUo/d2BKVG4zvZ
U0gCK0Jh5TjyECJ8QsZX/uCdqZdSQWmUJc6U7TnqVKc75V8MzgDHKosvgN7M0NcZipDJUllaX2Bm
MjeUkUr4vNtsPyLPl1L7jutKAJSxBGL8JvhBr8p6pQCX1dQu/kB2CozEdgGM1qTy0I67ACawu1bF
lH8s1dJ2PjA47CRhNXQyZEpo6q8uWIOuvGf7yROppUWbDw5DGCMxZ8U+8sDgtHknP28NQac2mA2A
Dj0x4qzF/V+cBDCi2+8qqMnCyt6jje0kWRSs/XQRx9emDq3OB9biIyLnhuPfhhCL5YcKMM81l2p9
OKgNvHE2RL/XjfeDXNOpX7CEBYv/dO2jaaXAlvWPlMQWRQIahqE/qRQw0A1BNMi8hxE/x9syGP7i
1ucbiw7oguZz9LEWVGydkMjTXEDfoL3TRYh8zLRmD9zaVflgRJsRrX3LUv2Ml4eSj6Kp9PCJ8UsA
sre9G9AZrMvZUmK72vjNPTL8aCkJseZMkUJ1Kc8J5rcVcXUMTdDr6F7RVzKipUokg0dewX5qbX8I
c+ETWlqxKrHnwOoQby5riBJViXU7ZTUPWssXntFxBoICcq8k05kDbNMNM6deAyZrCPxolDfo/Hxc
k9KCgYkcBYKVoekFFXGNTb4unffxK0ZkHGLRIVZiNoa5x0/0/Ik7VTCNdVC7dZGlTsXuRST9siEY
T/qxCLS2MTNpG/3OCSx9VGoO1dYNnGvKGyhVyUOBVRKrQaVnwKCoHm66t2Fr/Mkom3IGcX/VW96n
czcJEysZ31HNsRoooExmacslPcFjNZGe0c8SdXYlcCRqcJWA4y5ai0mopia1gCz6JSisVkQEIaG6
kXDIDBT9m6l2jtVrCPmrwK9/lz9+FcFJfS3j7ZVo89e87MjUd81UqOg+r8dFwTzJ8EHQzrmKykQD
KRvZkywhMUpsdg4TKQjpKeBSDAg6T31AuEKmkT+90qIDUNAWIPeVM9YznKZA+Wr/6dDLOeeV6eEa
/f+GPNO9XdSxK42efLMQvC8zJWhzxK08gW25imEXzSVJKrms/f7EjX5Tjm8zliVxIBj1KM/Khhws
rgSFHEKIEqBd9GUzOpyEJUYdq0DCNvlN/O7avXh24iWZDUrPj5NpFI4K374u+FzneDnjBHFhgz+N
reosIp6aNGQqhb+bzLMq4fDPsSHOllkPKSYQfOu888modqNu6ytMMaz65tdPeP0t3s4yrPI/cEez
rm2etgJM53SW6uK2wr4F4Ybq4qzXy7/Glacuz7A7hpKj7rGAoFCR+YVLMuX6c1ID85Px1zRs35QM
OaDDfv0O30CPfoe76ragFooTPBiNtpb2w6vuEHj0rvjZSo3CV6eqhIUTh4qneeeHWTDkfc4ww2Ke
tOxF/N1DtEaZ0w7ZDDNVIH8Nud05hKhfR5GT81tXb3+Hn1USVeE9+nYmWBSmMxC86dj1PoziggBR
i27ZJTdmN62qzz0sFZuzKMGNsOWrJ0uj/MANDmvJ7V9XFPZqp4dkrcv3uD9Bg8gH5cNObBMCTbDb
c/CCQjYPx5LuzyIxE1EQ7nF7K3CnU2YlA31HMbaGV+OEBk7wJVc+D2gk5sGKwtkAspRhsIhqUsDK
XwMWPBn7o4IaxiyEvMXC8D2osodGxNJsmmkMp4XUR0Z5yhUssLvhXnE0J3GjX7d/9DISPUaqJpWP
h8qZ9CB4NuKQusvVn+zNahrej5XQsHoUAV26LK0Oe1wV8Gydz5eah5BLyWWay66W5T5mATvzVBNi
OWgEYtuWxFbIXELg7oSgRNFrGrFeCuFomnEGKH3/Xam7siwLXe2gzFJXT7CgAy1HEf4U195Pzavf
e/U/EwnZ/TdJa+M3E+0Df4d1eRbvkFL6cyeZjmmP6Q0YUOBPZKcmJBaQwLCGhD9VkYZkv37lNwAH
xq/x4WLODZj3u3q92A1j/Ua7i8sWjKnvFJy+mvw2EdBA9HUbypdCGQsVAI2mo0TiKq2ONtB0j9Bx
E2/F/wFcWCPglEVanz0hViC5/yI6FQBoNDcg2oVGwekxw6fKL95awAXiO/QACS6l3buqPFKe9qug
/BuP5+48JSLzJ0CCxk8fmXpkNJM+V70Q20WiNah5g/xRQErI6tKD1wz275Pj6mVtsmfVxdAA8yn9
s89D6N4NiNNJOgCVPZpFnzpv+UErIIr+pqSplfa2IMcUKCy2NkP9ZbWeuAUmJunTT6wS7lbBf0Q7
9YSaKoYu4wsvlp7YUdA562ZS0VHUXgZgreL2y+EJ5brCyjUX7aX156yDaWA9+Vq6oc5jPvNuvGi4
Dx9jy92GaP+a8v0f0P5V64nP2qqxNoQpoCrimqLo7a1egf4wOh28nazJxvtWvH85tgLpurRLX7TU
XA5M0ZvjKu0W+ZRQu84tO6LWvUEbQhak6tryl/N/cgC3NxD0ZPZuCil0caxP9oMHcBrOdDiZLrJT
axxHUqoq6YTk8llazFoI2IUrNYatzA96fwUbiiUIf7fygQN//6Q9MxFauqFf2p41TxJ/aQnW04hU
fILp11///HoNHrHIMJLyT9S5XjYQw76bZT+u/uelHU1P3SMajEmG10mJJeDWgnJDWCGcwoUrszys
musGfA7+98aXEiaRT7h3J6wKW2i8mgopOFsU4iowAOQNWgIjoKAMrLqhYLugR3HNUZRnAfl+gz62
kk1/2L3t8VK62slkMTjdpGVcjVqGtzfFefynYaYKCD9Cy3eo5ZNH1+03F6u7HNyg3/TSX9iq4X0g
pyfPC2frKjqKJJzw+TOSZlz+DOetVjpZJqLcq5EOMplVbbYorGylKerRA//OB4Go3oonQSn77pLO
uZ13dSKD60+lYhLRjCPg3DIiEnaP3vbsYrBck8/tMWL8zxrL0NleNOvU1anOOZ1mAzswolWMHA3U
DmZlyE/Y0OljlTpOl+LmuOV2XBPle5Mk3vGy7s95Aq4VwKbUFaynfXRxQ8vHvzrwR0tEtgRCVp+d
B+1GrC86mCiLUT5mgaf5i6b5sZXkLQsQGrYeXCMINQkEoHnRDokraqPYe8G0m6OXl4Ckdr/Sdhyq
WVR6chFuOGmzDDMtf2VrHxQXXG9KCQKUQoSlP7qHkCHyRsSmHHsFBh2Hw28eh7ZAxUTx8XNDC7zD
MnFYPkr5SIVnEr7VHO98qhVpRtYzhwEIPeLOKLP0AiBedUuDLA+jBrh966NdoUTvkxDQKN4v0nqG
MOpXm3F68x1hFA8HBqVJH8Maq9ypGuqEsRed5l4FEc4yTZyynxqjobEl7XKWBztt1relKdBmjz64
OujiUb3/b4gP1uRWlPyCxmqaWkik1kY3we+dtnsOwEgOgklCQSvc32NZpg/ztz9jg4Vf1wt61idx
UcnZiySxnBIDqFMhzzLugefaTDQkfq+BrnDn08q8bZ2Z3nbfItDvE9sk/4iwHhlV7XXIxOVdfcJP
pzKtQD/YtcjKejvumwclmSW7d1r561C7fPlneZVmP/96aqtAmOr1mUK8Su6pu9cmb1B6BQa/i9jO
bbHOUDe0Rn4Baf7BtYvA1U40yj/obmXJ1rr4OxZ7Q24dzIY0IdAIwOSUjy5n3lTrv4bngCHnpjkq
s49yfWgfUdbQ5Rr57oHgMZzSc2AMtqlDnPz+VXA7fgje+D85qqGTIdvie8ErbGGbu/5C8FxnTOwg
hG1wyGWuKw6Niz+Fiyqp+vjYEaiTzjrqDGHjuO0E1x1CIsadIPDuQKefvxTBDk7CvPT4RD14Qlgs
mWsNF23i43mm+Ayqear/6jDK1DieDspn6GNgh3YMCDYo59RkjfflLgm92iRAg7k1g6M8r9nE4ufQ
paEVX2zRqr46MN54Ove4DjedmGM0fhGqhVzbp/KO9QONzu59nPasVRBmtS00Gf/Oq/zRGemW7doZ
Z1HFbVn8pzTi9cs1WBTBIfG86jX1Ky2YkDMY0Xon4Kr8/moejDExziKohWOokscqLg7sgVGDi54Y
8O6ACwctFRP/HETJqGnLMwW3BX6Arbc1jMMYihK2muEtGxegr0xt2Lu/334UIIyDEbapMzNuLr7K
SnXtcN697OneEjQTSvoM33ZDGJxhdiXPNiTtgAW32+OF8otdoxjf4d2sL4RboOFJJMT79/cGxFVc
ZsC4X+7EITuv2GfWGFjsDonWOiEVjzXKaO5B3aGl6nSofgcEeUSs1oKiz0bCwir9ZVb3bQxfxM/L
RQ==
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
