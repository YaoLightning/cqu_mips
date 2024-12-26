`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/23 11:18:06
// Design Name: cqu_mips
// Module Name: memory_access
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The memory_access module handles memory read and write operations in the MIPS processor.
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

module memory_access(
    input wire clk,                // Clock signal
    input wire reset,              // Reset signal
    input wire stall,            // Stall signal
    
    input wire mem_read,           // Memory read enable signal
    input wire mem_write,          // Memory write enable signal
    input wire [31:0] alu_result,  // ALU result used as memory address
    input wire [31:0] write_data,  // Data to be written to memory
    output reg [31:0] read_data    // Data read from memory
);

    // Memory array simulation
    reg [31:0] memory [0:1023];  // 4KB memory

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize memory (optional)
            for (integer i = 0; i < 1024; i = i + 1) begin
                memory[i] <= 0;
            end
        end else begin
            if (mem_write) begin
                // Write data to memory
                memory[alu_result[11:0]] <= write_data;
            end
            if (mem_read) begin
                // Read data from memory
                read_data <= memory[alu_result[11:0]];
            end else begin
                // Clear read_data if not reading
                read_data <= 32'b0;
            end
        end
    end

endmodule