`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/23 11:18:06
// Design Name: cqu_mips
// Module Name: if
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The instruction fetch stage (IF) fetches instructions from memory using the program counter (PC).
// 
// Dependencies: 
// - Memory module (mem)
// - Control unit (control)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////

module inst_fetch (
    input   wire clk,              // Clock signal
    input   wire rstn,             // Reset signal
    input   wire stall,            // Stall signal

    input   wire [31:0] pc_in,       // Program counter input
    output  wire [31:0] pc_out,      // Program counter output
    output  wire [31:0] instruction  // Fetched instruction
);

    reg [31:0] pc;
    reg [31:0] instruction_reg;


    // Memory model for demonstration purposes
    reg [31:0] mem [0:1023]; // 4KB memory
    // TODO: use true memory rather than the reg array

    assign pc_out = pc;
    assign instruction = instruction_reg;

    integer i;
    // Instruction fetch stage logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // Reset the program counter to the initial value (e.g., 0x00400000)
            // pc <= 32'h00000000;

            // // Logical operation instructions
            // mem[0 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b00011, 5'b00000, 6'b100100}; // and $3, $1, $2
            // mem[1 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b00100, 5'b00000, 6'b100101}; // or $4, $1, $2
            // mem[2 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b00101, 5'b00000, 6'b100110}; // xor $5, $1, $2
            // mem[3 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b00110, 5'b00000, 6'b100111}; // nor $6, $1, $2
            // mem[4 ] <= {6'b001100, 5'b00001, 5'b00010, 16'h000A}; // andi $2, $1, 10

            // // Arithmetic operation instructions
            // mem[5 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b00011, 5'b00000, 6'b100000}; // add $3, $1, $2
            // mem[6 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b00100, 5'b00000, 6'b100001}; // addu $4, $1, $2
            // mem[7 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b00101, 5'b00000, 6'b100010}; // sub $5, $1, $2
            // mem[8 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b00110, 5'b00000, 6'b100011}; // subu $6, $1, $2
            // mem[9 ] <= {6'b000000, 5'b00001, 5'b00010, 5'b01000, 5'b00000, 6'b101010}; // slt $8, $1, $2
            // mem[10] <= {6'b001000, 5'b00001, 5'b00010, 16'h0005}; // addi $2, $1, 5

            // instruction_reg = 32'b0;

                        // Reset the program counter to the initial value (e.g., 0x00400000)
            pc <= 32'h00000000;

            mem[0 ] <= {6'b001000, 5'b00000, 5'b00000, 16'h0000};
            mem[1 ] <= {6'b001000, 5'b00001, 5'b00001, 16'h0001};
            mem[2 ] <= {6'b001000, 5'b00010, 5'b00010, 16'h0002};
            mem[3 ] <= {6'b001000, 5'b00011, 5'b00011, 16'h0003};
            mem[4 ] <= {6'b001000, 5'b00100, 5'b00100, 16'h0004};
            mem[5 ] <= {6'b001000, 5'b00101, 5'b00101, 16'h0005};
            mem[6 ] <= {6'b001000, 5'b00110, 5'b00110, 16'h0006};
            mem[7 ] <= {6'b001000, 5'b00111, 5'b00111, 16'h0007};
            mem[8 ] <= {6'b001000, 5'b01000, 5'b01000, 16'h0008};
            mem[9 ] <= {6'b001000, 5'b01001, 5'b01001, 16'h0009};
            mem[10] <= {6'b001000, 5'b01010, 5'b01010, 16'h000A};
            mem[11] <= {6'b001000, 5'b01011, 5'b01011, 16'h000B};
            mem[12] <= {6'b001000, 5'b01100, 5'b01100, 16'h000C};
            mem[13] <= {6'b001000, 5'b01101, 5'b01101, 16'h000D};
            mem[14] <= {6'b001000, 5'b01110, 5'b01110, 16'h000E};
            mem[15] <= {6'b001000, 5'b01111, 5'b01111, 16'h000F};
            mem[16] <= {6'b001000, 5'b10000, 5'b10000, 16'h0010};
            mem[17] <= {6'b001000, 5'b10001, 5'b10001, 16'h0011};
            mem[18] <= {6'b001000, 5'b10010, 5'b10010, 16'h0012};
            mem[19] <= {6'b001000, 5'b10011, 5'b10011, 16'h0013};
            mem[20] <= {6'b001000, 5'b10100, 5'b10100, 16'h0014};
            mem[21] <= {6'b001000, 5'b10101, 5'b10101, 16'h0015};
            mem[22] <= {6'b001000, 5'b10110, 5'b10110, 16'h0016};
            mem[23] <= {6'b001000, 5'b10111, 5'b10111, 16'h0017};
            mem[24] <= {6'b001000, 5'b11000, 5'b11000, 16'h0018};
            mem[25] <= {6'b001000, 5'b11001, 5'b11001, 16'h0019};
            mem[26] <= {6'b001000, 5'b11010, 5'b11010, 16'h001A};
            mem[27] <= {6'b001000, 5'b11011, 5'b11011, 16'h001B};
            mem[28] <= {6'b001000, 5'b11100, 5'b11100, 16'h001C};
            mem[29] <= {6'b001000, 5'b11101, 5'b11101, 16'h001D};
            mem[30] <= {6'b001000, 5'b11110, 5'b11110, 16'h001E};
            mem[31] <= {6'b001000, 5'b11111, 5'b11111, 16'h0020};

            // Logical operation instructions
            mem[32] <= {6'b000000, 5'b00001, 5'b00010, 5'b00011, 5'b00000, 6'b100100}; // and $3, $1, $2
            mem[33] <= {6'b000000, 5'b00001, 5'b00010, 5'b00100, 5'b00000, 6'b100101}; // or $4, $1, $2
            mem[34] <= {6'b000000, 5'b00001, 5'b00010, 5'b00101, 5'b00000, 6'b100110}; // xor $5, $1, $2
            mem[35] <= {6'b000000, 5'b00001, 5'b00010, 5'b00110, 5'b00000, 6'b100111}; // nor $6, $1, $2
            mem[36] <= {6'b001100, 5'b00001, 5'b00010, 16'h000A}; // andi $2, $1, 10

            // Arithmetic operation instructions
            mem[37] <= {6'b000000, 5'b00001, 5'b00010, 5'b00011, 5'b00000, 6'b100000}; // add $3, $1, $2
            mem[38] <= {6'b000000, 5'b00001, 5'b00010, 5'b00100, 5'b00000, 6'b100001}; // addu $4, $1, $2
            mem[39] <= {6'b000000, 5'b00001, 5'b00010, 5'b00101, 5'b00000, 6'b100010}; // sub $5, $1, $2
            mem[40] <= {6'b000000, 5'b00001, 5'b00010, 5'b00110, 5'b00000, 6'b100011}; // subu $6, $1, $2
            mem[41] <= {6'b000000, 5'b00001, 5'b00010, 5'b01000, 5'b00000, 6'b101010}; // slt $8, $1, $2
            mem[42] <= {6'b001000, 5'b00001, 5'b00010, 16'h0005}; // addi $2, $1, 5

            // Shift instructions
            mem[43] <= {6'b000000, 5'b00000, 5'b00010, 5'b00111, 5'b00000, 6'b000010}; // srl $7, $2, 0
            mem[44] <= {6'b000000, 5'b00001, 5'b00010, 5'b01001, 5'b00000, 6'b000011}; // sra $9, $1, $2
            mem[45] <= {6'b000000, 5'b00000, 5'b00010, 5'b01010, 5'b00000, 6'b000100}; // sll $10, $2, 0
            mem[46] <= {6'b000000, 5'b00001, 5'b00010, 5'b01011, 5'b00000, 6'b000110}; // srlv $11, $2, $1
            mem[47] <= {6'b000000, 5'b00001, 5'b00010, 5'b01100, 5'b00000, 6'b000111}; // srav $12, $2, $1

            // Data movement instructions
            mem[48] <= {6'b000000, 5'b00000, 5'b00000, 5'b01101, 5'b00000, 6'b010000}; // mfhi $13
            mem[49] <= {6'b000000, 5'b00000, 5'b00000, 5'b01110, 5'b00000, 6'b010010}; // mflo $14
            mem[50] <= {6'b000000, 5'b00001, 5'b00000, 5'b00000, 5'b00000, 6'b010001}; // mthi $1
            mem[51] <= {6'b000000, 5'b00001, 5'b00000, 5'b00000, 5'b00000, 6'b010011}; // mtlo $1

            // Branch and jump instructions
            mem[52] <= {6'b000010, 26'b00000000000000000000000000}; // j 0x00000000
            mem[53] <= {6'b000011, 26'b00000000000000000000000000}; // jal 0x00000000
            mem[54] <= {6'b000100, 5'b00001, 5'b00010, 16'h0005}; // beq $1, $2, 5
            mem[55] <= {6'b000101, 5'b00001, 5'b00010, 16'hFFFF}; // bne $1, $2, -1
            mem[56] <= {6'b000110, 5'b00001, 5'b00000, 16'h0005}; // blez $1, 5
            mem[57] <= {6'b000111, 5'b00001, 5'b00000, 16'hFFFF}; // bgtz $1, -1
            mem[58] <= {6'b000001, 5'b00001, 5'b00010, 16'h0005}; // bltz $1, 5
            mem[59] <= {6'b000001, 5'b00001, 5'b10000, 16'h0005}; // bltzal $1, 5
            mem[60] <= {6'b000001, 5'b00001, 5'b00001, 16'h0005}; // bgez $1, 5
            mem[61] <= {6'b000001, 5'b00001, 5'b10001, 16'h0005}; // bgezal $1, 5

            // Memory access instructions
            mem[62] <= {6'b100000, 5'b00001, 5'b00010, 16'h0005}; // lb $2, 5($1)
            mem[63] <= {6'b100100, 5'b00001, 5'b00010, 16'h0005}; // lbu $2, 5($1)
            mem[64] <= {6'b100001, 5'b00001, 5'b00010, 16'h0005}; // lh $2, 5($1)
            mem[65] <= {6'b100101, 5'b00001, 5'b00010, 16'h0005}; // lhu $2, 5($1)
            mem[66] <= {6'b100011, 5'b00001, 5'b00010, 16'h0005}; // lw $2, 5($1)
            mem[67] <= {6'b101000, 5'b00001, 5'b00010, 16'h0005}; // sb $2, 5($1)
            mem[68] <= {6'b101001, 5'b00001, 5'b00010, 16'h0005}; // sh $2, 5($1)
            mem[69] <= {6'b101011, 5'b00001, 5'b00010, 16'h0005}; // sw $2, 5($1)

            // Trap and system call instructions
            mem[70] <= {6'b000000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 6'b001100}; // syscall
            mem[71] <= {6'b000000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 6'b001101}; // break

            instruction_reg = 32'b0;
        end else begin

            // Assuming the memory module is connected to fetch the instruction
            // Here we assume a simple memory read operation
            // In a real design, this would involve interfacing with the memory module
            instruction_reg <= mem[pc / 4]; // Fetch instruction from memory

            // Fetch the instruction from memory using the current PC
            pc <= pc_in;
        end
    end

  
endmodule