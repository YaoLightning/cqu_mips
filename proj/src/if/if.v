`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/23 11:18:06
// Design Name: cqu_mips
// Module Name: if
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The instruction fetch stage (IF) fetches instructions from memory using the program counter (PC).
// 
// Dependencies: 
// - Memory module (mem)
// - Control unit (control)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////

module inst_fetch (
    input   wire clk,              // Clock signal
    input   wire rstn,             // Reset signal
    input   wire stall,            // Stall signal

    input   wire [31:0] pc_in,       // Program counter input
    output  wire [31:0] pc_out,      // Program counter output
    output  wire [31:0] instruction  // Fetched instruction
);

    reg [31:0] pc_out_reg;
    reg [31:0] instruction_reg;


    // Memory model for demonstration purposes
    reg [31:0] mem [0:1023]; // 4KB memory
    // TODO: use true memory rather than the reg array

reg [31:0] tmp;

    assign pc_out = pc_out_reg;
    assign instruction = instruction_reg;

    // Instruction fetch stage logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // Reset the program counter to the initial value (e.g., 0x00400000)
            pc_out_reg <= 32'h00000000;

            // Logical operation instructions
            mem[0] <= {6'b000000, 5'b00001, 5'b00010, 5'b00011, 5'b00000, 6'b100100}; // and $3, $1, $2
            mem[1] <= {6'b000000, 5'b00001, 5'b00010, 5'b00100, 5'b00000, 6'b100101}; // or $4, $1, $2
            mem[2] <= {6'b000000, 5'b00001, 5'b00010, 5'b00101, 5'b00000, 6'b100110}; // xor $5, $1, $2
            mem[3] <= {6'b000000, 5'b00001, 5'b00010, 5'b00110, 5'b00000, 6'b100111}; // nor $6, $1, $2
            mem[4] <= {6'b001100, 5'b00001, 5'b00010, 16'h000A}; // andi $2, $1, 10

            // Arithmetic operation instructions
            mem[5] <= {6'b000000, 5'b00001, 5'b00010, 5'b00011, 5'b00000, 6'b100000}; // add $3, $1, $2
            mem[6] <= {6'b000000, 5'b00001, 5'b00010, 5'b00100, 5'b00000, 6'b100001}; // addu $4, $1, $2
            mem[7] <= {6'b000000, 5'b00001, 5'b00010, 5'b00101, 5'b00000, 6'b100010}; // sub $5, $1, $2
            mem[8] <= {6'b000000, 5'b00001, 5'b00010, 5'b00110, 5'b00000, 6'b100011}; // subu $6, $1, $2
            mem[9] <= {6'b000000, 5'b00001, 5'b00010, 5'b01000, 5'b00000, 6'b101010}; // slt $8, $1, $2
            mem[10] <= {6'b001000, 5'b00001, 5'b00010, 16'h0005}; // addi $2, $1, 5

            instruction_reg = 32'b0;
        end else begin

            // Assuming the memory module is connected to fetch the instruction
            // Here we assume a simple memory read operation
            // In a real design, this would involve interfacing with the memory module
            instruction_reg <= mem[pc_out_reg / 4]; // Fetch instruction from memory
            
            tmp <= mem[0];

            // Fetch the instruction from memory using the current PC
            pc_out_reg <= pc_in;
        end
    end

  
endmodule