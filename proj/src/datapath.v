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

    // //inst sram-like 
    // output        inst_req     ,
    // output        inst_wr      ,
    // output [1 :0] inst_size    ,
    // output [31:0] inst_addr    ,
    // input  [31:0] inst_rdata   ,
    // input         inst_addr_ok ,
    // input         inst_data_ok ,
    
    // //data sram-like 
    // output        data_req     ,
    // output        data_wr      ,
    // output [1 :0] data_size    ,
    // output [31:0] data_addr    ,
    // output [31:0] data_wdata   ,
    // input  [31:0] data_rdata   ,
    // input         data_addr_ok ,
    // input         data_data_ok 
);

    // implement all used modules here and link them
    // only implement the inter-connection between modules here
    // do not do any sequential logic inside the modules


    // hazard module signals
    wire forwardaD, forwardbD;
    wire stallD, stallF;
    wire flushE;
    wire [1:0] forwardaE, forwardbE;


    wire if_stall;
    wire id_stall;
    wire exe_stall;
    wire mem_stall;
    wire wb_stall;
    
    wire arith_stall_exe;

    // update stall signals
    // assign mem_stall = wb_stall | !data_data_ok | stallD;
    // assign exe_stall = mem_stall | wb_stall | stallD | arith_stall_exe;
    // assign id_stall = exe_stall | mem_stall | wb_stall | stallD;
    // assign if_stall = id_stall | exe_stall | mem_stall | wb_stall | stallF;


    // signal definition
    wire jump;
    wire branch;

    wire [31:0] regfile_data_rs;
    wire [31:0] regfile_data_rt;
    wire [31:0] regfile_data_to_write;
    wire [4 :0] reg_write_addr;
    wire reg_write;

    // if signal definition
    wire [31:0] pc_in_if;

    // if -> id signal
    wire [31:0] pc_out_IF_ID;
    wire [31:0] inst_IF_ID;

    // id singal definition
    wire [4 :0] rs_id;
    wire [4 :0] rt_id;
    wire [4 :0] rd_ID_EXE;

    wire [31:0] pc_plus_4_id;

    // id -> exe signal
    wire [ 7:0] alu_op_ID_EXE;
    wire [ 2:0] alu_sel_ID_EXE;
    wire        alu_src_ID_EXE;
    wire        reg_write_ID_EXE;
    wire [ 4:0] reg_dst_ID_EXE;
    wire        mem_read_ID_EXE;
    wire        mem_write_ID_EXE;
    wire [31:0] extended_imm_ID_EXE;
    wire        mem_to_reg_ID_EXE;

    wire [31:0] inst_ID_EXE;

    // exe signal definition
    wire [31:0] src1_exe;
    wire [31:0] src2_exe;

    // exe -> mem signal
    wire        reg_write_EXE_MEM;
    wire [31:0] exe_result_EXE_MEM;
    wire [4 :0] write_reg_EXE_MEM;
    wire        mem_to_reg_EXE_MEM;
    wire        mem_read_EXE_MEM;
    wire        mem_write_EXE_MEM;

    wire [31:0] inst_EXE_MEM;

    // mem signal definition
    wire [31:0] memory_addr_mem;
    wire [31:0] memory_write_data_mem;

    // mem -> wb signal
    wire        reg_write_MEM_WB;
    wire [4 :0] write_reg_MEM_WB;
    wire        mem_to_reg_MEM_WB;
    wire [31:0] reg_write_data_MEM_WB;

    wire [31:0] inst_MEM_WB;


    // wb signal definition
    wire [31:0] reg_write_data_wb;
    wire [4 :0] reg_write_addr_wb;

    // TODO: jumpaddress calculation
    assign pc_in_if = pc_out_IF_ID + 4;


    assign regfile_data_to_write = reg_write_data_wb;
    assign reg_write_data_wb     = reg_write_data_MEM_WB;
    assign reg_write_addr        = write_reg_MEM_WB;

    assign memory_write_data_mem = exe_result_EXE_MEM;

    assign reg_write          = reg_write_MEM_WB;    

    // memory relative signals
    // assign inst_req = 1'b1;
    // assign inst_addr     = pc_out_IF_ID;
    // // assign inst_IF_ID    = inst_rdata;
    // assign inst_size = 2'b10;
    // assign inst_wr       = 1'b0;

    // assign data_req = mem_write_EXE_MEM | mem_read_EXE_MEM;
    // assign data_wr = mem_write_EXE_MEM;
    // assign data_size = 2'b10;
    // assign data_addr     = memory_addr_mem;
    // assign data_wdata     = memory_write_data_mem;
    // assign mem_read_data_MEM_WB = data_rdata;
    assign mem_read_data_MEM_WB = 32'b0;
    
    assign src1_exe = forwardaE[0] ? 
                      exe_result_EXE_MEM : forwardaE[1] ? 
                      reg_write_data_wb : regfile_data_rs;
    assign src2_exe = forwardbE[0] ? 
                      exe_result_EXE_MEM : forwardbE[1] ? 
                      reg_write_data_wb : (alu_src_ID_EXE ? 
                      extended_imm_ID_EXE : regfile_data_rt);

    assign memory_addr_mem = exe_result_EXE_MEM;

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

        // .forward_a       (forward_a),
        // .forward_b       (forward_b),
        // .forward_a_sel   (forward_a_sel),
        // .forward_b_sel   (forward_b_sel),

        .rs              (rs_id),
        .rt              (rt_id),
        .rd              (rd_ID_EXE),
        .imm             (imm),
        .extended_imm    (extended_imm_ID_EXE),
        .opcode          (opcode),
        .funct           (funct),

        .alu_sel         (alu_sel_ID_EXE),
        .alu_op          (alu_op_ID_EXE),
        .alu_src         (alu_src_ID_EXE),

        .reg_dst         (reg_dst_ID_EXE),
        .reg_write       (reg_write_ID_EXE),
        .mem_read        (mem_read_ID_EXE),
        .mem_to_reg      (mem_to_reg_ID_EXE),
        .mem_write       (mem_write_ID_EXE),
        .branch          (branch),
        .jump            (jump),
        
        .pc_plus_4       (pc_plus_4_id),

        .inst_out         (inst_ID_EXE)
    );

    execute exe_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (exe_stall),

        .src1_in         (src1_exe),
        .src2_in         (src2_exe),

        .aluop_in        (alu_op_ID_EXE),
        .alusel_in       (alu_sel_ID_EXE),


        // .branch_taken_in (0),
        .waddr_in        (rd_ID_EXE),
        .reg_write_in    (reg_write_ID_EXE),
        .mem_read_in     (mem_read_ID_EXE),
        .mem_write_in    (mem_write_ID_EXE),
        .mem_to_reg_in   (mem_to_reg_ID_EXE),


        .alu_result      (exe_result_EXE_MEM),

        .arith_stall     (arith_stall_exe),
        
        .write_reg       (write_reg_EXE_MEM),
        .reg_write_out   (reg_write_EXE_MEM),
        .mem_to_reg_out  (mem_to_reg_EXE_MEM),
        .mem_read_out    (mem_read_EXE_MEM),
        .mem_write_out   (mem_write_EXE_MEM),

        .inst_in         (inst_ID_EXE),
        .inst_out        (inst_EXE_MEM)
    );

    memory_access mem_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (mem_stall),

        .exe_result      (exe_result_EXE_MEM),
        .mem_addr        (memory_addr_mem),

        .mem_read_in     (mem_read_EXE_MEM),
        .mem_write_in    (mem_write_EXE_MEM),
        .mem_read_data_in(mem_read_data_MEM_WB),

        .mem_to_reg_in   (mem_to_reg_EXE_MEM),


        .write_reg_in    (write_reg_EXE_MEM),
        .reg_write_in    (reg_write_EXE_MEM),

        .final_result    (reg_write_data_MEM_WB),

        .write_reg_out   (write_reg_MEM_WB),
        .reg_write_out   (reg_write_MEM_WB),
        .mem_to_reg_out  (mem_to_reg_MEM_WB),

        .inst_in         (inst_EXE_MEM),
        .inst_out        (inst_MEM_WB)
    );

    write_back wb_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (wb_stall),

        .write_addr_in   (write_reg_MEM_WB),
        .write_data_in   (reg_write_data_MEM_WB),
        .reg_write       (reg_write_MEM_WB),

        .inst_in         (inst_MEM_WB),

        .write_addr_out  (reg_write_addr_wb),
        .write_data_out  (reg_write_data_wb)
    );


    reg_file reg_file_unit(
        .clk            (clk),
        .rstn           (rstn),

        .reg_write      (reg_write_MEM_WB),
        .raddr1         (rs_id), // the read operation can only happend at id stage
        .raddr2         (rt_id),
        // write will be done at wb stage, cause that the write operation will take
        // one cycle to complete, so it will use the signal from the mem stage rather than wb
        .waddr          (reg_write_addr), 
        .wdata          (regfile_data_to_write),
        
        .rdata1         (regfile_data_rs),
        .rdata2         (regfile_data_rt)
    );


    // instantiate hazard module
    hazard hazard_unit(
        // fetch stage
        .stalwlF(stallF),
        // decode stage
        .rsD(rs_id),
        .rtD(rt_id),
        .branchD(branch),
        .forwardaD(forwardaD),
        .forwardbD(forwardbD),
        .stallD(stallD),
        // execute stage
        .rsE(rs_id),
        .rtE(rt_id),
        .writeregE(write_reg_EXE_MEM),
        .regwriteE(reg_write_EXE_MEM),
        .memtoregE(mem_to_reg_EXE_MEM),
        // mem stage
        .writeregM(write_reg_MEM_WB),
        .regwriteM(reg_write_MEM_WB),
        .memtoregM(mem_to_reg_MEM_WB),
        // write back stage
        .writeregW(reg_write_addr_wb),
        .regwriteW(reg_write_MEM_WB),
        .flushE(flushE),
        .forwardaE(forwardaE),
        .forwardbE(forwardbE)
    );

endmodule
