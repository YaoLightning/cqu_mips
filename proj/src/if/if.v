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

module if(
    input wire clk,                // Clock signal
    input wire rstn,              // Reset signal
    input wire stall,            // Stall signal

    input wire [31:0] pc_in,       // Program counter input
    input wire stall,              // Stall signal
    input wire jump,               // Jump signal
    output wire [31:0] pc_out,      // Program counter output
    output wire [31:0] instruction  // Fetched instruction
);

    reg [31:0] pc_out_reg;
    reg [31:0] instruction_reg;

    assign pc_out = pc_out_reg;
    assign instruction = instruction_reg;

    // Instruction fetch stage logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset the program counter to the initial value (e.g., 0x00400000)
            pc_out_reg <= 32'h00400000;
        end else begin
            // Fetch the instruction from memory using the current PC
            pc_out_reg <= pc_in;
            // Assuming the memory module is connected to fetch the instruction
            // Here we assume a simple memory read operation
            // In a real design, this would involve interfacing with the memory module
            instruction_reg <= mem[pc_in[31:2]]; // Fetch instruction from memory
        end
    end

    // Memory model for demonstration purposes
    reg [31:0] mem [0:1023]; // 4KB memory TODO: true memory

endmodule