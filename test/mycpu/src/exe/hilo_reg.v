`timescale 1ns / 1ps

`include "defines.vh"

module hilo_reg(
    input clk,
    input rst,
    input we,
    input [31:0] hi_i,
    input [31:0] lo_i,

    output reg [31:0] hi_o,
    output reg [31:0] lo_o
    );

    always@(*)begin
        if(rst == 1'b1)begin
            hi_o <=  32'b0;
            lo_o <=  32'b0;
        end
        else if(we == 1'b1)begin
            hi_o <= hi_i;
            lo_o <= lo_i;
        end
    end
endmodule