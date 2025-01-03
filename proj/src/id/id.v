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
//     output  wire [31:0]     pc_plus_4          // The value of the current PC + 4
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
    input   wire rstn,              // rstn signal
    input   wire stall,              // stall signal

    // Inputs from the instruction fetch stage
    input   wire [31:0]     instruction, // Instruction fetched from the instruction fetch stage
    input   wire [31:0]     pc,          // Current program counter value

    // Forwarding signals from other stages (example, may be more complex in reality)
    input   wire [31:0]     forward_a,   // Data forwarded to source register 1
    input   wire [31:0]     forward_b,   // Data forwarded to source register 2
    input   wire            forward_a_sel,      // Selection signal for forwarding data to source register 1
    input   wire            forward_b_sel,      // Selection signal for forwarding data to source register 2

    // Input and output related to the register file
    output  wire [4:0]      rs,           // Source register 1 address
    output  wire [4:0]      rt,           // Source register 2 address
    output  wire [4:0]      rd,           // Destination register address
    output  wire [15:0]     imm,          // Immediate value
    output  wire [5:0]      opcode,       // Opcode of the instruction
    output  wire [5:0]      funct,        // Function field for R-type instructions

    output  wire [2:0]      alu_op,       // ALU operation result
    output  wire [2:0]      alu_sel,      // ALU operation result

    // instruction outputs
    output  wire [31:0]     inst_out,          // The instruction output

    // Control signal outputs
    output  wire            alu_src,           // ALU source selection signal, 1 means use immediate value, 0 means use register
    output  wire            reg_dst,           // Register destination selection signal, 1 means write to rd, 0 means write to rt
    output  wire            reg_write,         // Register write enable signal
    output  wire            mem_read,          // Memory read enable signal
    output  wire            mem_write,         // Memory write enable signal
    output  wire            mem_to_reg,        // Memory to register selection signal, 1 means write memory data to register
    output  wire            branch,            // Branch signal, 1 means a branch operation is needed
    output  wire            jump,              // Jump signal, 1 means a jump operation is needed
    output  wire [31:0]     extended_imm,      // Extended immediate value
    output  wire [31:0]     pc_plus_4          // The value of the current PC + 4
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

    assign alu_op = curr_alu_inst[7:5];
    assign alu_sel = curr_alu_inst[2:0];

    // ALU source and register destination selection
    assign alu_src = (opcode_reg == `EXE_ANDI)  |
                     (opcode_reg == `EXE_ORI)   |
                     (opcode_reg == `EXE_XORI)  |
                     (opcode_reg == `EXE_LUI)   |
                     (opcode_reg == `EXE_SLTI)  |
                     (opcode_reg == `EXE_SLTIU) |
                     (opcode_reg == `EXE_ADDI)  |
                     (opcode_reg == `EXE_ADDIU);
    assign reg_dst = (opcode_reg == `EXE_SPECIAL_INST) &&
                     (funct_reg!= `EXE_JR) &&
                     (funct_reg!= `EXE_JALR);

    // Register write, memory read/write, and other control signals
    assign reg_write = (opcode_reg!= `EXE_J)     &&
                     (opcode_reg!= `EXE_JAL)     &&
                     (opcode_reg!= `EXE_BEQ)     &&
                     (opcode_reg!= `EXE_BNE)     &&
                     (opcode_reg!= `EXE_BGTZ)    &&
                     (opcode_reg!= `EXE_BLEZ)    &&
                     (opcode_reg!= `EXE_BLTZ)    &&
                     (opcode_reg!= `EXE_BGEZ)    &&
                     (opcode_reg!= `EXE_SYSCALL) &&
                     (opcode_reg!= `EXE_BREAK);
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
    assign jump = (opcode_reg == `EXE_J)        ||
                     (opcode_reg == `EXE_JAL)   ||
                     (opcode_reg == `EXE_JALR);
    assign branch = (opcode_reg == `EXE_BEQ)    ||
                     (opcode_reg == `EXE_BNE)   ||
                     (opcode_reg == `EXE_BGTZ)  ||
                     (opcode_reg == `EXE_BLEZ)  ||
                     (opcode_reg == `EXE_BLTZ)  ||
                     (opcode_reg == `EXE_BGEZ);

    // Extended immediate value
    assign extended_imm = {{16{imm_reg[15]}}, imm_reg};

    // PC + 4 value
    assign pc_plus_4 = pc + 4;

    // Assign internal registers to output wires
    assign rs = rs_reg;
    assign rt = rt_reg;
    assign rd = rd_reg;
    assign imm = imm_reg;
    assign opcode = opcode_reg;
    assign funct = funct_reg;

    assign inst_out = instruction_reg;

endmodule