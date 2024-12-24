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


module wb(
    input wire clk,                // Clock signal
    input wire reset,              // Reset signal
    input wire reg_write,          // Register write enable signal
    input wire [4:0] rd,           // Destination register address
    input wire [31:0] alu_result,  // ALU result
    input wire [31:0] mem_data,    // Data from memory
    input wire mem_to_reg,         // Select data from memory or ALU
    output reg [31:0] wb_data      // Data written to register file
);

    // Register file array simulation
    reg [31:0] reg_file [0:31];  // 32 registers, each 32 bits

    // Data to be written to register file
    reg [31:0] write_data;

    // Mux to select data source for register write
    always @(*) begin
        if (mem_to_reg)
            write_data = mem_data;
        else
            write_data = alu_result;
    end

    // Register file write operation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize register file (optional)
            for (integer i = 0; i < 32; i = i + 1) begin
                reg_file[i] <= 0;
            end
        end else begin
            if (reg_write && rd != 0) begin  // Ensure not writing to $zero register
                reg_file[rd] <= write_data;
            end
        end
    end

    // Output the data written to the register file
    assign wb_data = write_data;

endmodule