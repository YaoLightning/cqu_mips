`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/23 11:18:06
// Design Name: cqu_mips
// Module Name: mem
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The memory module (mem) implements the data storage functionality in the MIPS processor. This module handles read and write operations of data and works in conjunction with other modules in the datapath.
// 
// Dependencies: 
// - Other related modules (e.g., ALU, register file)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////


// Memory access stage module
module memory_access(
    // Clock and reset signals
    input wire clk,                // Clock signal
    input wire stall,            // Stall signal
    input wire rstn,                // Reset signal

    // Inputs from execute stage
    input wire [31:0] alu_result,  // ALU operation result from execute stage
    input wire [31:0] mem_addr,   // Memory address from execute stage
    input wire [31:0] write_data, // Data to be written to memory from execute stage
    input wire [4:0] write_reg,  // Register address to be written from execute stage
    input wire reg_write_out,    // Register write enable signal from execute stage
    input wire mem_read_out,     // Memory read enable signal from execute stage
    input wire mem_write_out,    // Memory write enable signal from execute stage
    input wire mem_to_reg_out,   // Memory to register selection signal from execute stage

    // Outputs to write back stage
    output wire [31:0] mem_read_data, // Data read from memory
    output wire [31:0] final_result, // Final result to be written back
    output wire [4:0] write_reg_out, // Register address to be written in write back stage
    output wire reg_write_final,    // Final register write enable signal
    output wire mem_to_reg_final    // Final memory to register selection signal
);

endmodule