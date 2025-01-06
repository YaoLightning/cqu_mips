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
    input  wire [31:0] exe_result,       // EXE result from execute stage
    input  wire [31:0] mem_addr,         // Memory address from execute stage

    input  wire [31:0] mem_read_data_in,// Data read from memory

    input  wire        exe_valid,

    input  wire        mem_read_in,     // Memory read enable signal from execute stage
    input  wire        mem_write_in,    // Memory write enable signal from execute stage

    input  wire        mem_to_reg_in,   // Memory to register selection signal from execute stage
    input  wire [ 4:0] write_reg_in,     // Register address to be written from execute stage
    input  wire        reg_write_in,    // Register write enable signal from execute stage
    output wire        mem_valid,

    input  wire [31:0] inst_in,
    output wire [31:0] inst_out,
    input  wire [31:0] pc_in,
    output wire [31:0] pc_out,

    // Outputs to write back stage
    output wire [31:0] final_result,    // Final result to be written back
    output wire [ 4:0] write_reg_out,   // Register address to be written in write back stage
    output wire        reg_write_out,   // Final register write enable signal
    output wire        mem_to_reg_out   // Final memory to register selection signal
);
// Define memory (1024 x 32 bits)
    reg [31:0] memory [0:1023];
    reg        reg_write;
    reg [4 :0] write_reg_reg;
    reg        mem_to_reg_reg;
    
    reg [31:0] exe_result_reg;
    reg [31:0] inst;

    reg        mem_valid_reg;

    assign inst_out = inst;

    assign reg_write_out = reg_write;
    assign write_reg_out = write_reg_reg;
    assign mem_to_reg_out = mem_to_reg_reg;

    assign mem_valid = mem_valid_reg;


    always @(posedge clk or negedge rstn) begin
        if (!rstn | !exe_valid) begin
            inst            <= 32'b0;
            exe_result_reg  <= 32'b0;
            reg_write       <= 1'b0;
            write_reg_reg   <= 5'b0;
            mem_to_reg_reg  <= 1'b0;
            mem_valid_reg   <= 1'b0;
        end        
        else begin
            inst           <= inst_in;
            reg_write      <= reg_write_in;
            exe_result_reg <= exe_result;
            write_reg_reg  <= write_reg_in;
            mem_to_reg_reg <= mem_to_reg_in;
            mem_valid_reg  <= 1'b0; // TODO: optimize it
        end
    end

    assign final_result = 
    ((inst[31:26] == 6'b000000 & inst[5:0] == `EXE_SW) |
    ( inst[31:26] == 6'b000000 & inst[5:0] == `EXE_SH) |
    ( inst[31:26] == 6'b000000 & inst[5:0] == `EXE_SB)) ?
    mem_read_data_in :
    exe_result_reg ;


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

    
// // 加载数据:需要对读到的数据进行扩展再存储到目标寄存器中
// assign load_data = (aluop == `EXE_LB_OP)   ? {{24{mem_data[7]}}, mem_data[7:0]} :  // LB: 符号扩展
//                    (aluop == `EXE_LBU_OP)  ? {{24{1'b0}}, mem_data[7:0]} :        // LBU: 零扩展
//                    (aluop == `EXE_LH_OP)   ? {{16{mem_data[15]}}, mem_data[15:0]} : // LH: 符号扩展
//                    (aluop == `EXE_LHU_OP)  ? {{16{1'b0}}, mem_data[15:0]} :       // LHU: 零扩展
//                    (aluop == `EXE_LW_OP)   ? mem_data :                           // LW: 全字直接加载
//                    32'b0;                                                        // 默认值

// // 存储数据
// assign store_data = (aluop == `EXE_SB_OP) ? src2[7:0] :       // SB: 低 8 位
//                     (aluop == `EXE_SH_OP) ? src2[15:0] :      // SH: 低 16 位
//                     (aluop == `EXE_SW_OP) ? src2 :            // SW: 全字存储
//                     32'b0;                                    // 默认值

    
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
//            final_result <= mem_to_reg_out ? mem_read_data : exe_result;
//        end
//    end
endmodule