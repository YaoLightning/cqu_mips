`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 12/24/2024 04:23:00 PM
// Design Name: cqu_mips
// Module Name: cache
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The cache module implements the data cache functionality in the MIPS processor. This module handles read and write operations of data, manages cache coherence, and interacts with the memory and other modules in the datapath.
// 
// Dependencies: 
// - Memory module (mem)
// - Control unit (control)
// - Datapath module (datapath)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////

module cache(
    input         clk,
    input         resetn, 

    //inst sram-like 
    input         inst_req     ,
    input         inst_wr      ,
    input  [1 :0] inst_size    ,
    input  [31:0] inst_addr    ,
    input  [31:0] inst_wdata   ,
    output [31:0] inst_rdata   ,
    output        inst_addr_ok ,
    output        inst_data_ok ,
    
    //data sram-like 
    input         data_req     ,
    input         data_wr      ,
    input  [1 :0] data_size    ,
    input  [31:0] data_addr    ,
    input  [31:0] data_wdata   ,
    output [31:0] data_rdata   ,
    output        data_addr_ok ,
    output        data_data_ok 

    
);


endmodule