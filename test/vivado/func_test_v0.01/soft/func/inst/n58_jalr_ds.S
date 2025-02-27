#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n58_jalr_ds_test)
    .set noreorder
    addiu s0, s0 ,1
    li  s2, 0x00
###test inst
    TEST_JALR_DS(lui,   t0,0x800d)
    TEST_JALR_DS(addiu, t1, t0, 0x8123)
    TEST_JALR_DS(sw,    t1, -0x7120(t0))
    TEST_JALR_DS(lw,    t2, -0x7120(t0))
    TEST_JALR_DS(addu,  t3, t1, t2)
    TEST_JALR_DS(or,    t4, s1, s2)
    TEST_JALR_DS(slt,   t5, s2, s3)
    TEST_JALR_DS(slti,  t6, s2, 0x8011)
    TEST_JALR_DS(sltiu, t7, s2, 0x8011)
    TEST_JALR_DS(sltu,  t8, s2, s3)
    TEST_JALR_DS(sll,   t1, s2, 0x11)
    TEST_JALR_DS(add,   t2, t0, s0)
    TEST_JALR_DS(addi,  t3, s0, 0x8002)
    TEST_JALR_DS(sub,   t4, t0, s0)
    TEST_JALR_DS(subu,  t5, t0, s0)
    TEST_JALR_DS(and,   t6, t0, s0)
    TEST_JALR_DS(andi,  t7, s0, 0x8ff2)
    TEST_JALR_DS(nor,   t8, t0, s0)
    TEST_JALR_DS(ori,   t1, s0, 0x8ff2)
    TEST_JALR_DS(xor,   t2, t0, s0)
    TEST_JALR_DS(xori,  t3, s0, 0x8ff2)
    TEST_JALR_DS(sllv,  t4, t0, s0)
    TEST_JALR_DS(sra,   t5, s0, 0x8)
    TEST_JALR_DS(srav,  t6, t0, s0)
    TEST_JALR_DS(srl,   t7, s0, 0x8)
    TEST_JALR_DS(srlv,  t8, t0, s0)
    lui t0, 0x8000
    li  t1, 0x00008000
    TEST_JALR_DS_MD(div    zero, t0, t1)
    TEST_JALR_DS_MD(divu   zero, t0, t1)
    TEST_JALR_DS_MD(mult   t0, t1)
    TEST_JALR_DS_MD(multu  t0, t1)
    TEST_JALR_DS(mfhi, t7)
    TEST_JALR_DS(mflo, t6)
###detect exception
    bne s2, zero, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output (s0<<24)|s3
inst_error:  
    sll t1, s0, 24
    or t0, t1, s3 
    sw t0, 0(s1)
    jr ra
    nop
END(n58_jalr_ds_test)
