`timescale 1ns / 1ps

module reg_file(
    input  wire clk,                // Clock signal
    input  wire rstn,                // Reset signal
    //写数据
    input reg_write,
    input [4:0] waddr,
    input [31:0] wdata,
    //读数据
    input [4:0] raddr1,
    output wire [31:0] rdata1,
    input [4:0] raddr2,
    output wire [31:0] rdata2
);
    // Register file array
    reg [31:0] reg_file [0:31];  // 32 registers, each 32 bits


//write operation
    always @(posedge clk or negedge rstn)begin
        if(!rstn)begin
            // Fill all registers with 0
//           for (integer i = 0; i < 32; i = i + 1) begin
//               reg_file[i] <= 32'b0;
//           end
        end else begin
            if((reg_write==1'b1)&&(waddr!=5'b00000))begin
                reg_file[waddr] <= wdata;
            end
        end
    end

    assign rdata1 = reg_file[raddr1];
    assign rdata2 = reg_file[raddr2];
endmodule