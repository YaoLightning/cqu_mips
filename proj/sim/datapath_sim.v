`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 03:36:00 PM
// Design Name: 
// Module Name: datapath_sim
// Project Name: 
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


module datapath_sim(
    
);


reg clk;
reg rst;
wire [31:0] pc_out;
wire [31:0] instr_out;
wire [31:0] alu_out;

// 实例化datapath模块
datapath dp(
    .clk(clk),
    .rstn(rst)
);
// 时钟生成
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// 测试过程
initial begin
    // 初始化复位信号
    rst = 1;
    #10 rst = 0;
    #10 rst = 1;

    // 等待一段时间观察输出
    #1000 $finish;
end


endmodule
