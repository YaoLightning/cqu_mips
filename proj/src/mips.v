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
    
    wire [31:0] mem_addr_data;          // 内存地址
    wire [31:0] mem_wdata_data;         // 写数据
    wire        mem_write_data;         // 写使能信号
    wire        mem_read_data;          // 读使能信号
    wire [31:0] mem_rdata_data;         // 读数据



    // Instantiate the datapath module
    datapath datapath_m(
        .clk(clk),
        .rstn(rstn),

        .inst_req(mem_read | mem_write),
        .inst_addr(mem_addr),
        .inst_rdata(mem_rdata),
        .inst_size(),
        .inst_wr(mem_write),
        .inst_addr_ok(1),
        .inst_data_ok(1),

        .data_req(mem_read_data | mem_write_data),
        .data_addr(mem_addr_data),
        .data_rdata(mem_rdata_data),
        .data_size(),
        .data_wr(mem_write_data),
        .data_addr_ok(1),
        .data_data_ok(1)
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
    
        // Instantiate the ram_easy module
    ram_easy ram_data(
        .clka(clk),
        .ena(mem_read_data | mem_write_data),  // Enable signal for read or write
        .wea({mem_write_data}),          // Write enable signal
        .addra(mem_addr_data[16:0]),      // Address signal (17 bits)
        .dina(mem_wdata_data),            // Write data signal
        .douta(mem_rdata_data)            // Read data signal
    );
endmodule