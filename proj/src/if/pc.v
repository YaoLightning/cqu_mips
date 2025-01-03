`timescale 1ns / 1ps
`include "defines.vh"
//choose pc and pc+4
module pc_reg(
    input wire clk,
    input wire rstn,
    input wire [5:0]stall,    //暂停信号
    input wire jumpD,
    input wire[31:0]pc_in

    output reg[31:0] pc_out, //要读取的指令的地址
    output reg ce        //enable pc
    );
    always @(posedge clk)begin
        if(!rstn)begin
            ce<=1b'0;    //复位的时候指令存储器禁用
        end
        else begin
            ce<=1b'1;//复位结束后，指令存储器使能
        end
    end
    always @(posedge clk)begin
        if(ce==1b'0)begin
            pc_out<=32'h00000000;//指令存储器禁用的时候，PC为0
        end
        else if(stall[0] ==1b'0) begin //不暂停才赋值，暂停则保持不变
            if(jumpD== 1'b1)begin
                pc_out <= pc_in;
            end
            else begin
                pc_out<=pc_out+4'h4; //直接就在这里自动完成了加4的功能
            end
        end
        else begin
        end
    end
endmodule
