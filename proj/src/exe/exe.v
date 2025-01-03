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
    input  wire [31:0] pc,         
    // Inputs from decode stage
    input  wire [31:0] src1,         // Source register 1 value
    input  wire [31:0] src2,         // Source register 2 value or immediate value
    input  wire [3: 0] aluop,        // ALU operation code
    input  wire [2: 0] alusel,       // ALU Select Signal

    input  wire [4: 0] waddr,        // Destination register address  // 写回寄存器的地址
    input  wire        reg_write_in, // Register write enable signal  // 是否写回寄存器标志

    input  wire        mem_to_reg_in,// Memory to register selection signal
    input  wire        mem_read_in,
    input  wire        mem_write_in,

    output wire        mem_read_out,
    output wire        mem_write_out,

    input  wire [31:0] inst_in,
    output wire [31:0] inst_out,


    // Inputs from memory stage
    input  wire [31:0] mem_data,   // Data from memory (load result)

    // output to memory stage
    output wire [31:0] alu_result,      // ALU operation result
    output wire [ 4:0] write_reg,       // Register address to be written
    output wire        reg_write_out,   // Register write enable signal
    output wire        mem_to_reg_out,

    //add the support for hilo register
    input  wire [31:0] hi,            // hi register
    input  wire [31:0] lo,            // lo register
    output wire [31:0] hi_out,        // hi output
    output wire [31:0] lo_out,        // lo output
    output wire        whilo_out      // Write HI/LO enable flag
);
// TODO: hilo寄存器逻辑实现 / 溢出检查 / 时序实现
//注意立即数逻辑的实现位置

wire [31:0] temp_logic;            // 逻辑运算结果
wire [31:0] temp_shift;            // 移位运算结果
wire [31:0] temp_move;             // 移动运算结果
wire [31:0] temp_arith;            // 算术运算结果
wire [31:0] temp_mul;              // 乘法运算结果
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
                    (aluop == `EXE_LUI_OP) ? {src2[15:0], 16'b0}: 32'b0;

assign temp_shift = (aluop == `EXE_SLL_OP) ? (src1 << src2[4:0]) :
                    (aluop == `EXE_SRL_OP) ? (src1 >> src2[4:0]) :
                    (aluop == `EXE_SRA_OP) ? (src1 >>> src2[4:0]) ://无v表示直接用指令中的值
                    (aluop == `EXE_SLLV_OP) ? (src1 << src2[4:0]) ://v表示要读取寄存器中的值
                    (aluop == `EXE_SRLV_OP) ? (src1 >> src2[4:0]) :
                    (aluop == `EXE_SRAV_OP) ? (src1 >>> src2[4:0]) :
                    32'b0;

                    //对hilo寄存器的操作
assign temp_move =  (aluop == `EXE_MFHI_OP) ? hi : 
                    (aluop == `EXE_MFLO_OP) ? lo :
                    // (aluop == `EXE_MTHI_OP) ? src1 :
                    // (aluop == `EXE_MTLO_OP) ? src1 :
                    32'b0;
assign hi_out = (aluop == `EXE_MTHI_OP) ? src1 : hi;                                  
assign lo_out = (aluop == `EXE_MTLO_OP) ? src1 : lo; 

assign whilo_out = (aluop == `EXE_MTHI_OP) || (aluop == `EXE_MTLO_OP);
//算术运算需要进行溢出检查
assign temp_arith = (aluop == `EXE_ADD_OP) ? (src1 + src2) :
                    (aluop == `EXE_SUB_OP) ? (src1 - src2) :
                    (aluop == `EXE_SLT_OP) ? (src1 < src2) :
                    (aluop == `EXE_SLTU_OP) ? (src1 < src2) :
                    32'b0;
