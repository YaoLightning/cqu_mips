`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/23 11:18:06
// Design Name: cqu_mips
// Module Name: execute
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The execute module handles memory read and write operations in the MIPS processor.
// 
// Dependencies: 
// - ALU module
// - Data memory module
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////
`include "defines.vh"
module execute(
    //clock and reset
    input  wire clk,                // Clock signal
    input  wire rstn,              // Reset signal
    input  wire stall,            // Stall signal     
    // Inputs from decode stage
    input  wire [31:0] src1_in,         // Source register 1 value
    input  wire [31:0] src2_in,         // Source register 2 value or immediate value
    input  wire [7: 0] aluop_in,        // ALU operation code
    input  wire [2: 0] alusel_in,       // ALU Select Signal

  //  input  wire        branch_taken_in,       // Branch taken signal

    input  wire [4: 0] waddr_in,        // Destination register address  // 写回寄存器的地址
    input  wire        reg_write_in, // Register write enable signal  // 是否写回寄存器标志

    input  wire        mem_to_reg_in,// Memory to register selection signal
    input  wire        mem_read_in,
    input  wire        mem_write_in,

    output wire        mem_read_out,
    output wire        mem_write_out,

    input  wire [31:0] inst_in,
    output wire [31:0] inst_out,

    // output to memory stage
    output wire [31:0] alu_result,      // ALU operation result
    output wire [ 4:0] write_reg,       // Register address to be written
    output wire        reg_write_out,   // Register write enable signal
    output wire        mem_to_reg_out,

    output wire [31:0] mem_addr_out,    // Address memory for read or write

    output wire        arith_stall

    // // //add the support for hilo register
    // input  wire [31:0] hi_in,            // hi register
    // input  wire [31:0] lo_in,            // lo register
    // output wire [31:0] hi_out,        // hi output
    // output wire [31:0] lo_out,        // lo output
    // output wire        whilo_out      // Write HI/LO enable flag

);
// TODO: hilo寄存器逻辑实现 / div模块实现:需要暂停等额外逻辑


// logical usage

reg [31:0] src1_reg;
reg [31:0] src2_reg;
reg [7:0]  aluop_reg;
reg [2:0]  alusel_reg;
//reg        branch_taken_reg;
reg [4:0]  waddr_reg;
reg        reg_write_reg;
reg        mem_to_reg_reg;
reg        mem_read_reg;
reg        mem_write_reg;
reg [31:0] inst;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        inst <= 32'b0;
        src1_reg         <= 32'b0;
        src2_reg         <= 32'b0;
        aluop_reg        <= 8'b0;
        alusel_reg       <= 3'b0;
//      branch_taken_reg <= 1'b0;
        waddr_reg        <= 5'b0;
        reg_write_reg    <= 1'b0;
        mem_to_reg_reg   <= 1'b0;
        mem_read_reg     <= 1'b0;
        mem_write_reg    <= 1'b0;
    end        
    else begin
        inst <= inst_in;
        src1_reg         <= src1_in;
        src2_reg         <= src2_in;
        aluop_reg        <= aluop_in;
        alusel_reg       <= alusel_in;
 //       branch_taken_reg <= branch_taken_in;
        waddr_reg        <= waddr_in;
        reg_write_reg    <= reg_write_in;
        mem_to_reg_reg   <= mem_to_reg_in;
        mem_read_reg     <= mem_read_in;
        mem_write_reg    <= mem_write_in;
    end
end
 // Internal register storage
   reg [31:0] hi_reg, lo_reg;
   wire [31:0] hi_out, lo_out;
// 实例化 hilo_reg
    hilo_reg hilo_reg_inst (
        .clk(clk),
        .rstn(rstn),
        .we(whilo_out),
        .hi_i(hi_out),
        .lo_i(lo_out),
        .hi_o(hi_reg),
        .lo_o(lo_reg)
    );
    
 
    wire [31:0] hi_in, lo_in;
    
    assign hi_in = hi_reg;
    assign lo_in = lo_reg;

wire [31:0] src1;
wire [31:0] src2;
wire [7:0]  aluop;
wire [2:0]  alusel;
//wire        branch_taken;
wire [4:0]  waddr;
wire        reg_write;
wire        mem_to_reg;
wire        mem_read;
wire        mem_write;

assign inst_out = inst;
assign src1 = src1_reg;
assign src2 = src2_reg;
assign aluop = aluop_reg;
assign alusel = alusel_reg;
//assign branch_taken = branch_taken_reg;
assign waddr = waddr_reg;
assign reg_write = reg_write_reg;
assign mem_to_reg = mem_to_reg_reg;
assign mem_read = mem_read_reg;
assign mem_write = mem_write_reg;


