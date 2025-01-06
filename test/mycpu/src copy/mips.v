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
    input wire rstn,               // Reset signal
    input [6:0] ext_int,

    // ************************************************************************ //

    // AXI接口
    // ar通道
    output wire [3:0] arid,
    output wire [31:0] araddr,
    output wire [7:0] arlen,
    output wire [2:0] arsize,
    output wire [1:0] arburst,
    output wire [1:0] arlock,
    output wire [3:0] arcache,
    output wire [2:0] arprot,
    output wire arvalid,
    input wire arready,
    // r通道
    input wire [3:0] rid,
    input wire [31:0] rdata,
    input wire [1:0] rresp,
    input wire rlast,
    input wire rvalid,
    output wire rready,
    // aw通道
    output wire [3:0] awid,
    output wire [31:0] awaddr,
    output wire [7:0] awlen,
    output wire [2:0] awsize,
    output wire [1:0] awburst,
    output wire [1:0] awlock,
    output wire [3:0] awcache,
    output wire [2:0] awprot,
    output wire awvalid,
    input wire awready,
    // w通道
    output wire [3:0] wid,
    output wire [31:0] wdata,
    output wire [3:0] wstrb,
    output wire wlast,
    output wire wvalid,
    input wire wready,
    // b通道
    input wire [3:0] bid,
    input wire [1:0] bresp,
    input wire bvalid,
    output wire bready,
    // ************************************************************************ //

    // output [31:0] pc,
    // input  [31:0] instr,

    // output        memwrite,
    // output [31:0] aluout,
    // output [31:0] writedata,
    // input  [31:0] readdata,
    // ************************************************************************ //

    //debug interface
    output [31:0] debug_wb_pc      ,
    output [3 :0] debug_wb_rf_wen  ,
    output [4 :0] debug_wb_rf_wnum ,
    output [31:0] debug_wb_rf_wdata

);

    wire [31:0] debug_wb_pc_wire      ;
    wire [3 :0] debug_wb_rf_wen_wire  ;
    wire [4 :0] debug_wb_rf_wnum_wire ;
    wire [31:0] debug_wb_rf_wdata_wire;

    assign debug_wb_pc       = debug_wb_pc_wire      ;
    assign debug_wb_rf_wen   = debug_wb_rf_wen_wire  ;
    assign debug_wb_rf_wnum  = debug_wb_rf_wnum_wire ;
    assign debug_wb_rf_wdata = debug_wb_rf_wdata_wire;


    // wire [31:0] mem_addr;          // 内存地址
    // wire [31:0] mem_wdata;         // 写数据
    // wire        mem_write;         // 写使能信号
    // wire        mem_read;          // 读使能信号
    // wire [31:0] mem_rdata;         // 读数据
    
    // wire [31:0] mem_addr_data;          // 内存地址
    // wire [31:0] mem_wdata_data;         // 写数据
    // wire        mem_write_data;         // 写使能信号
    // wire        mem_read_data;          // 读使能信号
    // wire [31:0] mem_rdata_data;         // 读数据

    // // 连接内部信号到外部接口
    // assign mem_addr = mem_addr_data;
    // assign mem_wdata = mem_wdata_data;
    // assign mem_write = mem_write_data;
    // assign mem_read = mem_read_data;
    // assign mem_rdata_data = mem_rdata;


    // Instantiate the datapath module
    datapath datapath_m(
        .clk                (clk),
        .rstn               (rstn),
        .ext_int            (ext_int),//外部中断（exception、cp0中断）
    // ************************************************************************ //

        // .inst_req           (cpu_inst_req),
        // .inst_wr            (cpu_inst_wr),
        // .inst_size          (cpu_inst_size),
        // .inst_addr          (cpu_inst_addr),
        // .inst_rdata         (cpu_inst_rdata),
        // .inst_addr_ok       (cpu_inst_addr_ok),
        // .inst_data_ok       (cpu_inst_data_ok),


        // .data_req           (cpu_data_req),
        // .data_wr            (cpu_data_wr),
        // .data_size          (cpu_data_size),
        // .data_addr          (cpu_data_addr),
        // .data_wdata         (cpu_data_wdata),
        // .data_rdata         (cpu_data_rdata),
        // .data_addr_ok       (cpu_data_addr_ok),
        // .data_data_ok       (cpu_data_data_ok),

    // ************************************************************************ //


        .pc                 (pc),
        .instr              (instr),
        .memwrite           (memwrite),
        .aluout             (aluout),
        .writedata          (writedata),
        .readdata           (readdata),
    // ************************************************************************ //
        //传入sram，下面转化为类sram的接口
        //inst_sram
        .inst_sram_en(inst_sram_en),
        .inst_sram_addr(inst_sram_addr),
        .inst_sram_rdata(inst_sram_rdata),
        .i_stall(i_stall),
        //data_sram
        .data_sram_en(data_sram_en),
        .data_sram_addr(data_sram_addr),
        .data_sram_rdata(data_sram_rdata),
        .data_sram_wen(data_sram_wen),
        .data_sram_wdata(data_sram_wdata),
        .d_stall(d_stall),

        .longest_stall(longest_stall),
    // ************************************************************************ //

        //debug interface
        .debug_wb_pc        (debug_wb_pc_wire),
        .debug_wb_rf_wen    (debug_wb_rf_wen_wire),
        .debug_wb_rf_wnum   (debug_wb_rf_wnum_wire),
        .debug_wb_rf_wdata  (debug_wb_rf_wdata_wire)
    );

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

    //此处进行接口逻辑转换
    //数据转接
    reg [31:0] data_addr_rcv;      //地址握手成功
    reg [31:0] data_finish;     //读写事务结束
    always @(posedge clk) begin
        data_addr_rcv <= rstn          ? 1'b0 :
                    cpu_data_req & cpu_data_addr_ok & ~cpu_data_data_ok ? 1'b1 :    //保证先data_req再addr_rcv；如果addr_ok同时data_ok，则优先data_ok
                    cpu_data_data_ok ? 1'b0 : data_addr_rcv;
    end

    always @(posedge clk) begin
        data_finish <= rstn          ? 1'b0 :
                     cpu_data_data_ok ? 1'b1 :
                     ~longest_stall ? 1'b0 : data_finish;
    end
    //save rdata
    reg [31:0] data_rdata_save;
    always @(posedge clk) begin
        data_rdata_save <= rstn ? 32'b0:
                           cpu_data_data_ok ? cpu_data_rdata : data_rdata_save;
    end
    //sram like
    assign cpu_data_req = data_sram_en & ~data_addr_rcv & ~data_finish;
    assign cpu_data_wr = data_sram_wen;
    assign cpu_data_size = (data_sram_wen==4'b0001 || data_sram_wen==4'b0010 || data_sram_wen==4'b0100 || data_sram_wen==4'b1000) ? 2'b00:
                       (data_sram_wen==4'b0011 || data_sram_wen==4'b1100 ) ? 2'b01 : 2'b10;
    assign cpu_data_addr =  cpu_data_wr ? data_sram_addr : {data_sram_addr[31:2],2'b00};
    assign cpu_data_wdata = data_sram_wdata;
    //sram
    assign data_sram_rdata = data_rdata_save;
    assign d_stall = data_sram_en & ~data_finish;

    //指令转接
    reg inst_addr_rcv;      //地址握手成功
    reg inst_finish;     //读事务结束
    always @(posedge clk) begin
        inst_addr_rcv <= rstn          ? 1'b0 :
                    cpu_inst_req & cpu_inst_addr_ok & ~cpu_inst_data_ok ? 1'b1 :    //保证先inst_req再addr_rcv；如果addr_ok同时data_ok，则优先data_ok
                    cpu_inst_data_ok ? 1'b0 : inst_addr_rcv;
    end
    always @(posedge clk) begin
        inst_finish <= rstn          ? 1'b0 :
                     cpu_inst_data_ok ? 1'b1 :
                     ~longest_stall ? 1'b0 : inst_finish;
    end
    //save rdata
    reg [31:0] inst_rdata_save;
    always @(posedge clk) begin
        inst_rdata_save <= rstn ? 32'b0:
                           cpu_inst_data_ok ? cpu_inst_rdata : inst_rdata_save;
    end
    //sram like
    assign cpu_inst_req = inst_sram_en & ~inst_addr_rcv & ~do_finish;
    assign cpu_inst_wr = 1'b0;
    assign cpu_inst_size = 2'b10;
    assign cpu_inst_addr = inst_sram_addr;
    assign cpu_inst_wdata = 32'b0;
    //sram
    assign inst_sram_rdata = inst_rdata_save;
    assign i_stall = inst_sram_en & ~inst_finish;

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

endmodule