`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/23 11:18:06
// Design Name: cqu_mips
// Module Name: execute
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The execute module handles memory read and write operations in the MIPS processor.
// 
// Dependencies: 
// - ALU module
// - Data memory module
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////
`include "defines.vh"
module div(

	input wire		  clk,
	input wire		  rst,
	
	input wire        signed_div_i,//是否为有符号除法
	input wire [31:0] opdata1_i,//被除数
	input wire [31:0] opdata2_i,//除数
	input wire        start_i,//是否开始除法运算
	input wire        annul_i,//是否取消除法运算
	
	output reg [63:0] result_o,//商
	output reg		  ready_o//是否完成除法运算
);

	wire[32:0] div_temp;
	reg[5:0]   cnt;//计数器
	reg[64:0]  dividend;//被除数
	reg[1:0]   state;
	reg[31:0]  divisor;//除数	 
	reg[31:0]  temp_op1;
	reg[31:0]  temp_op2;

	// Replace macro `RstEnable` with 1
	// Replace macro `DivFree`, `DivByZero`, `DivOn`, `DivEnd` with actual values
	// Replace `ZeroWord` with 32'b0
	// Replace `DivResultNotReady` with 0 and `DivResultReady` with 1
	// Replace `DivStart` with 1 and `DivStop` with 0
	
	assign div_temp = {1'b0,dividend[63:32]} - {1'b0,divisor};

	always @ (posedge clk) begin
		if (rst == 1) begin
			state <= 2'b00; // DivFree
			ready_o <= 0;   // DivResultNotReady
			result_o <= {32'b0, 32'b0};
		end else begin
		  case (state)// DivFree, DivByZero, DivOn, DivEnd
		  	2'b00:			begin               // DivFree
		  		if(start_i == 1 && annul_i == 1'b0) begin // DivStart
		  			if(opdata2_i == 32'b0) begin
		  				state <= 2'b01; // DivByZero//除数为0，进入DivByZero状态
		  			end else begin
		  				state <= 2'b10; // DivOn//除数不为0，进入DivOn状态
		  				cnt <= 6'b000000;
		  				if(signed_div_i == 1'b1 && opdata1_i[31] == 1'b1 ) begin
		  					temp_op1 = ~opdata1_i + 1;
		  				end else begin
		  					temp_op1 = opdata1_i;
		  				end
		  				if(signed_div_i == 1'b1 && opdata2_i[31] == 1'b1 ) begin
		  					temp_op2 = ~opdata2_i + 1;
		  				end else begin
		  					temp_op2 = opdata2_i;
		  				end
		  				dividend <= {32'b0, 32'b0};
              dividend[32:1] <= temp_op1;
              divisor <= temp_op2;
             end
          end else begin//非除法运算，信号清空
						ready_o <= 0; // DivResultNotReady
						result_o <= {32'b0, 32'b0};
				  end          	
		  	end
		  	2'b01:		begin               // DivByZero
         	dividend <= {32'b0, 32'b0};
          state <= 2'b11; // DivEnd 		
		  	end
		  	2'b10:				begin               // DivOn
		  		if(annul_i == 1'b0) begin
		  			if(cnt != 6'b100000) begin
               if(div_temp[32] == 1'b1) begin
                  dividend <= {dividend[63:0] , 1'b0};
               end else begin
                  dividend <= {div_temp[31:0] , dividend[31:0] , 1'b1};
               end
               cnt <= cnt + 1;
             end else begin
               if((signed_div_i == 1'b1) && ((opdata1_i[31] ^ opdata2_i[31]) == 1'b1)) begin
                  dividend[31:0] <= (~dividend[31:0] + 1);
               end
               if((signed_div_i == 1'b1) && ((opdata1_i[31] ^ dividend[64]) == 1'b1)) begin              
                  dividend[64:33] <= (~dividend[64:33] + 1);
               end
               state <= 2'b11; // DivEnd
               cnt <= 6'b000000;            	
             end
		  		end else begin
		  			state <= 2'b00; // DivFree
		  		end	
		  	end
		  	2'b11:			begin               // DivEnd
        	result_o <= {dividend[64:33], dividend[31:0]};  
            ready_o <= 1; // DivResultReady
          if(start_i == 0) begin // DivStop
          	state <= 2'b00; // DivFree
						ready_o <= 0; // DivResultNotReady
						result_o <= {32'b0, 32'b0};       	
          end		  	
		  	end
		  endcase
		end
	end

endmodule
