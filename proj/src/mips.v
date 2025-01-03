`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 12/24/2024 05:00:00 PM
// Design Name: cqu_mips
// Module Name: mips
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mips(
    input wire clk,                // Clock signal
    input wire rstn               // Reset signal
    );

    wire [31:0] mem_addr;          // 内存地址
    wire [31:0] mem_wdata;         // 写数据
    wire        mem_write;         // 写使能信号
    wire        mem_read;          // 读使能信号
    wire [31:0] mem_rdata;         // 读数据

    // Instantiate the datapath module
    datapath datapath_m(
        .clk(clk),
        .rstn(rstn),
        .mem_addr(mem_addr),
        .mem_wdata(mem_wdata),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .mem_rdata(mem_rdata)
    );
    
    // Instantiate the ram_easy module
    ram_easy ram(
        .clka(clk),
        .ena(mem_read | mem_write),  // Enable signal for read or write
        .wea({mem_write}),          // Write enable signal
        .addra(mem_addr[16:0]),      // Address signal (17 bits)
        .dina(mem_wdata),            // Write data signal
        .douta(mem_rdata)            // Read data signal
    );
endmodule