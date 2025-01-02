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
// Description: The cache module implements the data cache functionality in the MIPS processor. 
// This module handles read and write operations of data, manages cache coherence, and interacts 
//  with the memory and other modules in the datapath.
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

module cache
#(
    parameter int CACHE_SIZE = 10240,  // cache size
    parameter int NUM_LINES = 256,     // cache line number
    parameter int NUM_WAYS = 4,        // cache way number
    parameter int WORD_SIZE = 32       // word size （bit）
)(
    input         clk,
    input         rstn, 

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
    output        data_data_ok ,

    output        req_hit
);

    // Calculate the number of bits for index, tag, and offset
    localparam int INDEX_BITS   = $clog2(NUM_LINES / NUM_WAYS);
    localparam int OFFSET_BITS  = $clog2(WORD_SIZE) - INDEX_BITS;
    localparam int TAG_BITS     = 32 - OFFSET_BITS - INDEX_BITS;

    // Internal signals
    reg [31:0]           cache_memory   [NUM_LINES - 1:0][NUM_WAYS - 1:0];
    reg [TAG_BITS - 1:0] tag_memory     [NUM_LINES - 1:0][NUM_WAYS - 1:0];
    reg [NUM_WAYS - 1:0] valid_memory   [NUM_LINES - 1:0];
    reg [NUM_WAYS - 1:0] dirty_memory   [NUM_LINES - 1:0];

    // Address decoding
    wire [OFFSET_BITS - 1:0]  offset  = inst_addr[OFFSET_BITS - 1               : 0];
    wire [INDEX_BITS  - 1:0]  index   = inst_addr[OFFSET_BITS + INDEX_BITS - 1  : OFFSET_BITS];
    wire [TAG_BITS    - 1:0]  tag     = inst_addr[31                            : OFFSET_BITS + INDEX_BITS];

    // Hit detection
    wire [NUM_WAYS    - 1:0]  hit     = valid_memory[index] & (tag_memory[index] == tag);
    assign req_hit = |hit;

    // LRU logic for 2-way set associative cache
    reg lru [NUM_LINES - 1:0];

    reg [31:0] inst_read_reg;
    reg [31:0] data_read_reg;

    always @(posedge clk) begin
        if (|hit) begin
            data_read_reg <= cache_memory[index];
        end
    end



    always @(negedge rstn) begin
        
    end

endmodule