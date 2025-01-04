// `timescale 1ns / 1ps
// //////////////////////////////////////////////////////////////////////////////////
// // Company: CQU
// // Engineer: Napbad
// // 
// // Create Date: 2024/12/24 04:23:00 PM
// // Design Name: cqu_mips
// // Module Name: id
// // Project Name: cqu_mips
// // Target Devices: 
// // Tool Versions: 
// // Description: The instruction decode stage (ID) decodes the fetched instruction and generates control signals for the execution stage.
// // 
// // Dependencies: 
// // - Instruction fetch stage (if)
// // - Control unit (control)
// // - Register file (reg_file)
// // 
// // Revision:
// // Revision 0.01 - File Created
// // Additional Comments:
// // - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// // - Ensure that the correct tool versions are used during simulation and synthesis.
// // 
// //////////////////////////////////////////////////////////////////////////////////

// `include "defines.vh"
// module inst_decode (
//     // Clock and rstn signals
//     input   wire clk,                // Clock signal
//     input   wire rstn,              // rstn signal
//     input   wire stall,              // stall signal

//     // Inputs from the instruction fetch stage
//     input   wire [31:0]     instruction, // Instruction fetched from the instruction fetch stage
//     input   wire [31:0]     pc,          // Current program counter value

//     // Forwarding signals from other stages (example, may be more complex in reality)
//     input   wire [31:0]     forward_a,   // Data forwarded to source register 1
//     input   wire [31:0]     forward_b,   // Data forwarded to source register 2
//     input   wire            forward_a_sel,      // Selection signal for forwarding data to source register 1
//     input   wire            forward_b_sel,      // Selection signal for forwarding data to source register 2

//     // Input and output related to the register file
//     output  wire [4:0]      rs,           // Source register 1 address
//     output  wire [4:0]      rt,           // Source register 2 address
//     output  wire [4:0]      rd,           // Destination register address
//     output  wire [15:0]     imm,          // Immediate value
//     output  wire [5:0]      opcode,       // Opcode of the instruction
//     output  wire [5:0]      funct,        // Function field for R-type instructions

//     output  wire [2:0]      alu_op,       // ALU operation result
//     output  wire [2:0]      alu_sel,      // ALU operation result

//     // instruction outputs
//     output  wire [31:0]     inst_out,          // The instruction output

//     // Control signal outputs
//     output  wire            alu_src,           // ALU source selection signal, 1 means use immediate value, 0 means use register
//     output  wire            reg_dst,           // Register destination selection signal, 1 means write to rd, 0 means write to rt
//     output  wire            reg_write,         // Register write enable signal
//     output  wire            mem_read,          // Memory read enable signal
//     output  wire            mem_write,         // Memory write enable signal
//     output  wire            mem_to_reg,        // Memory to register selection signal, 1 means write memory data to register
//     output  wire            branch,            // Branch signal, 1 means a branch operation is needed
//     output  wire            jump,              // Jump signal, 1 means a jump operation is needed
//     output  wire [31:0]     extended_imm,      // Extended immediate value
//     output  wire [31:0]     pc_plus_4,          // The value of the current PC + 4
// );

//     // Internal registers to store output values
//     reg [4 :0] rs_reg;
//     reg [4 :0] rt_reg;
//     reg [4 :0] rd_reg;
//     reg [15:0] imm_reg;
//     reg [5 :0] opcode_reg;
//     reg [5 :0] funct_reg;

//     // this reg is used to store the instruction which is decoding
//     reg [31:0] instruction_reg;

//     reg [7 :0] curr_alu_inst;

//     // Instruction decode logic
//     always @(posedge clk or negedge rstn) begin
//         if (!rstn) begin
//             // rstn outputs to default values
//             rs_reg <= 5'b00000;
//             rt_reg <= 5'b00000;
//             rd_reg <= 5'b00000;
//             imm_reg <= 16'b0000000000000000;
//             opcode_reg <= 6'b000000;
//             funct_reg <= 6'b000000;
//         end else begin
//             // Extract fields from the instruction

//             instruction_reg <= instruction;
            
//             rs_reg <= instruction[25:21];
//             rt_reg <= instruction[20:16];
//             rd_reg <= instruction[15:11];
//             imm_reg <= instruction[15:0];
//             opcode_reg <= instruction[31:26];
//             funct_reg <= instruction[5:0];
//         end
//     end

//     // for the control signal, just use combinatorial logic
//     // because that the previous [always] block has already consume a cycle
//     // if the control signal still use one cycle, then the id stage will 
//     // cost 2 cycles


//     // `define EXE_AND 		6'b100100 
//     // for example: AND instruction
//     // assume that the alu_op for add is 7
//     //                   this is the case that the opcode correspond to AND
//     // if there are more , such as SUB, is 6,then
//     // assign alu_op = (7 & (opcode_reg == `EXE_AND))
//     //               | (6 & (opcode_reg == `EXE_SUB));
//     // assign alu_sel=();
    
//     // assign alu_src=();
//     // assign reg_dst=();

//     // for the jump 
//     // `define EXE_J  6'b000010

//     assign jump   = (opcode_reg == `EXE_J);
//     assign branch = (opcode_reg == `EXE_BEQ)
//                   | (opcode_reg == `EXE_BNE);

//     // Assign internal registers to output wires
//     assign rs = rs_reg;
//     assign rt = rt_reg;
//     assign rd = rd_reg;
//     assign imm = imm_reg;
//     assign opcode = opcode_reg;
//     assign funct = funct_reg;

