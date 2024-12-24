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

module id(
    input wire clk,                // Clock signal
    input wire reset,              // Reset signal
    input wire [31:0] instruction, // Fetched instruction from IF stage
    output wire [4:0] rs,           // Source register 1 address
    output wire [4:0] rt,           // Source register 2 address
    output wire [4:0] rd,           // Destination register address
    output wire [15:0] imm,         // Immediate value
    output wire [5:0] opcode,       // Opcode of the instruction
    output wire [5:0] funct,        // Function field for R-type instructions
    output wire [31:0] rs_data,     // Data from source register 1
    output wire [31:0] rt_data      // Data from source register 2
);

    // Internal registers to store output values
    reg [4:0] rs_reg;
    reg [4:0] rt_reg;
    reg [4:0] rd_reg;
    reg [15:0] imm_reg;
    reg [5:0] opcode_reg;
    reg [5:0] funct_reg;
    reg [31:0] rs_data_reg;
    reg [31:0] rt_data_reg;

    // Register file for storing general-purpose registers
    reg [31:0] reg_file [0:31];

    // Initialize register file with some values for demonstration
    initial begin
        reg_file[0] = 32'h00000000; // Register $0 is always 0
        reg_file[1] = 32'h00000001; // Example value for $1
        reg_file[2] = 32'h00000002; // Example value for $2
        // Add more initial values as needed
    end

    // Instruction decode logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset outputs to default values
            rs_reg <= 5'b00000;
            rt_reg <= 5'b00000;
            rd_reg <= 5'b00000;
            imm_reg <= 16'b0000000000000000;
            opcode_reg <= 6'b000000;
            funct_reg <= 6'b000000;
            rs_data_reg <= 32'h00000000;
            rt_data_reg <= 32'h00000000;
        end else begin
            // Extract fields from the instruction
            opcode_reg <= instruction[31:26];
            rs_reg <= instruction[25:21];
            rt_reg <= instruction[20:16];
            rd_reg <= instruction[15:11];
            imm_reg <= instruction[15:0];
            funct_reg <= instruction[5:0];

            // Read data from the register file
            rs_data_reg <= reg_file[rs_reg];
            rt_data_reg <= reg_file[rt_reg];
        end
    end

    // Assign internal registers to output wires
    assign rs = rs_reg;
    assign rt = rt_reg;
    assign rd = rd_reg;
    assign imm = imm_reg;
    assign opcode = opcode_reg;
    assign funct = funct_reg;
    assign rs_data = rs_data_reg;
    assign rt_data = rt_data_reg;

endmodule