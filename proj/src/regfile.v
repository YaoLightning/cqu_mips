`timescale 1ns / 1ps

module reg_file(
    input  wire clk,                // Clock signal
    input  wire rstn,                // Reset signal
    //写数据
    input reg_write,
    input [4:0] waddr,
    input [31:0] wdata,
    //读数据
    input re1,
    input [4:0] raddr1,
    output wire [31:0] rdata1,
    input re2,
    input [4:0] raddr2,
    output wire [31:0] rdata2
);
    // Register file array
    reg [31:0] reg_file [0:31];  // 32 registers, each 32 bits


//write operation
    always @(posedge clk or negedge rstn)begin
        if(!rstn)begin
//            for (integer i = 0; i < 32; i = i + 1) begin
//                reg_file[i] <= 32'h00000000;
//            end
        end else begin
            if((reg_write==1'b1)&&(waddr!=5'b00000))begin
                reg_file[waddr] <= wdata;
            end
        end
    end

    assign rdata1 = re1 & reg_file[raddr1];
    assign rdata2 = re2 & reg_file[raddr2];


// //read operation-the first regdata
//     always @(*) begin           //保证在译码阶段取得要读取的值（任何时候都有可能读取）
//         if(!rstn)begin   
//             rdata1<=8'h00000000;
//         end
//         else if(raddr1== 5'b00000)begin
//             rdata1<=8'h00000000;
//         end
//         else if((raddr1==waddr)&&(reg_write==1'b1)&&(re1==1'b1))begin
//             rdata1<=wdata;                                   //当同时发生读写时，直接将写的值传送给读,
//         end
//         else if(re1==1'b1)begin
//             rdata1 <= reg_file[raddr1];
//         end
//         else begin
//             rdata1 <=8'h00000000;
//         end
//     end

// //read operation-the second regdata
//     always @(*) begin           //保证在译码阶段取得要读取的值（任何时候都有可能读取）
//         if(!rstn)begin   
//             rdata2<=8'h00000000;
//         end
//         else if(raddr2== 5'b00000)begin
//             rdata2<=8'h00000000;
//         end
//         else if((raddr2==waddr)&&(reg_write==1'b1)&&(re2==1'b1))begin
//             rdata2<=wdata;                                   //当同时发生读写时，直接将写的值传送给读,
//         end
//         else if(re2==1'b1)begin
//             rdata2 <= reg_file[raddr2];
//         end
//         else begin
//             rdata2 <=8'h00000000;
//         end
//     end
endmodule