`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 12/24/2024 04:23:58 PM
// Design Name: cqu_mips
// Module Name: wb
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The writeback module handles writing data back to the register file in the MIPS processor.
// 
// Dependencies: 
// - Register file module
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////


// Write back stage module
module write_back(
    // Clock and reset signals
    input wire clk,                // Clock signal
    input wire stall,            // Stall signal
    input wire rst,              // Reset signal

    // Inputs from memory access stage
    input wire [31:0] final_result, // Final result from memory access stage
    input wire [4:0] write_reg_out, // Register address to be written from memory access stage
    input wire reg_write_final,    // Final register write enable signal from memory access stage
    input wire mem_to_reg_final,    // Final memory to register selection signal from memory access stage

    // Assume connection to register file
    output wire reg_write_to_file, // Signal to write to register file
    output wire [4:0] reg_write_addr, // Address of the register to write in register file
    output wire [31:0] reg_write_data // Data to be written to register file
);

    // Register file array simulation
    reg [31:0] reg_file [0:31];  // 32 registers, each 32 bits

    // Data to be written to register file
    reg [31:0] write_data;

    // Output the data written to the register file
    assign wb_data = write_data;

endmodule