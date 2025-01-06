`include "defines.vh"

module alu (
    input wire clk,
    input wire rstn,
    input wire [31:0] a,        // 操作数A
    input wire [31:0] b,        // 操作数B
    input wire [7 :0] alu_op,    // ALU操作码
    input wire [2 :0] alu_sel,   // ALU选择信号

    input wire        hi_read,
    input wire        lo_read,

    input wire        hi_write,
    input wire        lo_write,


    output reg [31:0] result,   // 运算结果
    output reg zero             // 结果是否为零的标志
);

    reg [31:0] hi;
    reg [31:0] lo;
    always @(posedge clk) begin
        case (alu_sel)
            `EXE_RES_LOGIC: begin
                case (alu_op)
                    `EXE_AND_OP: result         = a & b;
                    `EXE_OR_OP: result          = a | b;
                    `EXE_XOR_OP: result         = a ^ b;
                    `EXE_NOR_OP: result         = ~(a | b);
                    `EXE_ANDI_OP: result        = a & { {16{1'b0}}, b[15:0] };
                    `EXE_ORI_OP: result         = a | b; // { {16{1'b0}}, b[15:0] };
                    `EXE_XORI_OP: result        = a ^ { {16{1'b0}}, b[15:0] };
                    `EXE_LUI_OP: result         = {b[15:0], 16'b0};
                    default: result             = 32'b0;
                endcase
            end
            `EXE_RES_SHIFT: begin
                case (alu_op)
                    `EXE_SLL_OP: result         = a << b[4:0];
                    `EXE_SLLV_OP: result        = a << b[4:0];
                    `EXE_SRL_OP: result         = a >> b[4:0];
                    `EXE_SRLV_OP: result        = a >> b[4:0];
                    `EXE_SRA_OP: result         = $signed(a) >>> b[4:0];
                    `EXE_SRAV_OP: result        = $signed(a) >>> b[4:0];
                    default: result             = 32'b0;
                endcase
            end
            `EXE_RES_MOVE: begin
                case (alu_op)
                    `EXE_MFHI_OP: result = hi;
                    `EXE_MTHI_OP: begin
                        hi = a;
                        result = 32'b0;
                        $display("mthi");
                    end
                    `EXE_MFLO_OP: result = lo;
                    `EXE_MTLO_OP: begin
                        lo = a;
                        result = 32'b0;
                        $display("mtlo");

                    end
                    default: result = 32'b0;
                endcase
            end
            `EXE_RES_ARITHMETIC: begin
                case (alu_op)
                    `EXE_ADD_OP: result         = a + b;
                    `EXE_ADDU_OP: result        = a + b;
                    `EXE_SUB_OP: result         = a - b;
                    `EXE_SUBU_OP: result        = a - b;
                    `EXE_ADDI_OP: result        = a + b;
                    `EXE_ADDIU_OP: result       = a + b;
                    `EXE_SLT_OP: result         = $signed(a) < $signed(b)? 32'b1 : 32'b0;
                    `EXE_SLTU_OP: result        = a < b? 32'b1 : 32'b0;
                    `EXE_SLTI_OP: result        = $signed(a) < $signed({ {16{1'b0}}, b[15:0] })? 32'b1 : 32'b0;
                    `EXE_SLTIU_OP: result       = a < b ? 32'b1 : 32'b0;
                    default: result             = 32'b0;
                endcase
            end
            `EXE_RES_MUL: begin
                case (alu_op)
                    `EXE_MULT_OP: begin
                        {hi, lo} = $signed(a) * $signed(b);
                        result = 32'b0;
                    end
                    `EXE_MULTU_OP: begin
                        {hi, lo} = a * b;
                        result = 32'b0;
                    end
                    `EXE_DIV_OP: begin
                        if (b!= 32'b0) begin
                            lo = $signed(a) / $signed(b);
                            hi = $signed(a) % $signed(b);
                        end else begin
                            // 处理除零错误
                            lo = 32'b0;
                            hi = 32'b0;
                        end
                        result = 32'b0;
                    end
                    `EXE_DIVU_OP: begin
                        if (b!= 32'b0) begin
                            lo = a / b;
                            hi = a % b;
                        end else begin
                            // 处理除零错误
                            lo = 32'b0;
                            hi = 32'b0;
                        end
                        result = 32'b0;
                    end
                    default: result = 32'b0;
                endcase
            end
            `EXE_RES_JUMP_BRANCH: begin
                case (alu_op)
                    `EXE_J_OP: result            = { {4{1'b0}}, a[25:0], 2'b0 };
                    `EXE_JAL_OP: result          = { {4{1'b0}}, a[25:0], 2'b0 };
                    `EXE_JALR_OP: result         = b;
                    `EXE_JR_OP: result           = b;
                    `EXE_BEQ_OP: result          = a == b? 32'b1 : 32'b0;
//                    `EXE_BGEZ_OP: result         = $signed(a) >= 32'b0? 32'b1 : 32'b0;
//                    `EXE_BGEZAL_OP: result       = $signed(a) >= 32'b0? 32'b1 : 32'b0;
//                    `EXE_BGTZ_OP: result         = $signed(a) > 32'b0? 32'b1 : 32'b0;
//                    `EXE_BLEZ_OP: result         = $signed(a) <= 32'b0? 32'b1 : 32'b0;
//                    `EXE_BLTZ_OP: result         = $signed(a) < 32'b0? 32'b1 : 32'b0;
//                    `EXE_BLTZAL_OP: result       = $signed(a) < 32'b0? 32'b1 : 32'b0;
                    `EXE_BNE_OP: result          = a!= b? 32'b1 : 32'b0;
                    default: result              = 32'b0;
                endcase
            end
            `EXE_RES_LOAD_STORE: begin
                case (alu_op)
                    `EXE_LB_OP: result           = { {24{1'b0}}, b[7:0] };
                    `EXE_LBU_OP: result          = { {24{1'b0}}, b[7:0] };
                    `EXE_LH_OP: result           = { {16{1'b0}}, b[15:0] };
                    `EXE_LHU_OP: result          = { {16{1'b0}}, b[15:0] };
                    `EXE_LL_OP: result           = b;
                    `EXE_LW_OP: result           = b;
                    `EXE_LWL_OP: result          = b;
                    `EXE_LWR_OP: result          = b;
                    `EXE_PREF_OP: result         = 32'b0;
                    `EXE_SB_OP: result           = 32'b0;
                    `EXE_SC_OP: result           = 32'b0;
                    `EXE_SH_OP: result           = 32'b0;
                    `EXE_SW_OP: result           = 32'b0;
                    `EXE_SWL_OP: result          = 32'b0;
                    `EXE_SWR_OP: result          = 32'b0;
                    `EXE_SYNC_OP: result         = 32'b0;
                    default: result              = 32'b0;
                endcase
            end
            default: result = 32'b0;
        endcase

        zero = (result == 32'b0);
    end


    // always @(posedge clk) begin
    //     if (hi_write) begin
    //         hi <= a;
    //     end else if (lo_write) begin
    //         lo <= a;
    //     end else if (hi_read) begin
    //         result_out <= hi;
    //     end else if (lo_read) begin
    //         result_out <= lo;
    //     end else begin
    //         result_out <= result;
    //     end
    // end
endmodule