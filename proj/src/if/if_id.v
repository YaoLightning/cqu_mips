`timescale 1ns / 1ps
`include "defines.vh"
//getin and getout
module inst_fetch (
    input   wire clk,              // Clock signal
    input   wire rstn,             // Reset signal
    input   wire [5:0]stall,            // Stall signal

    input   wire [31:0] pc_in,       // Program counter input
    input   wire [31:0] inst_in
    output  wire [31:0] pc_out,      // Program counter output
    output  wire [31:0] inst_out  // Fetched instruction
);

    always @(posedge clk or posedge reset) begin
        if (!rstn) begin
            // Reset the program counter to the initial value (e.g., 0x00400000)
            pc_out <= 8'h00000000;
            inst_out<=8'h00000000;
        end 
        else if(stall[1]== 1'b1 && stall[2]==1'b0)begin
            pc_out <= 8'h00000000;
            inst_out<=8'h00000000;
        end
        else if(stall==1'b1) begin
            pc_out <= pc_in;
            inst_out<=inst_in;
            end
    end

endmodule