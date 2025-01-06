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

`include "defines.vh" 

module datapath(
    input clk, rstn,

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
    // input         data_data_ok ,

    // ************************************************************************ //

    output [31:0] pc,
    input  [31:0] instr,

    output        memwrite,
    output [31:0] aluout,
    output [31:0] writedata,
    input  [31:0] readdata,

    // ************************************************************************ //

    output [31:0] debug_wb_pc      ,
    output [3 :0] debug_wb_rf_wen  ,
    output [4 :0] debug_wb_rf_wnum ,
    output [31:0] debug_wb_rf_wdata
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
    wire wb_stall = 0;
    
    wire arith_stall_exe;

    // update stall signals
    assign mem_stall = wb_stall;
    assign exe_stall = mem_stall | wb_stall;
    assign id_stall  = exe_stall | stallD;
    assign if_stall  = id_stall;

    wire if_valid_;
    wire id_valid_;
    wire exe_valid_;
    wire mem_valid_;
    wire wb_valid_;

    // signal definition
    wire jump;
    wire branch;

    wire [31:0] regfile_data_rs;
    wire [31:0] regfile_data_rt;
    wire [31:0] regfile_data_to_write;
    wire [4 :0] reg_write_addr;
    wire        reg_write;

    // if signal definition
    wire [31:0] pc_in_if;

    // if -> id signal
    wire [31:0] pc_out_IF_ID;
    wire [31:0] inst_IF_ID;

    // id singal definition
    wire [4 :0] rs_id;
    wire [4 :0] rt_id;
    wire [4 :0] rd_ID_EXE;
    wire [4:0]  shamt_id;
    wire [31:0] pc_plus_4_id;

    wire [5 :0] opcode;

    wire do_store_rd_id;         
    wire do_store_31_id;         
    wire [31:0] data_to_store_id;
    wire [31:0] addr_to_store_id;
    wire [31:0] jump_pc_id;       
    wire do_jump_id;    

    // id -> exe signal
    wire [ 7:0] alu_op_ID_EXE;
    wire [ 2:0] alu_sel_ID_EXE;
    wire        alu_src_ID_EXE;
    wire        reg_write_ID_EXE;
    wire        reg_dst_ID_EXE;
    wire        mem_read_ID_EXE;
    wire        mem_write_ID_EXE;
    wire [31:0] extended_imm_ID_EXE;
    wire        mem_to_reg_ID_EXE;
    wire [4 :0] write_reg_ID_EXE;
    wire [31:0] pc_out_ID_EXE;

    wire [31:0] inst_ID_EXE;

    wire hi_read_ID_EXE;  
    wire lo_read_ID_EXE;         
    wire hi_write_ID_EXE;        
    wire lo_write_ID_EXE;        


    // exe signal definition
    wire [31:0] src1_exe;
    wire [31:0] src2_exe;

    wire [31:0] rs_exe;
    wire [31:0] rt_exe;


    // exe -> mem signal
    wire        reg_write_EXE_MEM;
    wire [31:0] exe_result_EXE_MEM;
    wire [4 :0] write_reg_EXE_MEM;
    wire        mem_to_reg_EXE_MEM;
    wire        mem_read_EXE_MEM;
    wire        mem_write_EXE_MEM;

    wire [31:0] inst_EXE_MEM;
    wire [31:0] pc_out_EXE_MEM;
    wire [31:0] mem_data_EXE_MEM;

    // mem signal definition
    wire [31:0] memory_addr_mem;
    wire [31:0] memory_write_data_mem;

    // mem -> wb signal
    wire        reg_write_MEM_WB;
    wire [4 :0] write_reg_MEM_WB;
    wire        mem_to_reg_MEM_WB;
    wire [31:0] reg_write_data_MEM_WB;

    wire [31:0] inst_MEM_WB;
    wire [31:0] pc_out_MEM_WB;


    // wb signal definition
    wire [31:0] reg_write_data_wb;
    wire [4 :0] reg_write_addr_wb;

    // TODO: jumpaddress calculation
    assign pc_in_if = !rstn ? 32'b0 : !if_valid_ ? pc_out_IF_ID :
                     do_jump_id ? jump_pc_id : (pc_out_IF_ID + 4);

    assign write_reg_ID_EXE = reg_dst_ID_EXE ? rd_ID_EXE : rt_id;

    assign regfile_data_to_write = reg_write_data_wb;
    assign reg_write_data_wb     = reg_write_data_MEM_WB;
    assign reg_write_addr        = write_reg_MEM_WB;

    assign memory_write_data_mem = exe_result_EXE_MEM;

    assign reg_write          = reg_write_MEM_WB;    


    // ************************************************************************ //


    assign pc = pc_out_IF_ID;
    assign inst_IF_ID = instr;
    assign memwrite = mem_write_EXE_MEM;
    assign aluout = exe_result_EXE_MEM;
    assign writedata = mem_data_EXE_MEM;


    // ************************************************************************ //
    
    
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
    
    assign rs_exe = forwardaE[1] ? 
                      exe_result_EXE_MEM : forwardaE[0] ? 
                      reg_write_data_wb : regfile_data_rs;


    assign rt_exe = forwardbE[1] ? 
                      exe_result_EXE_MEM : forwardbE[0] ? 
                      reg_write_data_wb : regfile_data_rt;

    assign memory_addr_mem = exe_result_EXE_MEM;

    inst_fetch if_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (if_stall),

        .jump            (do_jump_id),

        .pc_in           (pc_in_if),
        .pc_out          (pc_out_IF_ID),

        .if_valid        (if_valid_)
    );

         
    inst_decode id_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (id_stall),

        .if_valid        (if_valid_),

        .instruction     (inst_IF_ID),
        .pc              (pc_out_IF_ID),

        .rs              (rs_id),
        .rt              (rt_id),
        .rd              (rd_ID_EXE),
        .extended_imm    (extended_imm_ID_EXE),
        .opcode          (opcode),
        .funct           (funct),
        .inst_out        (inst_ID_EXE),

        .alu_sel         (alu_sel_ID_EXE),
        .alu_op          (alu_op_ID_EXE),
        .alu_src         (alu_src_ID_EXE),

        .reg_dst         (reg_dst_ID_EXE),
        .reg_write       (reg_write_ID_EXE),
        .mem_read        (mem_read_ID_EXE),
        .mem_to_reg      (mem_to_reg_ID_EXE),
        .mem_write       (mem_write_ID_EXE),
        .pc_out          (pc_out_ID_EXE),

        .rs_data         (regfile_data_rs),
        .rt_data         (regfile_data_rt),
        .jump_pc         (jump_pc_id), 
        .do_jump         (do_jump_id),

        .id_valid        (id_valid_)
    );

    execute exe_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (exe_stall),
        .flush           (flushE),

        .rs_in           (rs_exe),
        .rt_in           (rt_exe),

        .id_valid        (id_valid_),

        .aluop_in        (alu_op_ID_EXE),
        .alusel_in       (alu_sel_ID_EXE),

        .imm_en          (alu_src_ID_EXE),
        .imm_in          (extended_imm_ID_EXE),


        .forwardaE_in    (forwardaE),
        .forwardbE_in    (forwardbE),

        .write_reg_in    (write_reg_ID_EXE),
        .reg_write_in    (reg_write_ID_EXE),
        .mem_read_in     (mem_read_ID_EXE),
        .mem_write_in    (mem_write_ID_EXE),
        .mem_to_reg_in   (mem_to_reg_ID_EXE),

        .hi_read         (hi_read_ID_EXE),
        .lo_read         (lo_read_ID_EXE),

        .hi_write        (hi_write_ID_EXE),
        .lo_write        (lo_write_ID_EXE),

        .alu_result      (exe_result_EXE_MEM),

        .arith_stall     (arith_stall_exe),
        
        .write_reg       (write_reg_EXE_MEM),
        .reg_write_out   (reg_write_EXE_MEM),
        .mem_to_reg_out  (mem_to_reg_EXE_MEM),
        .mem_read_out    (mem_read_EXE_MEM),
        .mem_write_out   (mem_write_EXE_MEM),

        .exe_valid       (exe_valid_),

        .mem_data_out    (mem_data_EXE_MEM),

        .inst_in         (inst_ID_EXE),
        .inst_out        (inst_EXE_MEM),

        .pc_in           (pc_out_ID_EXE),
        .pc_out          (pc_out_EXE_MEM)
    );

    memory_access mem_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (mem_stall),

        .exe_result      (exe_result_EXE_MEM),
        .mem_addr        (memory_addr_mem),

        .mem_read_in     (mem_read_EXE_MEM),
        .mem_write_in    (mem_write_EXE_MEM),
        .mem_read_data_in(readdata),

        .mem_to_reg_in   (mem_to_reg_EXE_MEM),

        .exe_valid       (exe_valid_),
        .mem_valid       (mem_valid_),

        .write_reg_in    (write_reg_EXE_MEM),
        .reg_write_in    (reg_write_EXE_MEM),

        .final_result    (reg_write_data_MEM_WB),

        .write_reg_out   (write_reg_MEM_WB),
        .reg_write_out   (reg_write_MEM_WB),
        .mem_to_reg_out  (mem_to_reg_MEM_WB),

        .inst_in         (inst_EXE_MEM),
        .inst_out        (inst_MEM_WB),

        .pc_in           (pc_out_EXE_MEM),
        .pc_out          (pc_out_MEM_WB)
    );

    write_back wb_stage(
        .clk             (clk),
        .rstn            (rstn),
        .stall           (wb_stall),

        .mem_valid       (mem_valid_),

        .write_addr_in   (write_reg_MEM_WB),
        .write_data_in   (reg_write_data_MEM_WB),
        .reg_write       (reg_write_MEM_WB),

        .inst_in         (inst_MEM_WB),

        .pc_in           (pc_out_EXE_MEM),
        .pc_out          (pc_out_MEM_WB),

        .wb_valid        (wb_valid_),

        .write_addr_out  (reg_write_addr_wb),
        .write_data_out  (reg_write_data_wb)
    );

    reg [31:0] debug_wb_pc_reg      ;
    reg [3 :0] debug_wb_rf_wen_reg  ;
    reg [4 :0] debug_wb_rf_wnum_reg ;
    reg [31:0] debug_wb_rf_wdata_reg;

    assign debug_wb_pc       = debug_wb_pc_reg      ;
    assign debug_wb_rf_wen   = debug_wb_rf_wen_reg  ;
    assign debug_wb_rf_wnum  = debug_wb_rf_wnum_reg ;
    assign debug_wb_rf_wdata = debug_wb_rf_wdata_reg;

    always @(posedge clk or negedge rstn) begin
        if (~rstn) begin
            debug_wb_pc_reg       <= 0;
            debug_wb_rf_wen_reg   <= 0;
            debug_wb_rf_wnum_reg  <= 0;
            debug_wb_rf_wdata_reg <= 0;
        end else begin
            debug_wb_pc_reg       <= pc_out_MEM_WB;
            debug_wb_rf_wen_reg[0]<= reg_write_MEM_WB;
            debug_wb_rf_wnum_reg  <= write_reg_MEM_WB;
            debug_wb_rf_wdata_reg <= reg_write_data_MEM_WB;
        end
    end 


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
        .stallF(stallF),
        // decode stage
        .rsD(instr[25:21]),
        .rtD(instr[20:16]),
        .branchD(do_jump_id),
        .forwardaD(forwardaD),
        .forwardbD(forwardbD),
        .stallD(stallD),
        // execute stage
        .rsE(inst_ID_EXE[25:21]),
        .rtE(inst_ID_EXE[20:16]),
        .writeregE(write_reg_ID_EXE),
        .regwriteE(reg_write_ID_EXE),
        .memtoregE(mem_to_reg_ID_EXE),
        // mem stage
        .writeregM(write_reg_EXE_MEM),
        .regwriteM(reg_write_EXE_MEM),
        .memtoregM(mem_to_reg_EXE_MEM),
        // write back stage
        .writeregW(reg_write_addr_wb),
        .regwriteW(reg_write_MEM_WB),
        .flushE(flushE),
        .forwardaE(forwardaE),
        .forwardbE(forwardbE)
    );

endmodule