//是否需要单拎出来
assign temp_mul = (aluop == `EXE_MULT_OP) ? (src1 * src2) :
                    32'b0;
//分支跳转指令
assign link_addr = (aluop == `EXE_JR_OP || aluop == `EXE_JALR_OP) ? src1 :
                   (aluop == `EXE_J_OP || aluop == `EXE_JAL_OP)    ? {pc[31:28], src2[25:0], 2'b00} :
                   32'b0;

assign branch_addr = pc + {{14{src2[15]}}, src2[15:0], 2'b00}; // 计算分支偏移地址
assign branch_taken = (aluop == `EXE_BEQ_OP    && src1 == src2) ||
                      (aluop == `EXE_BNE_OP    && src1 != src2) ||
                      (aluop == `EXE_BGTZ_OP   && src1 > 0) ||
                      (aluop == `EXE_BLEZ_OP   && src1 <= 0) ||
                      (aluop == `EXE_BLTZ_OP   && src1 < 0) ||
                      (aluop == `EXE_BLTZAL_OP && src1 < 0) ||
                      (aluop == `EXE_BGEZ_OP   && src1 >= 0) ||
                      (aluop == `EXE_BGEZAL_OP && src1 >= 0);

assign final_addr = (aluop == `EXE_JAL_OP || aluop == `EXE_JALR_OP || aluop == `EXE_BLTZAL_OP || aluop == `EXE_BGEZAL_OP) ? pc + 8 : 
                    (branch_taken ? branch_addr : link_addr);

//访存以及写回寄存器

// 地址计算：基址加偏移
wire [31:0] mem_addr;
assign mem_addr = src1 + {{16{src2[15]}}, src2[15:0]};
// 加载数据
assign load_data = (aluop == `EXE_LB_OP)   ? {{24{mem_data[7]}}, mem_data[7:0]} :  // LB: 符号扩展
                   (aluop == `EXE_LBU_OP)  ? {{24{1'b0}}, mem_data[7:0]} :        // LBU: 零扩展
                   (aluop == `EXE_LH_OP)   ? {{16{mem_data[15]}}, mem_data[15:0]} : // LH: 符号扩展
                   (aluop == `EXE_LHU_OP)  ? {{16{1'b0}}, mem_data[15:0]} :       // LHU: 零扩展
                   (aluop == `EXE_LW_OP)   ? mem_data :                           // LW: 全字直接加载
                   32'b0;                                                        // 默认值

// 存储数据
assign store_data = (aluop == `EXE_SB_OP) ? src2[7:0] :       // SB: 低 8 位
                    (aluop == `EXE_SH_OP) ? src2[15:0] :      // SH: 低 16 位
                    (aluop == `EXE_SW_OP) ? src2 :            // SW: 全字存储
                    32'b0;                                    // 默认值

 // 对齐检查
 assign misaligned = ((aluop == `EXE_LH_OP || aluop == `EXE_LHU_OP || aluop == `EXE_SH_OP) && mem_addr[0] != 1'b0) ||
                     ((aluop == `EXE_LW_OP || aluop == `EXE_SW_OP) && mem_addr[1:0] != 2'b00);

 // 根据对齐情况控制是否继续操作
 assign mem_read_enable = ((aluop == `EXE_LB_OP || aluop == `EXE_LBU_OP || 
                            aluop == `EXE_LH_OP || aluop == `EXE_LHU_OP || 
                            aluop == `EXE_LW_OP) && !misaligned);

 assign mem_write_enable = ((aluop == `EXE_SB_OP || aluop == `EXE_SH_OP || aluop == `EXE_SW_OP) && !misaligned);


assign reg_write_out = reg_write_in;
assign write_reg = waddr;
assign mem_read_out  = mem_read_in;
assign mem_write_out = mem_write_in;
assign mem_to_reg_out = mem_to_reg_in;

assign alu_result  = ({32{alusel == `EXE_RES_LOGIC}} & temp_logic) |
                     ({32{alusel == `EXE_RES_SHIFT}} & temp_shift) |
                     ({32{alusel == `EXE_RES_MOVE}} & temp_move) |
                     ({32{alusel == `EXE_RES_ARITHMETIC}} & temp_arith) |
                     ({32{alusel == `EXE_RES_MUL}} & temp_mul) |
                     ({32{alusel == `EXE_RES_JUMP_BRANCH}} & final_addr);



// logical usage
reg [31:0] inst;
assign inst_out = inst;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        inst <= 32'b0;
    end        
    else begin
        inst <= inst_in;
    end
end

endmodule