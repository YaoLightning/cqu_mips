`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/23 11:18:06
// Design Name: cqu_mips
// Module Name: execute
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The execute module handles memory read and write operations in the MIPS processor.
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
`include "defines.vh"
module execute(
    //clock and reset
    input  wire clk,                // Clock signal
    input  wire rstn,              // Reset signal
    input  wire stall,            // Stall signal     
    // Inputs from decode stage
    input  wire [31:0] rs_in,         // Source register 1 value
    input  wire [31:0] rt_in,         // Source register 2 value or immediate value
    input  wire [31:0] imm_in,        // Immediate value;
    input  wire [7: 0] aluop_in,        // ALU operation code
    input  wire [2: 0] alusel_in,       // ALU Select Signal

    input  wire        id_valid,

    input  wire [31:0] forwardData_exe,
    input  wire [31:0] forwardData_mem,

    input  wire [1 :0] forwardaE_in,
    input  wire [1 :0] forwardbE_in,

    input  wire        imm_en,

    input  wire [4: 0] write_reg_in,        // Destination register address  // 写回寄存器的地址
    input  wire        reg_write_in, // Register write enable signal  // 是否写回寄存器标志

    input  wire        mem_to_reg_in,// Memory to register selection signal
    input  wire        mem_read_in,
    input  wire        mem_write_in,

    output wire        mem_read_out,
    output wire        mem_write_out,

    input  wire        hi_read,
    input  wire        lo_read,

    input  wire        hi_write,
    input  wire        lo_write,

    input  wire [31:0] inst_in,
    output wire [31:0] inst_out,
    input  wire [31:0] pc_in,
    output wire [31:0] pc_out,

    output wire        arith_stall,

    // output to memory stage
    output wire [31:0] alu_result,      // ALU operation result
    output wire [ 4:0] write_reg,       // Register address to be written
    output wire        reg_write_out,   // Register write enable signal
    output wire        mem_to_reg_out,
    output wire [31:0] mem_data_out,    // Address memory for read or write

    output wire        exe_valid,

    output wire [31:0] hi_out,        // hi output
    output wire [31:0] lo_out,        // lo output
    output wire        whilo_out      // Write HI/LO enable flag
);


reg [31:0] rs_reg;
reg [31:0] rt_reg;
reg [7 :0] aluop_reg;
reg [2 :0] alusel_reg;
reg [4 :0] write_reg_reg;
reg        reg_write_reg;
reg        mem_to_reg_reg;
reg        mem_read_reg;  
reg        mem_write_reg;
reg [31:0] inst;
reg [31:0] mem_data_out_reg;
reg        arith_stall_reg;
reg        exe_valid_reg;

assign arith_stall      = arith_stall_reg;
assign reg_write_out    = reg_write_reg;
assign write_reg        = write_reg_reg;
assign mem_to_reg_out   = mem_to_reg_reg;
assign mem_read_out     = mem_read_reg;
assign mem_write_out    = mem_write_reg;
assign inst_out         = inst;
assign exe_valid        = exe_valid_reg;
assign mem_data_out     = mem_data_out_reg;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        rs_reg          <= 32'h0;
        rt_reg          <= 32'h0;
        aluop_reg       <= 8'h0;
        alusel_reg      <= 3'h0;
        write_reg_reg   <= 5'h0;
        reg_write_reg   <= 1'b0;
        mem_to_reg_reg  <= 1'b0;
        mem_read_reg    <= 1'b0;
        mem_write_reg   <= 1'b0;
        inst            <= 32'h0;
        arith_stall_reg <= 1'b0;
        exe_valid_reg  <= 1'b0;
        mem_data_out_reg <= 32'h0;
    end else if (!stall) begin
        rs_reg          <= rs_in;
        rt_reg          <= rt_in;
        aluop_reg       <= aluop_in;
        alusel_reg      <= alusel_in;
        write_reg_reg   <= write_reg_in;
        reg_write_reg   <= reg_write_in;
        mem_to_reg_reg  <= mem_to_reg_in;
        mem_read_reg    <= mem_read_in;
        mem_write_reg   <= mem_write_in;
        inst            <= inst_in;
        arith_stall_reg <= 1'b0;
        exe_valid_reg   <= 1'b1;
        mem_data_out_reg <= rt_in;
    end else begin
        arith_stall_reg <= arith_stall_reg;

        rs_reg          <= rs_reg;  
        rt_reg          <= rt_reg;
        aluop_reg       <= aluop_reg;
        alusel_reg      <= alusel_reg;
        write_reg_reg   <= write_reg_reg;
        reg_write_reg   <= reg_write_reg;
        mem_to_reg_reg  <= mem_to_reg_reg;
        mem_read_reg    <= mem_read_reg;
        mem_write_reg   <= mem_write_reg;
        inst            <= inst;
        mem_data_out_reg <= rt_in;

        arith_stall_reg <= 1'b1;
        exe_valid_reg  <= 1'b0;
    end
end

wire [31:0] alu_src1;
wire [31:0] alu_src2;
wire [7 :0] alu_op;
wire [2 :0] alu_sel;
wire [31:0] alu_res;
wire        zero;

assign alu_src1 = 
    // (forwardaE_in[0] & forwardData_exe) |
    // (forwardaE_in[1] & forwardData_mem) |
    // (inst_in[31:26] == 6'b000000 & inst_in[5:0] == `EXE_SLL & rt_reg) | 
    ((inst_in[31:26] == 6'b000000 & inst_in[5:0] == `EXE_SLL) |
    ( inst_in[31:26] == 6'b000000 & inst_in[5:0] == `EXE_SRL)) ?
    (rt_in) :
    (rs_in);
assign alu_src2 = 
    // (forwardbE_in[0] & forwardData_exe) |
    // (forwardbE_in[1] & forwardData_mem) |
    imm_en ? (imm_in) : (rt_in);

assign alu_op   = aluop_in;
assign alu_sel  = alusel_in;

assign alu_result = alu_res;

alu alu_unit(   
    .clk(clk),
    .rstn(rstn),
    .a(alu_src1),
    .b(alu_src2),
    .alu_op(alu_op),
    .alu_sel(alu_sel),
    .result(alu_res),
    .zero(zero)
);

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


endmodule