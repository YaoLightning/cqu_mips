`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CQU
// Engineer: Napbad
// 
// Create Date: 12/24/2024 05:00:00 PM
// Design Name: cqu_mips
// Module Name: datapath
// Project Name: cqu_mips
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath(
    input clk, rstn
);

    // implement all used modules here and link them
    // only implement the inter-connection between modules here
    // do not do any sequential logic inside the modules


    wire if_stall;
    wire id_stall;
    wire exe_stall;
    wire mem_stall;
    wire wb_stall;

    assign if_stall  = 0 | id_stall  | exe_stall | mem_stall | wb_stall;
    assign id_stall  = 0 | exe_stall | mem_stall | wb_stall;
    assign exe_stall = 0 | mem_stall | wb_stall;
    assign mem_stall = 0 | wb_stall;

    // signal definition
    wire jump;
    wire branch;

    wire [31:0] regfile_data_rs;
    wire [31:0] regfile_data_rt;
    wire [31:0] regfile_data_write;
    wire reg_write;

    // if -> id signal
    wire [31:0] pc_out_IF_ID;
    wire [31:0] inst_IF_ID;
    wire [31:0] pc_in_if;

    // id singal definition
    wire rs_id;
    wire rt_id;
    wire rd_id;

    wire [31:0] pc_plus_4_id;

    // id -> exe signal
    wire [ 2:0] alu_op_ID_EXE;
    wire [ 3:0] alu_sel_ID_EXE;
    wire        reg_write_ID_EXE;
    wire [ 4:0] reg_dst_ID_EXE;
    wire        mem_read_ID_EXE;
    wire        mem_write_ID_EXE;
    wire [31:0] extended_imm_ID_EXE;
    wire        mem_to_reg_ID_EXE;

    // exe signal definition
    wire [31:0] src1_exe;
    wire [31:0] src2_exe;

    assign src1_exe = regfile_data_rs;
    assign src2_exe = alu_src ? extended_imm_ID_EXE : regfile_data_rt;

    // exe -> mem signal
    wire        reg_write_EXE_MEM;
    wire [31:0] alu_result_EXE_MEM;
    wire [4 :0] write_reg_EXE_MEM;
    wire        mem_to_reg_EXE_MEM;
    wire        mem_read_EXE_MEM;
    wire        mem_write_EXE_MEM;

    // mem signal definition
    wire [31:0] memory_addr_mem;
    wire [31:0] memory_write_data_mem;

    // mem -> wb signal
    wire [4 :0] reg_write_MEM_WB;
    wire        mem_to_reg_MEM_WB;

    // wb signal definition
    wire [31:0] reg_write_data_wb;
    wire [4 :0] reg_write_addr_wb;


    assign regfile_data_write = reg_write_data_wb;
    assign reg_write_addr     = reg_write_addr_wb;

    inst_fetch if_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (if_stall),

        .pc_in           (pc_in_if),
        .pc_out          (pc_out_IF_ID),
        .instruction     (inst_IF_ID)
    );

    inst_decode id_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (id_stall),

        .instruction     (inst_IF_ID),
        .pc              (pc_out_IF_ID),

        .forward_a       (forward_a),
        .forward_b       (forward_b),
        .forward_a_sel   (forward_a_sel),
        .forward_b_sel   (forward_b_sel),

        .rs              (rs_id),
        .rt              (rt_id),
        .rd              (rd_id),
        .imm             (imm),
        .extended_imm    (extended_imm_ID_EXE),
        .opcode          (opcode),
        .funct           (funct),
        .rs_data         (rs_data),
        .rt_data         (rt_data),
        .pc_plus_4       (pc_plus_4_id),

        .alu_src         (alu_src),
        .alu_op          (alu_op_ID_EXE),

        .reg_dst         (reg_dst_ID_EXE),
        .reg_write       (reg_write_ID_EXE),
        .mem_read        (mem_read_ID_EXE),
        .mem_write       (mem_write_ID_EXE),
        .branch          (branch),
        .jump            (jump),
        .mem_to_reg      (mem_to_reg_ID_EXE)
    );

    execute exe_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (exe_stall),

        .src1            (src1_exe),
        .src2            (src2_exe),

        .alu_op          (alu_op_ID_EXE),
        .alu_sel         (alu_sel_ID_EXE),

        .waddr           (reg_dst_ID_EXE),
        .reg_write_in    (reg_write_ID_EXE),
        .mem_read_in     (mem_read_ID_EXE),
        .mem_write_in    (mem_write_ID_EXE),
        .mem_to_reg_in   (mem_to_reg_ID_EXE),

        .alu_result      (alu_result_EXE_MEM),
        
        .write_reg       (write_reg_EXE_MEM),
        .reg_write_out   (reg_write_EXE_MEM),
        .mem_to_reg_out  (mem_to_reg_EXE_MEM),
        .mem_read_out    (mem_read_EXE_MEM),
        .mem_write_out   (mem_write_EXE_MEM)
    );

    memory_access mem_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (mem_stall),

        .alu_result      (alu_result_EXE_MEM),
        .mem_addr        (memory_addr_mem),
        .write_data      (memory_write_data_mem),
        .write_reg_in    (write_reg_EXE_MEM),

        .reg_write_in    (reg_write_EXE_MEM),
        .mem_read_in     (mem_read_EXE_MEM),
        .mem_write_in    (mem_write_EXE_MEM),
        .mem_to_reg_in   (mem_to_reg_EXE_MEM),

        .mem_read_data   (mem_read_data_MEM_WB),
        .reg_write_in    (reg_write_EXE_MEM),
        .write_reg_out   (reg_write_out_EXE_MEM),
        .reg_write_out   (reg_write_MEM_WB),
        .mem_to_reg_out  (mem_to_reg_MEM_WB)
    );

    write_back wb_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (wb_stall),

        .final_result    (final_result_wb),
        .write_reg       (write_reg_EXE_MEM),

        .reg_write_final (reg_write_MEM_WB),
        .mem_to_reg_final(mem_to_reg_MEM_WB),
 
        .reg_write_addr  (reg_write_addr_wb),
        .reg_write_data  (reg_write_data_wb)
    );

    reg_file reg_file_unit(
        .clk            (clk),
        .rstn           (rstn),

        .reg_write      (reg_write),
        .rs             (rs_id), // the read operation can only happend at id stage
        .rt             (rt_id),
        // write will be done at wb stage, cause that the write operation will take
        // one cycle to complete, so it will use the signal from the mem stage rather than wb
        .rd             (reg_write_addr), 
    
        .write_data     (regfile_data_write),
        .rs_data        (regfile_data_rs),
        .rt_data        (regfile_data_rt)
    );



endmodule
