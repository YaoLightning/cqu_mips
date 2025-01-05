`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 03:36:00 PM
// Design Name: 
// Module Name: cpu_sim
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


module cpu_sim(
    
);
reg clk;
reg rst;

// 实例化mips模块
mips mips_unit(
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
