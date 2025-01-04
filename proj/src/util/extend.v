`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 12/24/2024 04:23:00 PM
// Design Name: cqu_mips
// Module Name: extend
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: this module is made for extend a number from a [a] bit to a [b] bit
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////

module extend #(
    parameter  IS_SIGNAL= 0,
    parameter  SRC_BITS = 16,
    parameter  DST_BITS= 32
) (
    input   [SRC_BITS - 1:0]  src,
    output  [DST_BITS - 1:0]  dst
);


assign dst = (IS_SIGNAL == 1) ?
    {{(DST_BITS - SRC_BITS){src[SRC_BITS - 1]}}, src} : 
    {{(DST_BITS - SRC_BITS){1'b0}}, src };

    
endmodule