wire [31:0] temp_logic;            // 逻辑运算结果
wire [31:0] temp_shift;            // 移位运算结果
wire [31:0] temp_move;             // 移动运算结果
wire [31:0] temp_arith;            // 算术运算结果
wire [63:0] temp_mul;              // 乘法运算结果
wire [63:0] div_result_out;
wire div_ready_out;
wire [63:0] mulres;              // 乘法运算结果
wire [31:0] link_addr;             // 跳转地址
wire [31:0] final_result;          // 最终结果

//未校验
assign temp_logic = (aluop == `EXE_AND_OP) ? (src1 & src2) :
                    (aluop == `EXE_OR_OP)  ? (src1 | src2) :
                    (aluop == `EXE_XOR_OP) ? (src1 ^ src2) :
                    (aluop == `EXE_NOR_OP) ? ~(src1 | src2) :
                    (aluop == `EXE_ANDI_OP) ? (src1 & src2) :
                    (aluop == `EXE_ORI_OP)  ? (src1 | src2) :
                    (aluop == `EXE_XORI_OP) ? (src1 ^ src2) :
                    (aluop == `EXE_LUI_OP) ? {src2[15:0], 16'b0}: 32'b0;//低16位立即数保存到高位

assign temp_shift = (aluop == `EXE_SLL_OP) ? (src2 << src1) ://无v表示直接用指令中的值
                    (aluop == `EXE_SRL_OP) ? (src2 >> src1) :
                    (aluop == `EXE_SRA_OP) ? (src2 >>> src1) ://算术右移
                    (aluop == `EXE_SLLV_OP) ? (src2 << src1[4:0]) ://v表示要读取寄存器中的值
                    (aluop == `EXE_SRLV_OP) ? (src2 >> src1[4:0]) :
                    (aluop == `EXE_SRAV_OP) ? (src2 >>> src1[4:0]) :
                    32'b0;

                    //对hilo寄存器的操作
assign temp_move =  (aluop == `EXE_MFHI_OP) ? (hi_in) : 
                    (aluop == `EXE_MFLO_OP) ? lo_in :
                    // (aluop == `EXE_MTHI_OP) ? src1 :
                    // (aluop == `EXE_MTLO_OP) ? src1 :
                    32'b0;
assign hi_out = (aluop == `EXE_MTHI_OP) ? src1 :
                (aluop==`EXE_MULT_OP || aluop==`EXE_MULTU_OP) ? mulres[63:32] :
                (aluop==`EXE_DIV_OP || aluop==`EXE_DIVU_OP) ? div_result_out[63:32] :
                hi_in;                                  
assign lo_out = (aluop == `EXE_MTLO_OP) ? src1 :
                (aluop==`EXE_MULT_OP || aluop==`EXE_MULTU_OP) ? mulres[31:0] :
                (aluop==`EXE_DIV_OP || aluop==`EXE_DIVU_OP) ? div_result_out[31:0] :
                lo_in; 
assign whilo_out = (aluop == `EXE_MTLO_OP) || (aluop == `EXE_MTLO_OP)
                || (aluop == `EXE_MULT_OP) || (aluop == `EXE_MULTU_OP)
                || (aluop == `EXE_DIV_OP) || (aluop == `EXE_DIVU_OP);

//算术运算需要进行溢出检查、符号检查
wire [31:0]result_sum;
wire [31:0]src2_mux;
assign src2_mux = ((aluop == `EXE_SUB_OP) ||
                    (aluop == `EXE_SUBU_OP)) ?//减法转换成加法
                    (~src2 + 1) : src2;
                    
assign result_sum = src1 + src2_mux;//加、减、比较
assign ov_sum = ((src1[31]       == src2[31]) && 
                 (result_sum[31] != src1[31])) ? 1'b1 : 1'b0;//高位符号不同则溢出
assign src1_lt_src2 = ((aluop == `EXE_SLTU_OP)||
                      ( aluop == `EXE_SLTIU_OP)||
                      ( src1[31]==src2[31])) ? 
                      ( src1 < src2) : 
                      ((src1[31] && !src2[31]) ? 1 : 0);

assign temp_arith = ((aluop == `EXE_ADD_OP)||
                    ( aluop == `EXE_ADDI_OP)||
                    ( aluop == `EXE_SUB_OP))?
                    ( ov_sum ? 32'b0 : result_sum) : // 加减法操作，若溢出则输出固定值（0），否则输出结果
                    ((aluop == `EXE_ADDU_OP) ||
                    ( aluop == `EXE_ADDIU_OP) ||
                    ( aluop == `EXE_SUBU_OP)) ? 
                      result_sum : // 无符号加法/减法操作，无需处理溢出
                    ((aluop == `EXE_SLT_OP) ||
                    ( aluop == `EXE_SLTU_OP) ||
                    ( aluop == `EXE_SLTI_OP) || 
                    ( aluop == `EXE_SLTIU_OP)) ? src1_lt_src2 : 
                     32'b0;
//乘法运算
//如果按照现实中的乘法，乘出来的结果是源码，而在计算机中应该是补码，所以需要取其补码
//如果是负数，那么需要对其取补码计算，只有在是有符号乘法时，才需要进行补码处理
assign opdata1 = ((aluop == `EXE_MULT_OP || aluop == `EXE_DIV_OP)
                        && src1[31]) ? (~src1 + 1) : src1;
assign opdata2 = ((aluop == `EXE_MULT_OP || aluop == `EXE_DIV_OP)
                        && src2[31]) ? (~src2 + 1) : src2;
assign hilo_temp = opdata1 * opdata2;
assign mulres = (aluop == `EXE_MULT_OP ) ?//如果异或为真，相乘为负数，取补码
                ((src1[31] ^ src2[31]) ? (~hilo_temp + 1) : hilo_temp) :
                hilo_temp;

//乘法最终结果也是放到了hilo寄存器中，实际并不会产生alu_result
// assign temp_mul = (aluop == `EXE_MULT_OP||(aluop == `EXE_MULTU_OP))? mulres :
//                     64'b0;


//除法运算/考虑暂停机制
	// input wire		  clk,
	// input wire		  rstn,
	
	// input wire        signed_div_i,//是否为有符号除法
	// input wire [31:0] opdata1_i,//被除数
	// input wire [31:0] opdata2_i,//除数
	// input wire        start_i,//是否开始除法运算
	// input wire        annul_i,//是否取消除法运算
	
	// output reg [63:0] result_o,//商
	// output reg		  ready_o//是否完成除法运算
     
wire signed_div;
assign signed_div = (aluop == `EXE_DIV_OP)? 1'b1 : 1'b0;

wire start_div;
assign start_div = (aluop == `EXE_DIV_OP || aluop == `EXE_DIVU_OP) ? 1'b1 : 1'b0;

// 实例化 div 模块
div div_inst (
    .clk(clk),
    .rstn(rstn),
    .signed_div_i(signed_div),        // 是否为有符号除法
    .opdata1_i(src1),              // 被除数
    .opdata2_i(src2),              // 除数
    .start_i(start_div),              // 除法开始信号
    .annul_i(0),              // 除法取消信号
    .result_o(div_result),            // 除法结果 {商, 余数}
    .ready_o(div_ready)               // 除法完成标志
);
 // Output assignments

    assign div_result_out = div_result;
    assign div_ready_out = div_ready;
    assign arith_stall = ((aluop == `EXE_DIV_OP) || (aluop == `EXE_DIVU_OP)) &&(!div_ready_out);


//访存以及写回寄存器
//目前只是计算了地址
assign mem_addr_out = src1 + src2; //默认src2已经是立即数

// // 加载数据//这应该是存储器里面实现的
// assign load_data = (aluop == `EXE_LB_OP)   ? {{24{mem_data[7]}}, mem_data[7:0]} :  // LB: 符号扩展
//                    (aluop == `EXE_LBU_OP)  ? {{24{1'b0}}, mem_data[7:0]} :        // LBU: 零扩展
//                    (aluop == `EXE_LH_OP)   ? {{16{mem_data[15]}}, mem_data[15:0]} : // LH: 符号扩展
//                    (aluop == `EXE_LHU_OP)  ? {{16{1'b0}}, mem_data[15:0]} :       // LHU: 零扩展
//                    (aluop == `EXE_LW_OP)   ? mem_data :                           // LW: 全字直接加载
//                    32'b0;                                                        // 默认值

// // 存储数据
// assign store_data = (aluop == `EXE_SB_OP) ? src2[7:0] :       // SB: 低 8 位
//                     (aluop == `EXE_SH_OP) ? src2[15:0] :      // SH: 低 16 位
//                     (aluop == `EXE_SW_OP) ? src2 :            // SW: 全字存储
//                     32'b0;                                    // 默认值


assign reg_write_out = reg_write;
assign write_reg = waddr_reg;
assign mem_read_out  = mem_read;
assign mem_write_out = mem_write;
assign mem_to_reg_out = mem_to_reg;

assign alu_result  = ({32{alusel == `EXE_RES_LOGIC}} & temp_logic) |
                     ({32{alusel == `EXE_RES_SHIFT}} & temp_shift) |
                     ({32{alusel == `EXE_RES_MOVE}} & temp_move) |
                     ({32{alusel == `EXE_RES_ARITHMETIC}} & temp_arith); //|
                     //({32{alusel == `EXE_RES_MUL}} & temp_mul) |
                     //({32{alusel == `EXE_RES_JUMP_BRANCH}} & link_addr);


endmodule