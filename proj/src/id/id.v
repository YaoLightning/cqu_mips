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
    input   wire rstn,              // rstn signal
    input   wire stall,              // stall signal

    // Inputs from the instruction fetch stage
    input   wire [31:0]     instruction, // Instruction fetched from the instruction fetch stage
    input   wire [31:0]     pc,          // Current program counter value

    // Forwarding signals from other stages (example, may be more complex in reality)
    input   wire [31:0]     forward_a,   // Data forwarded to source register 1
    input   wire [31:0]     forward_b,   // Data forwarded to source register 2
    input   wire            forward_a_sel,      // Selection signal for forwarding data to source register 1
    input   wire            forward_b_sel,      // Selection signal for forwarding data to source register 2

    // Input and output related to the register file
    output  wire [4:0]      rs,           // Source register 1 address
    output  wire [4:0]      rt,           // Source register 2 address
    output  wire [4:0]      rd,           // Destination register address
    output  wire [15:0]     imm,          // Immediate value
    output  wire [5:0]      opcode,       // Opcode of the instruction
    output  wire [5:0]      funct,        // Function field for R-type instructions
    // output  wire [31:0]     rs_data,      // Actual data used from source register 1
    // output  wire [31:0]     rt_data,      // Actual data used from source register 2

    output  wire [2:0]      alu_op,       // ALU operation result
    output  wire [3:0]      alu_sel,      // ALU operation result

    // instruction outputs
    output  wire [31:0]     inst_out,          // The instruction output

    // Control signal outputs
    output  wire            alu_src,           // ALU source selection signal, 1 means use immediate value, 0 means use register
    output  wire            reg_dst,           // Register destination selection signal, 1 means write to rd, 0 means write to rt
    output  wire            reg_write,         // Register write enable signal
    output  wire            mem_read,          // Memory read enable signal
    output  wire            mem_write,         // Memory write enable signal
    output  wire            mem_to_reg,        // Memory to register selection signal, 1 means write memory data to register
    output  wire            branch,            // Branch signal, 1 means a branch operation is needed
    output  wire            jump,              // Jump signal, 1 means a jump operation is needed
    output  wire [31:0]     extended_imm,      // Extended immediate value
    output  wire [31:0]     pc_plus_4          // The value of the current PC + 4
);

    // Internal registers to store output values
    reg [4 :0] rs_reg;
    reg [4 :0] rt_reg;
    reg [4 :0] rd_reg;
    reg [15:0] imm_reg;
    reg [5 :0] opcode_reg;
    reg [5 :0] funct_reg;
    //reg [31:0] rs_data_reg;
    // reg [31:0] rt_data_reg;

    // this reg is used to store the instruction which is decoding
    // it can used in debug 
    reg [31:0] instruction_reg;

    // Instruction decode logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // rstn outputs to default values
            rs_reg <= 5'b00000;
            rt_reg <= 5'b00000;
            rd_reg <= 5'b00000;
            imm_reg <= 16'b0000000000000000;
            opcode_reg <= 6'b000000;
            funct_reg <= 6'b000000;
            //rs_data_reg <= 32'h00000000;
            //rt_data_reg <= 32'h00000000;
        end else begin
            // Extract fields from the instruction

            instruction_reg <= instruction;
            
            rs_reg <= instruction[25:21];
            rt_reg <= instruction[20:16];
            rd_reg <= instruction[15:11];
            imm_reg <= instruction[15:0];
            opcode_reg <= instruction[31:26];
            funct_reg <= instruction[5:0];
        end
    end

    // for the control signal, just use combinatorial logic
    // because that the previous [always] block has already consume a cycle
    // if the control signal still use one cycle, then the id stage will 
    // cost 2 cycles


    // `define EXE_AND 		6'b100100 
    // for example: AND instruction
    // assume that the alu_op for add is 7
    //                   this is the case that the opcode correspond to AND
    // if there are more , such as SUB, is 6,then
    assign alu_op = (7 & (opcode_reg == `EXE_AND))
                  | (6 & (opcode_reg == `EXE_SUB));

    // assign alu_sel=();
    // assign alu_src=();
    // assign reg_dst=()

    // for the jump 
    // `define EXE_J  6'b000010

    assign jump   = (opcode_reg == `EXE_J);
    assign branch = (opcode_reg == `EXE_BEQ)
                  | (opcode_reg == `EXE_BNE);

    // Assign internal registers to output wires
    assign rs = rs_reg;
    assign rt = rt_reg;
    assign rd = rd_reg;
    assign imm = imm_reg;
    assign opcode = opcode_reg;
    assign funct = funct_reg;
    //assign rs_data = rs_data_reg;
    //assign rt_data = rt_data_reg;

    assign inst_out = instruction_reg;

endmodule