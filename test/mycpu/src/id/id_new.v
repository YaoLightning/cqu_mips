`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/24 04:23:00 PM
// Design Name: cqu_mips
// Module Name: id
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The instruction decode stage (ID) decodes the fetched instruction and generates control signals for the execution stage.
// 
// Dependencies: 
// - Instruction fetch stage (if)
// - Control unit (control)
// - Register file (reg_file)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.vh"
module inst_decode (
    // Clock and rstn signals
    input   wire clk,                // Clock signal
    input   wire rstn,               // rstn signal
    input   wire stall,              // stall signal
    //与IF交互
    input   wire [31:0]     inst_in,//instruction, // Instruction fetched from the instruction fetch stage
    input   wire [31:0]     pc_in//pc,          // Current program counter value
    output  reg  [31:0]     jumppc,
    //与regfile交互
    output reg          reg1_read_o,			//读使能
    output reg [4:0]    reg1_addr_o,	//读地址
    input wire [31:0]   reg1_data_i,	//读出的数据
    output reg          reg2_read_o,
    output reg [4:0]    reg2_addr_o,
    input wire [31:0]   reg2_data_i,
    //与EXE交互
    output reg [2:0]    aluop_o,		//运算子类型
    output reg [7:0]    alusel_o,	    //运算类型
    output reg [31:0]   reg1_o,		//源操作数1
    output reg [31:0]   reg2_o,		//源操作数2
    output reg [31:0]   imm_extend,    //16位立即数扩展
    output reg[4:0]     rs,
    output reg[4:0]     rt,
    output reg[4:0]     rd,

    //控制信号
    output  wire     alu_src,           // ALU source selection signal, 1 means use immediate value, 0 means use register
    output  wire     reg_dst,           // Register destination selection signal, 1 means write to rd, 0 means write to rt
    output  wire     reg_write,         // Register write enable signal
    output  wire     mem_write,         // Memory write enable signal
    output  wire     mem_to_reg,        // Memory to register selection signal, 1 means write memory data to register
    output  wire     branch,            // Branch signal, 1 means a branch operation is needed
    output  wire     jump,              // Jump signal, 1 means a jump operation is needed
);
    wire[5:0]op=inst_in[31:26];
    wire[5:0]funct=inst_in[5:0];
    reg[15:0]imm;

    // Instruction decode logic
    always @(posedge clk or posedge rstn) begin
        if (rstn) begin
            jumppc<=8'h00000000;

            reg1_read_o <= 1'b0;
            reg2_read_o <= 1'b0;
            reg1_addr_o <= 5'b00000;
            reg2_addr_o <= 5'b00000;
            
            aluop_o,	
            alusel_o,	
            reg1_o,		
            reg2_o,		
            imm_extend,
            rs,
            rt,
            rd,

            alu_src,   
            reg_dst,   
            reg_write, 
            mem_write, 
            mem_to_reg,
            branch,    
            jump,      

        end else if(stall[2]==1'b1 &&stall[3]==1'b0)begin
            
        end else if(stall[2]==1'b0)begin
            reg1_read_o <= 1'b0;
            reg2_read_o <= 1'b0;
            reg1_addr_o <= 5'b00000;
            reg2_addr_o <= 5'b00000;
            mem_write<=1'b0;
            alu_op<=3'b0;
            alu_sel<=8'b0;
            imm_extend<=8'h00000000;
            jump<=1'b0;
            jumppc<=8'h00000000;

            case(op)
                6'b000000:begin
                    case(funct)

                    endcase
                end

            endcase
        end
    end



endmodule