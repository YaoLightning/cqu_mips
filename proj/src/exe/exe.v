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
    input wire clk,                // Clock signal
    input wire rstn,              // Reset signal
    input wire stall,            // Stall signal

    // Inputs from decode stage
    input wire [31:0] src1,         // Source register 1 value
    input wire [31:0] src2,         // Source register 2 value or immediate value
    input wire [3: 0] aluop,        // ALU operation code
    input wire [2: 0] alusel,       // ALU Select Signal
    input wire [4: 0] waddr,        // Destination register address  // 写回寄存器的地址

    input wire        reg_write_in, // Register write enable signal  // 是否写回寄存器标志
    input wire        mem_to_reg_in,// Memory to register selection signal
    input wire        mem_read_in,
    input wire        mem_write_in,

    output wire       mem_read_out,
    output wire       mem_write_out,


    // output to memory stage
    output wire [31:0] alu_result,      // ALU operation result
    output wire [ 4:0] write_reg,       // Register address to be written
    output wire        reg_write_out,   // Register write enable signal
    output wire        mem_to_reg_out,

    //add the support for hilo register
    input wire [31:0] hi,            // hi register
    input wire [31:0] lo,            // lo register
    output wire [31:0] hi_out,       // hi register
    output wire [31:0] lo_out,       // lo register
    output wire whilo_out            // 是否写回 HI/LO 标志
);
//todo：hilo寄存器逻辑实现 / 溢出检查

wire [31:0] temp_logic;            // 逻辑运算结果
wire [31:0] temp_shift;            // 移位运算结果
wire [31:0] temp_move;             // 移动运算结果
wire [31:0] temp_arith;            // 算术运算结果
wire [31:0] temp_mul;              // 乘法运算结果
wire [31:0] link_addr;             // 跳转地址

//未校验
assign temp_logic = (aluop == `EXE_AND_OP) ? (src1 & src2) :
                    (aluop == `EXE_OR_OP)  ? (src1 | src2) :
                    (aluop == `EXE_XOR_OP) ? (src1 ^ src2) :
                    (aluop == `EXE_NOR_OP) ? ~(src1 | src2) :
                    (aluop == `EXE_ANDI_OP) ? (src1 & src2) :
                    (aluop == `EXE_ORI_OP)  ? (src1 | src2) :
                    (aluop == `EXE_XORI_OP) ? (src1 ^ src2) :
                    (aluop == `EXE_LUI_OP) ? {reg2[15:0], 16'b0}: 32'b0;

assign temp_shift = (aluop == `EXE_SLL_OP) ? (src1 << src2[4:0]) :
                    (aluop == `EXE_SRL_OP) ? (src1 >> src2[4:0]) :
                    (aluop == `EXE_SRA_OP) ? (src1 >>> src2[4:0]) ://无v表示直接用指令中的值
                    (alu_op == `EXE_SLLV_OP) ? (src1 << src2[4:0]) ://v表示要读取寄存器中的值
                    (alu_op == `EXE_SRLV_OP) ? (src1 >> src2[4:0]) :
                    (alu_op == `EXE_SRAV_OP) ? (src1 >>> src2[4:0]) :
                    32'b0;

                    //对hilo寄存器的操作
assign temp_move =  (aluop == `EXE_MFHI_OP) ? hi : 
                    (aluop == `EXE_MFLO_OP) ? lo :
                    // (aluop == `EXE_MTHI_OP) ? src1 :
                    // (aluop == `EXE_MTLO_OP) ? src1 :
                    32'b0;
assign hi_out = (aluop == `EXE_MTHI_OP) ? src1 : hi_in;                                  
assign lo_out = (aluop == `EXE_MTLO_OP) ? src1 :lo_in; 

assign whilo_out = (aluop == `EXE_MTHI_OP) || (aluop == `EXE_MTLO_OP);

assign temp_arith = (aluop == `EXE_ADD_OP) ? (src1 + src2) :
                    (aluop == `EXE_SUB_OP) ? (src1 - src2) :
                    (aluop == `EXE_SLT_OP) ? (src1 < src2) :
                    (aluop == `EXE_SLTU_OP) ? (src1 < src2) :
                    32'b0;

assign temp_mul = (aluop == `EXE_MUL_OP) ? (src1 * src2) :
                    (aluop == `EXE_MULU_OP) ? (src1 * src2) :
                    (aluop == `EXE_MUL_OP) ? (src1 * src2) :
                    (aluop == `EXE_MULU_OP) ? (src1 * src2) :
                    32'b0;



assign reg_write_out =({32{alusel == `EXE_RES_LOGIC}} & temp_logic) |
                     ({32{alusel == `EXE_RES_SHIFT}} & temp_shift) |
                     ({32{alusel == `EXE_RES_MOVE}} & temp_move) |
                     ({32{alusel == `EXE_RES_ARITH}} & temp_arith) |
                     ({32{alusel == `EXE_RES_MUL}} & temp_mul) |
                     ({32{alusel == `EXE_RES_JUMP_BRANCH}} & link_addr);

endmodule