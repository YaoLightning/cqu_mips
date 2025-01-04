//R型28条
`EXE_ADD    :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_ADDU   :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_SUB    :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_SUBU   :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_SLT    :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_SLTU   :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_DIV    :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_DIVU   :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_MULT   :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_MULTU  :current_alu_sel=`EXE_RES_ARITHMETIC;

`EXE_AND 	:current_alu_sel=`EXE_RES_LOGIC;
`EXE_NOR	:current_alu_sel=`EXE_RES_LOGIC;
`EXE_OR 	:current_alu_sel=`EXE_RES_LOGIC;
`EXE_XOR 	:current_alu_sel=`EXE_RES_LOGIC;

`EXE_SLLV	:current_alu_sel=`EXE_RES_SHIFT;
`EXE_SLL	:current_alu_sel=`EXE_RES_SHIFT;
`EXE_SRA 	:current_alu_sel=`EXE_RES_SHIFT;
`EXE_SRAV 	:current_alu_sel=`EXE_RES_SHIFT;
`EXE_SRL 	:current_alu_sel=`EXE_RES_SHIFT;
`EXE_SRLV 	:current_alu_sel=`EXE_RES_SHIFT;

`EXE_JALR   :current_alu_sel=
`EXE_JR     :current_alu_sel=
`EXE_MFHI  	:current_alu_sel=`EXE_RES_MOVE;
`EXE_MTHI  	:current_alu_sel=`EXE_RES_MOVE;
`EXE_MFLO  	:current_alu_sel=`EXE_RES_MOVE;
`EXE_MTLO  	:current_alu_sel=`EXE_RES_MOVE;

`EXE_SYSCALL:current_alu_sel=`EXE_RES_NOP;
`EXE_BREAK  :current_alu_sel=`EXE_RES_NOP;

//其他27条current_alu_sel=
`EXE_ADDI   :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_ADDIU  :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_SLTI   :current_alu_sel=`EXE_RES_ARITHMETIC;
`EXE_SLTIU  :current_alu_sel=`EXE_RES_ARITHMETIC;

`EXE_ANDI	:current_alu_sel=`EXE_RES_LOGIC;
`EXE_LUI	:current_alu_sel=`EXE_RES_LOGIC;
`EXE_ORI	:current_alu_sel=`EXE_RES_LOGIC;
`EXE_XORI	:current_alu_sel=`EXE_RES_LOGIC;

`EXE_BEQ    :current_alu_sel=
`EXE_BNE    :current_alu_sel=
`EXE_BGEZ   :current_alu_sel=
`EXE_BGTZ   :current_alu_sel=
`EXE_BGEZAL :current_alu_sel=
`EXE_BLEZ   :current_alu_sel=
`EXE_BLTZ   :current_alu_sel=
`EXE_BLTZAL :current_alu_sel=
`EXE_J      :current_alu_sel=
`EXE_JAL    :current_alu_sel=

`EXE_LB     :current_alu_sel=`EXE_RES_LOAD_STORE;
`EXE_LBU    :current_alu_sel=`EXE_RES_LOAD_STORE;
`EXE_LH     :current_alu_sel=`EXE_RES_LOAD_STORE;
`EXE_LHU    :current_alu_sel=`EXE_RES_LOAD_STORE;
`EXE_LW     :current_alu_sel=`EXE_RES_LOAD_STORE;
`EXE_SB     :current_alu_sel=`EXE_RES_LOAD_STORE;
`EXE_SH     :current_alu_sel=`EXE_RES_LOAD_STORE;
`EXE_SW     :current_alu_sel=`EXE_RES_LOAD_STORE;

`EXE_ERET   :current_alu_sel=`EXE_RES_NOP;