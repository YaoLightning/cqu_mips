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
    input  wire clk,                 // Clock signal
    input  wire stall,               // Stall signal
    input  wire rstn,                // Reset signal

    // Inputs from execute stage
    input  wire [31:0] alu_result,       // ALU operation result from execute stage
    input  wire [31:0] mem_addr,         // Memory address from execute stage
    input  wire [31:0] write_data,       // Data to be written to memory from execute stage
    input  wire [ 4:0] write_reg_in,     // Register address to be written from execute stage

    input  wire [31:0] inst_in,
    output wire [31:0] inst_out,

    input  wire        reg_write_in,    // Register write enable signal from execute stage
    input  wire        mem_read_in,     // Memory read enable signal from execute stage
    input  wire        mem_write_in,    // Memory write enable signal from execute stage
    input  wire        mem_to_reg_in,   // Memory to register selection signal from execute stage

    // Outputs to write back stage
    output wire [31:0] mem_read_data,   // Data read from memory
    output wire [31:0] final_result,    // Final result to be written back
    output wire [ 4:0] write_reg_out,   // Register address to be written in write back stage
    output wire        reg_write_out,   // Final register write enable signal
    output wire        mem_to_reg_out   // Final memory to register selection signal
);
// Define memory (1024 x 32 bits)
    reg [31:0] memory [0:1023];


    reg [31:0] inst;
    assign inst_out = inst;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            inst <= 32'b0;
        end        
        else begin
            inst <= inst_in;
        end
    end


//    // Memory access logic
//    always @(posedge clk or negedge rstn) begin
//        if (!rstn) begin
//            // Reset outputs
//            mem_read_data <= 32'b0;
//            final_result <= 32'b0;
//            write_reg_out <= 5'b0;
//            reg_write_out <= 1'b0;
//            mem_to_reg_out <= 1'b0;
//        end else if (!stall) begin
//            // Forward control signals to write back stage
//            write_reg_out <= write_reg_in;
//            reg_write_out <= reg_write_in;
//            mem_to_reg_out <= mem_to_reg_in;

//            // Memory read operation
//            if (mem_read_in) begin
//                if (mem_addr[31:2] < 1024) begin
//                    mem_read_data <= memory[mem_addr[31:2]];
//                end else begin
//                    mem_read_data <= 32'b0; // Handle out-of-bound access
//                end
//            end else begin
//                mem_read_data <= 32'b0;
//            end

//            // Memory write operation
//            if (mem_write_in && mem_addr[31:2] < 1024) begin
//                memory[mem_addr[31:2]] <= write_data;
//            end

//            // Determine final result
//            final_result <= mem_to_reg_out ? mem_read_data : alu_result;
//        end
//    end
endmodule