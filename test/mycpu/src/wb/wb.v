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
// ATTENTION: this module is only a logic stage of the datapath
//      because that the write of register will custume one cycle
//      the actual write back will be done in the regfile module
//      this module just implement the signal connection and resolve
module write_back(
    // Clock and reset signals
    input  wire clk,                // Clock signal
    input  wire stall,              // Stall signal
    input  wire rstn,               // Reset signal

    // Inputs from memory access stage
    input  wire [4 :0]  write_addr_in,          // Register address to be written from memory access stage
    input  wire [31:0]  write_data_in,
    input  wire         reg_write,
    input  wire [31:0]  pc_in,
    output wire [31:0]  pc_out,

    input  wire [31:0]  inst_in,

    output wire [4 :0]  write_addr_out,     // Address of the register to write in register file
    output wire [31:0]  write_data_out      // Data to be written to register file
);

    reg [31:0] reg_inst;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            reg_inst <= 32'b0;
        end        
        else begin
            reg_inst <= inst_in;
        end
    end

    assign write_addr_out = write_addr_in;

    reg [31:0] pc;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            pc <= 32'h0;
        end
        else begin 
            pc <= pc_in;
        end
    end

    assign pc_out = pc;

    // Data to be written to register file
    // logical usage
    // reg [31:0] write_data;

    // always @(*) begin
    //     case(reg_mem_to_reg_final)
    //     1'b0: 
    //         write_data = reg_write_data_alu;
    //     1'b1:
    //         write_data = reg_write_data_mem;
    //     default:
    //         write_data = 32'b0;
    //     endcase
    // end
    // assign write_addr_out = write_addr_in;
    // assign write_data_out = write_data;

    // Output the data written to the register file
    //assign wb_data = write_data;
endmodule