//     assign inst_out = instruction_reg;

// endmodule



// for the control signal, just use combinatorial logic
    // because that the previous [always] block has already consume a cycle
    // if the control signal still use one cycle, then the id stage will 
    // cost 2 cycles

    // ALU operation and selection decoding
    // always @(*) begin
    //     case (opcode_reg)
    //         `EXE_AND:        curr_alu_inst = `EXE_AND_OP;
    //         `EXE_OR:         curr_alu_inst = `EXE_OR_OP;
    //         `EXE_XOR:        curr_alu_inst = `EXE_XOR_OP;
    //         `EXE_NOR:        curr_alu_inst = `EXE_NOR_OP;
    //         `EXE_ANDI:       curr_alu_inst = `EXE_ANDI_OP;
    //         `EXE_ORI:        curr_alu_inst = `EXE_ORI_OP;
    //         `EXE_XORI:       curr_alu_inst = `EXE_XORI_OP;
    //         `EXE_LUI:        curr_alu_inst = `EXE_LUI_OP;
    //         `EXE_SLL:        curr_alu_inst = `EXE_SLL_OP;
    //         `EXE_SLLV:       curr_alu_inst = `EXE_SLLV_OP;
    //         `EXE_SRL:        curr_alu_inst = `EXE_SRL_OP;
    //         `EXE_SRLV:       curr_alu_inst = `EXE_SRLV_OP;
    //         `EXE_SRA:        curr_alu_inst = `EXE_SRA_OP;
    //         `EXE_SRAV:       curr_alu_inst = `EXE_SRAV_OP;
    //         `EXE_MFHI:       curr_alu_inst = `EXE_MFHI_OP;
    //         `EXE_MTHI:       curr_alu_inst = `EXE_MTHI_OP;
    //         `EXE_MFLO:       curr_alu_inst = `EXE_MFLO_OP;
    //         `EXE_MTLO:       curr_alu_inst = `EXE_MTLO_OP;
    //         `EXE_SLT:        curr_alu_inst = `EXE_SLT_OP;
    //         `EXE_SLTU:       curr_alu_inst = `EXE_SLTU_OP;
    //         `EXE_SLTI:       curr_alu_inst = `EXE_SLTI_OP;
    //         `EXE_SLTIU:      curr_alu_inst = `EXE_SLTIU_OP;
    //         `EXE_ADD:        curr_alu_inst = `EXE_ADD_OP;
    //         `EXE_ADDU:       curr_alu_inst = `EXE_ADDU_OP;
    //         `EXE_SUB:        curr_alu_inst = `EXE_SUB_OP;
    //         `EXE_SUBU:       curr_alu_inst = `EXE_SUBU_OP;
    //         `EXE_ADDI:       curr_alu_inst = `EXE_ADDI_OP;
    //         `EXE_ADDIU:      curr_alu_inst = `EXE_ADDIU_OP;
    //         `EXE_MULT:       curr_alu_inst = `EXE_MULT_OP;
    //         `EXE_MULTU:      curr_alu_inst = `EXE_MULTU_OP;
    //         `EXE_DIV:        curr_alu_inst = `EXE_DIV_OP;
    //         `EXE_DIVU:       curr_alu_inst = `EXE_DIVU_OP;
    //         `EXE_J:          curr_alu_inst = `EXE_J_OP;
    //         `EXE_JAL:        curr_alu_inst = `EXE_JAL_OP;
    //         `EXE_JALR:       curr_alu_inst = `EXE_JALR_OP;
    //         `EXE_JR:         curr_alu_inst = `EXE_JR_OP;
    //         `EXE_BEQ:        curr_alu_inst = `EXE_BEQ_OP;
    //         `EXE_BGEZ:       curr_alu_inst = `EXE_BGEZ_OP;
    //         `EXE_BGEZAL:     curr_alu_inst = `EXE_BGEZAL_OP;
    //         `EXE_BGTZ:       curr_alu_inst = `EXE_BGTZ_OP;
    //         `EXE_BLEZ:       curr_alu_inst = `EXE_BLEZ_OP;
    //         `EXE_BLTZ:       curr_alu_inst = `EXE_BLTZ_OP;
    //         `EXE_BLTZAL:     curr_alu_inst = `EXE_BLTZAL_OP;
    //         `EXE_BNE:        curr_alu_inst = `EXE_BNE_OP;
    //         `EXE_LB:         curr_alu_inst = `EXE_LB_OP;
    //         `EXE_LBU:        curr_alu_inst = `EXE_LBU_OP;
    //         `EXE_LH:         curr_alu_inst = `EXE_LH_OP;
    //         `EXE_LHU:        curr_alu_inst = `EXE_LHU_OP;
    //         `EXE_LL:         curr_alu_inst = `EXE_LL_OP;
    //         `EXE_LW:         curr_alu_inst = `EXE_LW_OP;
    //         `EXE_LWL:        curr_alu_inst = `EXE_LWL_OP;
    //         `EXE_LWR:        curr_alu_inst = `EXE_LWR_OP;
    //         `EXE_SB:         curr_alu_inst = `EXE_SB_OP;
    //         `EXE_SC:         curr_alu_inst = `EXE_SC_OP;
    //         `EXE_SH:         curr_alu_inst = `EXE_SH_OP;
    //         `EXE_SW:         curr_alu_inst = `EXE_SW_OP;
    //         `EXE_SWL:        curr_alu_inst = `EXE_SWL_OP;
    //         `EXE_SWR:        curr_alu_inst = `EXE_SWR_OP;
    //         `EXE_SYSCALL:    curr_alu_inst = `EXE_SYSCALL_OP;
    //         `EXE_BREAK:      curr_alu_inst = `EXE_BREAK_OP;
    //         `EXE_TEQ:        curr_alu_inst = `EXE_TEQ_OP;
    //         `EXE_TEQI:       curr_alu_inst = `EXE_TEQI_OP;
    //         `EXE_TGE:        curr_alu_inst = `EXE_TGE_OP;
    //         `EXE_TGEI:       curr_alu_inst = `EXE_TGEI_OP;
    //         `EXE_TGEIU:      curr_alu_inst = `EXE_TGEIU_OP;
    //         `EXE_TGEU:       curr_alu_inst = `EXE_TGEU_OP;
    //         `EXE_TLT:        curr_alu_inst = `EXE_TLT_OP;
    //         `EXE_TLTI:       curr_alu_inst = `EXE_TLTI_OP;
    //         `EXE_TLTIU:      curr_alu_inst = `EXE_TLTIU_OP;
    //         `EXE_TLTU:       curr_alu_inst = `EXE_TLTU_OP;
    //         `EXE_TNE:        curr_alu_inst = `EXE_TNE_OP;
    //         `EXE_TNEI:       curr_alu_inst = `EXE_TNEI_OP;
    //         `EXE_ERET:       curr_alu_inst = `EXE_ERET_OP;
    //         `EXE_SYNC:       curr_alu_inst = `EXE_SYNC_OP;
    //         `EXE_PREF:       curr_alu_inst = `EXE_PREF_OP;
    //         `EXE_SPECIAL_INST:  curr_alu_inst = 8'bxxxx_xxxx; // Need to further decode based on funct field for SPECIAL_INST
    //         `EXE_REGIMM_INST:   curr_alu_inst = 8'bxxxx_xxxx; // Need to further decode based on funct field for REGIMM_INST
    //         `EXE_SPECIAL2_INST: curr_alu_inst = 8'bxxxx_xxxx; // Need to further decode based on funct field for SPECIAL2_INST
    //         default:            curr_alu_inst = 8'bxxxx_xxxx;
    //     endcase
    // end

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 2024/12/24 04:23:00 PM
// Design Name: cqu_mips
// Module Name: id
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: The instruction decode stage (ID) decodes the fetched instruction and generates control signals for the execution stage.
// 
// Dependencies: 
// - Instruction fetch stage (if)
// - Control unit (control)
// - Register file (reg_file)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - This module is part of the MIPS processor design aimed at implementing a complete five-stage pipeline architecture.
// - Ensure that the correct tool versions are used during simulation and synthesis.
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.vh"
module inst_decode (
    // Clock and rstn signals
    input   wire clk,                // Clock signal
    input   wire rstn,               // rstn signal
    input   wire stall,              // stall signal

    // Inputs from the instruction fetch stage
    input   wire [31:0]     instruction, // Instruction fetched from the instruction fetch stage
    input   wire [31:0]     pc,          // Current program counter value

    // Forwarding signals from other stages (example, may be more complex in reality)
    input   wire [31:0]     forward_a,          // Data forwarded to source register 1
    input   wire [31:0]     forward_b,          // Data forwarded to source register 2
    input   wire            forward_a_sel,      // Selection signal for forwarding data to source register 1
    input   wire            forward_b_sel,      // Selection signal for forwarding data to source register 2

    //from reg to determine equal

    // Input and output related to the register file
    output  wire [4:0]      rs,           // Source register 1 address
    output  wire [4:0]      rt,           // Source register 2 address
    output  wire [4:0]      rd,           // Destination register address
    output  wire [15:0]     imm,          // Immediate value
    output  wire [5:0]      opcode,       // Opcode of the instruction
    output  wire [5:0]      funct,        // Function field for R-type instructions
    // instruction outputs
    output  wire [7:0]      alu_op,       // ALU operation result
    output  wire [2:0]      alu_sel,      // ALU operation result

    // Control signal outputs
    output  wire            alu_src,           // ALU source selection signal, 1 means use immediate value, 0 means use register
    output  wire            reg_dst,           // Register destination selection signal, 1 means write to rd, 0 means write to rt
    output  wire            reg_write,         // Register write enable signal
    output  wire            mem_read,          // Memory read enable signal
    output  wire            mem_write,         // Memory write enable signal
    output  wire            mem_to_reg,        // Memory to register selection signal, 1 means write memory data to register
    output  wire            branch,            // Branch signal, 1 means a branch operation is needed
    output  wire            jump,              // Jump signal, 1 means a jump operation is needed

    output  wire [31:0]     inst_out,          // The instruction output


    output  wire [31:0]     extended_imm,      // Extended immediate value
    output  wire [31:0]     pc_plus_4,         // The value of the current PC + 4
    output  wire [1:0]      pc_src,            // include [jump , branch & equal]
    output  wire [31:0]     pc_branch,
    output  wire [31:0]     pc_jump

);

    // Internal registers to store output values
    reg [4 :0] rs_reg;
    reg [4 :0] rt_reg;
    reg [4 :0] rd_reg;
    reg [15:0] imm_reg;
    reg [5 :0] opcode_reg;
    reg [5 :0] funct_reg;
    // this reg is used to store the instruction which is decoding
    reg [31:0] instruction_reg;
    reg [7 :0] curr_alu_inst;
    reg [2 :0] curr_alu_sel;

    // Assign internal registers to output wires
    assign rs = rs_reg;
    assign rt = rt_reg;
    assign rd = rd_reg;
    assign imm = imm_reg;
    assign opcode = opcode_reg;
    assign funct = funct_reg;
    assign inst_out = instruction_reg;
    assign alu_op=curr_alu_inst;
    assign alu_sel=curr_alu_sel;

    // Instruction decode logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            // rstn outputs to default values
            rs_reg      <= 5'b00000;
            rt_reg      <= 5'b00000;
            rd_reg      <= 5'b00000;
            imm_reg     <= 16'b0000000000000000;
            opcode_reg  <= 6'b000000;
            funct_reg   <= 6'b000000;
        end else begin
            // Extract fields from the instruction
            instruction_reg <= instruction;
            rs_reg          <= instruction[25:21];
            rt_reg          <= instruction[20:16];
            rd_reg          <= instruction[15:11];
            imm_reg         <= instruction[15: 0];
            opcode_reg      <= instruction[31:26];
            funct_reg       <= instruction[5 : 0];
        end
    end

    //curr_alu_inst value
    always @(*) begin
        case (opcode_reg)
            `EXE_AND:        curr_alu_inst = `EXE_AND_OP;
            `EXE_OR:         curr_alu_inst = `EXE_OR_OP;
            `EXE_XOR:        curr_alu_inst = `EXE_XOR_OP;
            `EXE_NOR:        curr_alu_inst = `EXE_NOR_OP;
            `EXE_ANDI:       curr_alu_inst = `EXE_ANDI_OP;
            `EXE_ORI:        curr_alu_inst = `EXE_ORI_OP;
            `EXE_XORI:       curr_alu_inst = `EXE_XORI_OP;
            `EXE_LUI:        curr_alu_inst = `EXE_LUI_OP;
            `EXE_SLL:        curr_alu_inst = `EXE_SLL_OP;
            `EXE_SLLV:       curr_alu_inst = `EXE_SLLV_OP;
            `EXE_SRL:        curr_alu_inst = `EXE_SRL_OP;
            `EXE_SRLV:       curr_alu_inst = `EXE_SRLV_OP;
            `EXE_SRA:        curr_alu_inst = `EXE_SRA_OP;
            `EXE_SRAV:       curr_alu_inst = `EXE_SRAV_OP;
            `EXE_MFHI:       curr_alu_inst = `EXE_MFHI_OP;
            `EXE_MTHI:       curr_alu_inst = `EXE_MTHI_OP;
            `EXE_MFLO:       curr_alu_inst = `EXE_MFLO_OP;
            `EXE_MTLO:       curr_alu_inst = `EXE_MTLO_OP;
            `EXE_SLT:        curr_alu_inst = `EXE_SLT_OP;
            `EXE_SLTU:       curr_alu_inst = `EXE_SLTU_OP;
            `EXE_SLTI:       curr_alu_inst = `EXE_SLTI_OP;
            `EXE_SLTIU:      curr_alu_inst = `EXE_SLTIU_OP;
            `EXE_ADD:        curr_alu_inst = `EXE_ADD_OP;
            `EXE_ADDU:       curr_alu_inst = `EXE_ADDU_OP;
            `EXE_SUB:        curr_alu_inst = `EXE_SUB_OP;
            `EXE_SUBU:       curr_alu_inst = `EXE_SUBU_OP;
            `EXE_ADDI:       curr_alu_inst = `EXE_ADDI_OP;
            `EXE_ADDIU:      curr_alu_inst = `EXE_ADDIU_OP;
            `EXE_MULT:       curr_alu_inst = `EXE_MULT_OP;
            `EXE_MULTU:      curr_alu_inst = `EXE_MULTU_OP;
            `EXE_DIV:        curr_alu_inst = `EXE_DIV_OP;
            `EXE_DIVU:       curr_alu_inst = `EXE_DIVU_OP;
            `EXE_J:          curr_alu_inst = `EXE_J_OP;
            `EXE_JAL:        curr_alu_inst = `EXE_JAL_OP;
            `EXE_JALR:       curr_alu_inst = `EXE_JALR_OP;
            `EXE_JR:         curr_alu_inst = `EXE_JR_OP;
            `EXE_BEQ:        curr_alu_inst = `EXE_BEQ_OP;
            `EXE_BGEZ:       curr_alu_inst = `EXE_BGEZ_OP;
            `EXE_BGEZAL:     curr_alu_inst = `EXE_BGEZAL_OP;
            `EXE_BGTZ:       curr_alu_inst = `EXE_BGTZ_OP;
            `EXE_BLEZ:       curr_alu_inst = `EXE_BLEZ_OP;
            `EXE_BLTZ:       curr_alu_inst = `EXE_BLTZ_OP;
            `EXE_BLTZAL:     curr_alu_inst = `EXE_BLTZAL_OP;
            `EXE_BNE:        curr_alu_inst = `EXE_BNE_OP;
            `EXE_LB:         curr_alu_inst = `EXE_LB_OP;
            `EXE_LBU:        curr_alu_inst = `EXE_LBU_OP;
            `EXE_LH:         curr_alu_inst = `EXE_LH_OP;
            `EXE_LHU:        curr_alu_inst = `EXE_LHU_OP;
            `EXE_LL:         curr_alu_inst = `EXE_LL_OP;
            `EXE_LW:         curr_alu_inst = `EXE_LW_OP;
            `EXE_LWL:        curr_alu_inst = `EXE_LWL_OP;
            `EXE_LWR:        curr_alu_inst = `EXE_LWR_OP;
            `EXE_SB:         curr_alu_inst = `EXE_SB_OP;
            `EXE_SC:         curr_alu_inst = `EXE_SC_OP;
            `EXE_SH:         curr_alu_inst = `EXE_SH_OP;
            `EXE_SW:         curr_alu_inst = `EXE_SW_OP;
            `EXE_SWL:        curr_alu_inst = `EXE_SWL_OP;
            `EXE_SWR:        curr_alu_inst = `EXE_SWR_OP;
            `EXE_SYSCALL:    curr_alu_inst = `EXE_SYSCALL_OP;
            `EXE_BREAK:      curr_alu_inst = `EXE_BREAK_OP;
            `EXE_TEQ:        curr_alu_inst = `EXE_TEQ_OP;
            `EXE_TEQI:       curr_alu_inst = `EXE_TEQI_OP;
            `EXE_TGE:        curr_alu_inst = `EXE_TGE_OP;
            `EXE_TGEI:       curr_alu_inst = `EXE_TGEI_OP;
            `EXE_TGEIU:      curr_alu_inst = `EXE_TGEIU_OP;
            `EXE_TGEU:       curr_alu_inst = `EXE_TGEU_OP;
            `EXE_TLT:        curr_alu_inst = `EXE_TLT_OP;
            `EXE_TLTI:       curr_alu_inst = `EXE_TLTI_OP;
            `EXE_TLTIU:      curr_alu_inst = `EXE_TLTIU_OP;
            `EXE_TLTU:       curr_alu_inst = `EXE_TLTU_OP;
            `EXE_TNE:        curr_alu_inst = `EXE_TNE_OP;
            `EXE_TNEI:       curr_alu_inst = `EXE_TNEI_OP;
            `EXE_ERET:       curr_alu_inst = `EXE_ERET_OP;
            `EXE_SYNC:       curr_alu_inst = `EXE_SYNC_OP;
            `EXE_PREF:       curr_alu_inst = `EXE_PREF_OP;
            `EXE_SPECIAL_INST: begin
                case (funct_reg)
                    `EXE_ADD:     curr_alu_inst = `EXE_ADD_OP;
                    `EXE_ADDU:    curr_alu_inst = `EXE_ADDU_OP;
                    `EXE_SUB:     curr_alu_inst = `EXE_SUB_OP;
                    `EXE_SUBU:    curr_alu_inst = `EXE_SUBU_OP;
                    `EXE_AND:     curr_alu_inst = `EXE_AND_OP;
                    `EXE_OR:      curr_alu_inst = `EXE_OR_OP;
                    `EXE_XOR:     curr_alu_inst = `EXE_XOR_OP;
                    `EXE_NOR:     curr_alu_inst = `EXE_NOR_OP;
                    `EXE_SLT:     curr_alu_inst = `EXE_SLT_OP;
                    `EXE_SLTU:    curr_alu_inst = `EXE_SLTU_OP;
                    `EXE_SLL:     curr_alu_inst = `EXE_SLL_OP;
                    `EXE_SRL:     curr_alu_inst = `EXE_SRL_OP;
                    `EXE_SRA:     curr_alu_inst = `EXE_SRA_OP;
                    `EXE_JR:      curr_alu_inst = `EXE_JR_OP;
                    `EXE_JALR:    curr_alu_inst = `EXE_JALR_OP;
                    default:      curr_alu_inst = 8'bxxxx_xxxx;
                endcase
            end
            `EXE_REGIMM_INST: begin
                case (funct_reg)
                    // Add cases for REGIMM_INST based on funct field if needed
                    default:      curr_alu_inst = 8'bxxxx_xxxx;
                endcase
            end
            `EXE_SPECIAL2_INST: begin
                case (funct_reg)
                    // Add cases for SPECIAL2_INST based on funct field if needed
                    default:      curr_alu_inst = 8'bxxxx_xxxx;
                endcase
            end
            default:            curr_alu_inst = 8'bxxxx_xxxx;
        endcase
    end

    // ALU source and register destination selection
    // assign alu_src = (opcode_reg == `EXE_ANDI)  |
    //                  (opcode_reg == `EXE_ORI)   |
    //                  (opcode_reg == `EXE_XORI)  |
    //                  (opcode_reg == `EXE_LUI)   |
    //                  (opcode_reg == `EXE_SLTI)  |
    //                  (opcode_reg == `EXE_SLTIU) |
    //                  (opcode_reg == `EXE_ADDI)  |
    //                  (opcode_reg == `EXE_ADDIU);
    // alu_src value
    reg alu_src_reg;
    assign alu_src = alu_src_reg;
    always @(*) begin
        case (opcode_reg)
            `EXE_ANDI, `EXE_ORI, `EXE_XORI, `EXE_LUI,
            `EXE_ADDI, `EXE_ADDIU, `EXE_SLTI, `EXE_SLTIU,
            `EXE_LB, `EXE_LBU, `EXE_LH, `EXE_LHU, 
            `EXE_LL, `EXE_LW, `EXE_LWL, `EXE_LWR,
            `EXE_SB, `EXE_SC, `EXE_SH, `EXE_SW, 
            `EXE_SWL, `EXE_SWR: 
                alu_src_reg = 1'b1;
            default: 
                alu_src_reg = 1'b0;
        endcase
    end

    // assign reg_dst = (opcode_reg == `EXE_SPECIAL_INST) &&
    //                  (funct_reg!= `EXE_JR) &&
    //                  (funct_reg!= `EXE_JALR);
    //reg_dst value
    reg  reg_dst_reg;
    assign reg_dst = reg_dst_reg;
    always @(*) begin
        case (opcode_reg)
            `EXE_SPECIAL_INST: 
                reg_dst_reg = 1'b1; // R型，目标寄存器为rd
            `EXE_JALR: 
                reg_dst_reg = 1'b1; // R型，写回 rd
            `EXE_REGIMM_INST: 
                reg_dst_reg = 1'b0; // 不写回 rd
            default: 
                reg_dst_reg = 1'b0; // I型指令，目标寄存器为rt
        endcase
    end

    // Register write, memory read/write, and other control signals
    // assign reg_write = (opcode_reg!= `EXE_J)     &&
    //                  (opcode_reg!= `EXE_JAL)     &&
    //                  (opcode_reg!= `EXE_BEQ)     &&
    //                  (opcode_reg!= `EXE_BNE)     &&
    //                  (opcode_reg!= `EXE_BGTZ)    &&
    //                  (opcode_reg!= `EXE_BLEZ)    &&
    //                  (opcode_reg!= `EXE_BLTZ)    &&
    //                  (opcode_reg!= `EXE_BGEZ)    &&
    //                  (opcode_reg!= `EXE_SYSCALL) &&
    //                  (opcode_reg!= `EXE_BREAK);
    //reg_write value
    reg reg_write_reg;
    assign reg_write=reg_write_reg;
    always @(*) begin
        case (opcode_reg)
            `EXE_SPECIAL_INST: begin
                case (funct_reg)
                    `EXE_MFHI, `EXE_MFLO, 
                    `EXE_AND, `EXE_OR, `EXE_XOR, `EXE_NOR,
                    `EXE_SLL, `EXE_SLLV, `EXE_SRL, `EXE_SRLV, `EXE_SRA, `EXE_SRAV,
                    `EXE_ADD, `EXE_ADDU, `EXE_SUB, `EXE_SUBU, 
                    `EXE_SLT, `EXE_SLTU, `EXE_MULT, `EXE_MULTU, 
                    `EXE_DIV, `EXE_DIVU,
                    `EXE_JALR: 
                        reg_write_reg = 1'b1;
                    `EXE_MTHI, `EXE_MTLO: 
                        reg_write_reg = 1'b0;
                    default: 
                        reg_write_reg = 1'b0;
                endcase
            end

            `EXE_REGIMM_INST: begin
                case (rs_reg)
                    `EXE_BGEZAL, `EXE_BLTZAL: 
                        reg_write_reg = 1'b1; // 写回 $ra
                    default: 
                        reg_write_reg = 1'b0;
                endcase
            end

            // 逻辑指令、算术立即数指令、加载指令、跳转指令（如 JAL, JALR）
            `EXE_ANDI, `EXE_ORI, `EXE_XORI, `EXE_LUI,
            `EXE_ADDI, `EXE_ADDIU, `EXE_SLTI, `EXE_SLTIU,
            `EXE_JAL, `EXE_JALR,
            `EXE_LB, `EXE_LBU, `EXE_LH, `EXE_LHU, 
            `EXE_LL, `EXE_LW, `EXE_LWL, `EXE_LWR: 
                reg_write_reg = 1'b1;

            // 存储指令、跳转指令（如 JR）
            `EXE_J, `EXE_JR, 
            `EXE_BEQ, `EXE_BNE, `EXE_BGTZ, `EXE_BLEZ, 
            `EXE_BGEZ, `EXE_BGEZAL, `EXE_BLTZ, `EXE_BLTZAL,
            `EXE_SB, `EXE_SC, `EXE_SH, `EXE_SW, 
            `EXE_SWL, `EXE_SWR,
            `EXE_SYSCALL, `EXE_BREAK, `EXE_ERET, `EXE_SYNC, `EXE_PREF: 
                reg_write_reg = 1'b0;

            default: 
                reg_write_reg = 1'b0;
        endcase
    end
    assign mem_read = (opcode_reg == `EXE_LB) ||
                     (opcode_reg == `EXE_LBU) ||
                     (opcode_reg == `EXE_LH)  ||
                     (opcode_reg == `EXE_LHU) ||
                     (opcode_reg == `EXE_LL)  ||
                     (opcode_reg == `EXE_LW)  ||
                     (opcode_reg == `EXE_LWL) ||
                     (opcode_reg == `EXE_LWR);
    assign mem_write = (opcode_reg == `EXE_SB)||
                     (opcode_reg == `EXE_SC)  ||
                     (opcode_reg == `EXE_SH)  ||
                     (opcode_reg == `EXE_SW)  ||
                     (opcode_reg == `EXE_SWL) ||
                     (opcode_reg == `EXE_SWR);
    assign mem_to_reg = (opcode_reg == `EXE_LB)||
                     (opcode_reg == `EXE_LBU)  ||
                     (opcode_reg == `EXE_LH)   ||
                     (opcode_reg == `EXE_LHU)  ||
                     (opcode_reg == `EXE_LL)   ||
                     (opcode_reg == `EXE_LW)   ||
                     (opcode_reg == `EXE_LWL)  ||
                     (opcode_reg == `EXE_LWR);

    // Branch and jump signals
    // assign jump = (opcode_reg == `EXE_J)        ||
    //                  (opcode_reg == `EXE_JAL)   ||
    //                  (opcode_reg == `EXE_JALR);
    // assign branch = (opcode_reg == `EXE_BEQ)    ||
    //                  (opcode_reg == `EXE_BNE)   ||
    //                  (opcode_reg == `EXE_BGTZ)  ||
    //                  (opcode_reg == `EXE_BLEZ)  ||
    //                  (opcode_reg == `EXE_BLTZ)  ||
    //                  (opcode_reg == `EXE_BGEZ);
    
    //branch value
	reg branch_reg;
	assign branch=branch_reg;
    always @(*) begin
        case (opcode_reg)
            `EXE_BEQ, `EXE_BNE, `EXE_BGTZ, `EXE_BLEZ, 
            `EXE_BGEZ, `EXE_BGEZAL, `EXE_BLTZ, `EXE_BLTZAL: 
                branch_reg = 1'b1;
            default: 
                branch_reg = 1'b0;
        endcase
    end

    //jump value
    reg jump_reg;
    assign jump=jump_reg;
    always @(*) begin
        case (opcode_reg)
            `EXE_J, `EXE_JAL, `EXE_JR, `EXE_JALR: 
                jump_reg = 1'b1;
            default: 
                jump_reg = 1'b0;
        endcase
    end

    // Extended immediate value
    assign extended_imm = {{16{imm_reg[15]}}, imm_reg};

    // PC + 4 value
    assign pc_plus_4 = pc + 4;

    //current_alu_sel value
    always @(*) begin
        case (opcode_reg)
            `EXE_SPECIAL_INST: begin // R型指令
                case (funct_reg)
                    `EXE_AND:  curr_alu_sel = `EXE_RES_LOGIC;
                    `EXE_OR:    curr_alu_sel = `EXE_RES_LOGIC;
                    `EXE_XOR:   curr_alu_sel = `EXE_RES_LOGIC;
                    `EXE_NOR:   curr_alu_sel = `EXE_RES_LOGIC; 

                    `EXE_SLL:   curr_alu_sel = `EXE_RES_SHIFT;
                    `EXE_SLLV:  curr_alu_sel = `EXE_RES_SHIFT;
                    `EXE_SRL:   curr_alu_sel = `EXE_RES_SHIFT;
                    `EXE_SRLV:  curr_alu_sel = `EXE_RES_SHIFT;
                    `EXE_SRA:   curr_alu_sel = `EXE_RES_SHIFT;
                    `EXE_SRAV:  curr_alu_sel = `EXE_RES_SHIFT; 

                    `EXE_MFHI:  curr_alu_sel = `EXE_RES_MOVE;
                    `EXE_MTHI:  curr_alu_sel = `EXE_RES_MOVE;
                    `EXE_MFLO:  curr_alu_sel = `EXE_RES_MOVE;
                    `EXE_MTLO:  curr_alu_sel = `EXE_RES_MOVE; 

                    `EXE_ADD:   curr_alu_sel = `EXE_RES_ARITHMETIC;
                    `EXE_ADDU:  curr_alu_sel = `EXE_RES_ARITHMETIC;
                    `EXE_SUB:   curr_alu_sel = `EXE_RES_ARITHMETIC;
                    `EXE_SUBU:  curr_alu_sel = `EXE_RES_ARITHMETIC;

                    `EXE_SLT:   curr_alu_sel = `EXE_RES_ARITHMETIC;
                    `EXE_SLTU:  curr_alu_sel = `EXE_RES_ARITHMETIC;
                    `EXE_MULT:  curr_alu_sel = `EXE_RES_ARITHMETIC;
                    `EXE_MULTU: curr_alu_sel = `EXE_RES_ARITHMETIC; 
                    `EXE_DIV:   curr_alu_sel = `EXE_RES_ARITHMETIC;
                    `EXE_DIVU:  curr_alu_sel = `EXE_RES_ARITHMETIC; 

                    default: 
                        curr_alu_sel = 3'b000; // 默认值或未定义指令
                endcase
            end

            `EXE_REGIMM_INST: begin // REGIMM 指令
                case (rs_reg)
                    `EXE_BGEZ:  curr_alu_sel = `EXE_RES_JUMP_BRANCH;
                    `EXE_BGEZAL:curr_alu_sel = `EXE_RES_JUMP_BRANCH;
                    `EXE_BLTZ:  curr_alu_sel = `EXE_RES_JUMP_BRANCH;
                    `EXE_BLTZAL:curr_alu_sel = `EXE_RES_JUMP_BRANCH; 

                    default: 
                        curr_alu_sel = 3'b000; // 默认值或未定义指令
                endcase
            end

            // 逻辑指令
            `EXE_ANDI:  curr_alu_sel = `EXE_RES_LOGIC;
            `EXE_ORI:   curr_alu_sel = `EXE_RES_LOGIC;
            `EXE_XORI:  curr_alu_sel = `EXE_RES_LOGIC;
            `EXE_LUI:   curr_alu_sel = `EXE_RES_LOGIC; 

            // 跳转和分支指令
            `EXE_J:     curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_JAL:   curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_JALR:  curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_JR:    curr_alu_sel = `EXE_RES_JUMP_BRANCH; 
            `EXE_BEQ:   curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_BGTZ:  curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_BLEZ:  curr_alu_sel = `EXE_RES_JUMP_BRANCH; 
            `EXE_BNE:   curr_alu_sel = `EXE_RES_JUMP_BRANCH;

            // 负载和存储指令
            `EXE_LB:    curr_alu_sel = `EXE_RES_LOAD_STORE;       
            `EXE_LBU:   curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_LH:    curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_LHU:   curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_LL:    curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_LW:    curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_LWL:   curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_LWR:   curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_SB:    curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_SC:    curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_SH:    curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_SW:    curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_SWL:   curr_alu_sel = `EXE_RES_LOAD_STORE;   
            `EXE_SWR:   curr_alu_sel = `EXE_RES_LOAD_STORE;   

            // 乘法指令
            `EXE_MULT:  curr_alu_sel = `EXE_RES_MUL;
            `EXE_MULTU: curr_alu_sel = `EXE_RES_MUL;
                
            // 系统调用和其他特殊指令
            `EXE_SYSCALL:curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_BREAK: curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_ERET:  curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_SYNC:  curr_alu_sel = `EXE_RES_JUMP_BRANCH;
            `EXE_PREF:  curr_alu_sel = `EXE_RES_JUMP_BRANCH;
                 // 根据需要调整

            default: 
                curr_alu_sel = 3'b000; // 默认值或未定义指令
        endcase
    end

    //extended_imm_sl2 value
    assign extended_imm_sl2 = {extended_imm[29:0],2'b0};

    //equal value
    // always@(*)begin
    //     if(rs_data==rt_data)begin
    //         equal=1'b1;
    //     end else begin equal =1'b0;
    //     end
    // end

    //pc_src
    // assign pc_src = {jump,branch&equal};
    //pc + 4 + extended_imm value
    assign pc_branch = pc_plus_4 + extended_imm_sl2;
    //pc_jump
    assign pc_jump = {instruction[25:0],2'b0};



    // debug usage
    reg [39:0] ascii;

    always @(*)
    begin
        ascii<="N-R";
        case(instr[31:26])
            `NOP:   // R-type
                begin
                    case(instr[5:0])
                        /* logic instraction */
                        `AND: ascii<= "AND";
                        `OR: ascii<= "OR";
                        `XOR: ascii<= "XOR";
                        `NOR: ascii<= "NOR";
                        /* shift instraction */
                        `SLL: ascii<= "SLL";
                        `SRL: ascii<= "SRL";
                        `SRA: ascii<= "SRA";
                        `SLLV: ascii<= "SLLV";
                        `SRLV: ascii<= "SRLV";
                        `SRAV: ascii<= "SRAV";
                        /* move instraction */
                        `MFHI: ascii<= "MFHI";
                        `MTHI: ascii<= "MTHI";
                        `MFLO: ascii<= "MFLO";
                        `MTLO: ascii<= "MTLO";
                        /* arithemtic instraction */
                        `ADD: ascii<= "ADD";
                        `ADDU: ascii<= "ADDU";
                        `SUB: ascii<= "SUB";
                        `SUBU: ascii<= "SUBU";
                        `SLT: ascii<= "SLT";
                        `SLTU: ascii<= "SLTU";

                        `MULT: ascii<= "MULT";
                        `MULTU: ascii<= "MULTU";
                        `DIV: ascii<= "DIV";
                        `DIVU: ascii<= "DIVU";
                        /* jump instraction */
                        `JR: ascii<= "JR";
                        `JALR: ascii<= "JALR";
                        
                        `SYSCALL: ascii<= "SYSC";
                        `BREAK: ascii<= "BRE";
                        default: ascii<="N-R";
                    endcase
                end
            `ANDI: ascii<= "ANDI";
            `XORI: ascii<= "XORI";
            `LUI: ascii<= "LUI";
            `ORI: ascii<= "ORI";

            `ADDI: ascii<= "ADDI";
            `ADDIU: ascii<= "ADDIU";
            `SLTI: ascii<= "SLTI";
            `SLTIU: ascii<= "SLTIU";

            `J: ascii<= "J";
            `JAL: ascii<= "JAL";
            
            `BEQ: ascii<= "BEQ";
            `BGTZ: ascii<= "BGTZ";
            `BLEZ: ascii<= "BLEZ";
            `BNE: ascii<= "BNE";
            
            `LB: ascii<= "LB";
            `LBU: ascii<= "LBU";
            `LH: ascii<= "LH";
            `LHU: ascii<= "LHU";
            `LW: ascii<= "LW";
            `SB: ascii<= "SB";
            `SH: ascii<= "SH";
            `SW: ascii<= "SW";
            6'b000001: begin 
                case (instr[20:16])
                    `BGEZ: ascii<= "BGEZ";
                    `BGEZAL: ascii<= "BGEZAL";
                    `BLTZ: ascii<= "BLTZ";
                    `BLTZAL: ascii<= "BLTZAL";
                    default : ascii<= " ";
                endcase
            end
            6'b010000: begin 
                if(instr==`ERET) begin
                    ascii<="ERET";
                end else begin 
                    case (instr[25:21])
                        5'b00100: ascii<="MTOC0";
                        5'b00000: ascii<="MFC0";
                    endcase
                end
            end
            default: ascii<= "N-R";
       endcase
    if(instr==`ERET)
        ascii<= "ERET";
    if(!instr)
        ascii<= "NOP";
    end
endmodule