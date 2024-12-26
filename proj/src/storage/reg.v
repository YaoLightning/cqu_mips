`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 12/24/2024 05:00:00 PM
// Design Name: cqu_mips
// Module Name: reg
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The reg module implements a 32-register file for the MIPS processor.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////

module reg_file(
    input wire clk,                // Clock signal
    input wire rst,              // Reset signal

    input wire reg_write,          // Register write enable signal
    input wire [4:0] rs,           // Source register 1 address
    input wire [4:0] rt,           // Source register 2 address
    input wire [4:0] rd,           // Destination register address
    input wire [31:0] write_data,  // Data to be written to the register file
    output reg [31:0] rs_data,     // Data from source register 1
    output reg [31:0] rt_data      // Data from source register 2
);

    // Register file array
    reg [31:0] reg_file [0:31];  // 32 registers, each 32 bits

    // Read operation
    always @(posedge clk) begin
        if (rs != 0)
            rs_data <= reg_file[rs];
        else
            rs_data <= 32'b0;  // $zero register always outputs 0
    end

    always @(posedge clk) begin
        if (rt != 0)
            rt_data <= reg_file[rt];
        else
            rt_data <= 32'b0;  // $zero register always outputs 0
    end

    // Write operation
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

endmodule