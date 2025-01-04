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
        .rstn(rstn)

//        .inst_req(mem_read | mem_write),
//        .inst_addr(mem_addr),
//        .inst_rdata(mem_rdata),
//        .inst_size(),
//        .inst_wr(mem_write),
//        .inst_addr_ok(1),
//        .inst_data_ok(1),

//        .data_req(mem_read_data | mem_write_data),
//        .data_addr(mem_addr_data),
//        .data_rdata(mem_rdata_data),
//        .data_size(),
//        .data_wr(mem_write_data),
//        .data_addr_ok(1),
//        .data_data_ok(1)
    );
    
    // Instantiate the ram_easy module
//    ram_easy ram(
//        .clka(clk),
//        .ena(mem_read | mem_write),  // Enable signal for read or write
//        .wea({mem_write}),          // Write enable signal
//        .addra(mem_addr[16:0]),      // Address signal (17 bits)
//        .dina(mem_wdata),            // Write data signal
//        .douta(mem_rdata)            // Read data signal
//    );
    
//        // Instantiate the ram_easy module
//    ram_easy ram_data(
//        .clka(clk),
//        .ena(mem_read_data | mem_write_data),  // Enable signal for read or write
//        .wea({mem_write_data}),          // Write enable signal
//        .addra(mem_addr_data[16:0]),      // Address signal (17 bits)
//        .dina(mem_wdata_data),            // Write data signal
//        .douta(mem_rdata_data)            // Read data signal
//    );

    // MIPS核心数据接口信号
    wire cpu_data_req;
    wire cpu_data_wr;
    wire [1 :0] cpu_data_size;
    wire [31:0] cpu_data_addr;
    wire [31:0] cpu_data_wdata;
    wire [31:0] cpu_data_rdata;
    wire cpu_data_addr_ok;
    wire cpu_data_data_ok;

    // MIPS核心指令接口信号
    wire cpu_inst_req;
    wire cpu_inst_wr;
    wire [1 :0] cpu_inst_size;
    wire [31:0] cpu_inst_addr;
    wire [31:0] cpu_inst_wdata;
    wire [31:0] cpu_inst_rdata;
    wire cpu_inst_addr_ok;
    wire cpu_inst_data_ok;

    // AXI接口信号
    // ar通道
    wire [3 :0] arid;
    wire [31:0] araddr;
    wire [7 :0] arlen;
    wire [2 :0] arsize;
    wire [1 :0] arburst;
    wire [1 :0] arlock;
    wire [3 :0] arcache;
    wire [2 :0] arprot;
    wire        arvalid;
    wire        arready;
    // r通道
    wire [3 :0] rid;
    wire [31:0] rdata;
    wire [1 :0] rresp;
    wire        rlast;
    wire        rvalid;
    wire        rready;
    // aw通道
    wire [3 :0] awid;
    wire [31:0] awaddr;
    wire [7 :0] awlen;
    wire [2 :0] awsize;
    wire [1 :0] awburst;
    wire [1 :0] awlock;
    wire [3 :0] awcache;
    wire [2 :0] awprot;
    wire        awvalid;
    wire        awready;
    // w通道
    wire [3 :0] wid;
    wire [31:0] wdata;
    wire [3 :0] wstrb;
    wire        wlast;
    wire        wvalid;
    wire        wready;
    // b通道
    wire [3 :0] bid;
    wire [1 :0] bresp;
    wire        bvalid;
    wire        bready;

    // 缓存模块与总线接口模块连接信号
    wire        cache_data_req;
    wire        cache_data_wr;
    wire [1 :0] cache_data_size;
    wire [31:0] cache_data_addr;
    wire [31:0] cache_data_wdata;
    wire [31:0] cache_data_rdata;
    wire        cache_data_addr_ok;
    wire        cache_data_data_ok;
    wire        cache_inst_req;
    wire        cache_inst_wr;
    wire [1 :0] cache_inst_size;
    wire [31:0] cache_inst_addr;
    wire [31:0] cache_inst_wdata;
    wire [31:0] cache_inst_rdata;
    wire        cache_inst_addr_ok;
    wire        cache_inst_data_ok;

    // 实例化缓存模块
    cache_module cache (
        .clk      (clk),
        .rst      (~resetn),
        .cpu_data_req         (cpu_data_req),
        .cpu_data_wr          (cpu_data_wr),
        .cpu_data_size        (cpu_data_size),
        .cpu_data_addr        (cpu_data_addr),
        .cpu_data_wdata       (cpu_data_wdata),
        .cpu_data_rdata       (cpu_data_rdata),
        .cpu_data_addr_ok     (cpu_data_addr_ok),
        .cpu_data_data_ok     (cpu_data_data_ok),
        .cpu_inst_req         (cpu_inst_req),
        .cpu_inst_wr          (cpu_inst_wr),
        .cpu_inst_size        (cpu_inst_size),
        .cpu_inst_addr        (cpu_inst_addr),
        .cpu_inst_wdata       (cpu_inst_wdata),
        .cpu_inst_rdata       (cpu_inst_rdata),
        .cpu_inst_addr_ok     (cpu_inst_addr_ok),
        .cpu_inst_data_ok     (cpu_inst_data_ok),
        .cache_data_req       (cache_data_req),
        .cache_data_wr        (cache_data_wr),
        .cache_data_size      (cache_data_size),
        .cache_data_addr      (cache_data_addr),
        .cache_data_wdata     (cache_data_wdata),
        .cache_data_rdata     (cache_data_rdata),
        .cache_data_addr_ok   (cache_data_addr_ok),
        .cache_data_data_ok   (cache_data_data_ok),
        .cache_inst_req       (cache_inst_req),
        .cache_inst_wr        (cache_inst_wr),
        .cache_inst_size      (cache_inst_size),
        .cache_inst_addr      (cache_inst_addr),
        .cache_inst_wdata     (cache_inst_wdata),
        .cache_inst_rdata     (cache_inst_rdata),
        .cache_inst_addr_ok   (cache_inst_addr_ok),
        .cache_inst_data_ok   (cache_inst_data_ok)
    );

    // 实例化总线接口模块
    cpu_axi_interface axi_interface (
        .clk          (clk),
        .resetn       (resetn),
        .inst_req     (cache_inst_req),
        .inst_wr      (cache_inst_wr),
        .inst_size    (cache_inst_size),
        .inst_addr    (cache_inst_addr),
        .inst_wdata   (cache_inst_wdata),
        .inst_rdata   (cache_inst_rdata),
        .inst_addr_ok (cache_inst_addr_ok),
        .inst_data_ok (cache_inst_data_ok),
        .data_req     (cache_data_req),
        .data_wr      (cache_data_wr),
        .data_size    (cache_data_size),
        .data_addr    (cache_data_addr),
        .data_wdata   (cache_data_wdata),
        .data_rdata   (cache_data_rdata),
        .data_addr_ok (cache_data_addr_ok),
        .data_data_ok (cache_data_data_ok),
        .arid         (arid),
        .araddr       (araddr),
        .arlen        (arlen),
        .arsize       (arsize),
        .arburst      (arburst),
        .arlock       (arlock),
        .arcache      (arcache),
        .arprot       (arprot),
        .arvalid      (arvalid),
        .arready      (arready),
        .rid          (rid),
        .rdata        (rdata),
        .rresp        (rresp),
        .rlast        (rlast),
        .rvalid       (rvalid),
        .rready       (rready),
        .awid         (awid),
        .awaddr       (awaddr),
        .awlen        (awlen),
        .awsize       (awsize),
        .awburst      (awburst),
        .awlock       (awlock),
        .awcache      (awcache),
        .awprot       (awprot),
        .awvalid      (awvalid),
        .awready      (awready),
        .wid          (wid),
        .wdata        (wdata),
        .wstrb        (wstrb),
        .wlast        (wlast),
        .wvalid       (wvalid),
        .wready       (wready),
        .bid          (bid),
        .bresp        (bresp),
        .bvalid       (bvalid),
        .bready       (bready)
    );

    ram_axi4 ram (
        .rsta_busy(rsta_busy),
        .rstb_busy(rstb_busy),
        .s_aclk(clk),
        .s_aresetn(resetn),
        .s_axi_awid(awid),
        .s_axi_awaddr(awaddr),
        .s_axi_awlen(awlen),
        .s_axi_awsize(arsize),
        .s_axi_awburst(awburst),
        .s_axi_awvalid(awvalid),
        .s_axi_awready(awready),
        .s_axi_wdata(wdata),
        .s_axi_wstrb(wstrb),
        .s_axi_wlast(wlast),
        .s_axi_wvalid(wvalid),
        .s_axi_wready(wready),
        .s_axi_bid(bid),
        .s_axi_bresp(bresp),
        .s_axi_bvalid(bvalid),
        .s_axi_bready(bready),
        .s_axi_arid(arid),
        .s_axi_araddr(araddr),
        .s_axi_arlen(arlen),
        .s_axi_arsize(arsize),
        .s_axi_arburst(arburst),
        .s_axi_arvalid(arvalid),
        .s_axi_arready(arready),
        .s_axi_rid(rid),
        .s_axi_rdata(rdata),
        .s_axi_rresp(rresp),
        .s_axi_rlast(rlast),
        .s_axi_rvalid(rvalid),
        .s_axi_rready(rready)
    );
endmodule