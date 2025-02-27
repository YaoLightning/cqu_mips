#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n55_bltz_ds_test)
    .set noreorder
    addiu s0, s0 ,1
    li  s2, 0x00
###test inst
    TEST_BLTZ_DS(lui,   t0,0x800d)
    TEST_BLTZ_DS(addiu, t1, t0, 0x8123)
    TEST_BLTZ_DS(sw,    t1, -0x7120(t0))
    TEST_BLTZ_DS(lw,    t2, -0x7120(t0))
    TEST_BLTZ_DS(addu,  t3, t1, t2)
    TEST_BLTZ_DS(or,    t4, s1, s2)
    TEST_BLTZ_DS(slt,   t5, s2, s3)
    TEST_BLTZ_DS(slti,  t6, s2, 0x8011)
    TEST_BLTZ_DS(sltiu, t7, s2, 0x8011)
    TEST_BLTZ_DS(sltu,  t8, s2, s3)
    TEST_BLTZ_DS(sll,   t1, s2, 0x11)
    TEST_BLTZ_DS(add,   t2, t0, s0)
    TEST_BLTZ_DS(addi,  t3, s0, 0x8002)
    TEST_BLTZ_DS(sub,   t4, t0, s0)
    TEST_BLTZ_DS(subu,  t5, t0, s0)
    TEST_BLTZ_DS(and,   t6, t0, s0)
    TEST_BLTZ_DS(andi,  t7, s0, 0x8ff2)
    TEST_BLTZ_DS(nor,   t8, t0, s0)
    TEST_BLTZ_DS(ori,   t1, s0, 0x8ff2)
    TEST_BLTZ_DS(xor,   t2, t0, s0)
    TEST_BLTZ_DS(xori,  t3, s0, 0x8ff2)
    TEST_BLTZ_DS(sllv,  t4, t0, s0)
    TEST_BLTZ_DS(sra,   t5, s0, 0x8)
    TEST_BLTZ_DS(srav,  t6, t0, s0)
    TEST_BLTZ_DS(srl,   t7, s0, 0x8)
    TEST_BLTZ_DS(srlv,  t8, t0, s0)
    lui t0, 0x8000
    li  t1, 0x00008000
    TEST_BLTZ_DS_MD(div    zero, t0, t1)
    TEST_BLTZ_DS_MD(divu   zero, t0, t1)
    TEST_BLTZ_DS_MD(mult   t0, t1)
    TEST_BLTZ_DS_MD(multu  t0, t1)
    TEST_BLTZ_DS(mfhi, t7)
    TEST_BLTZ_DS(mflo, t6)
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
END(n55_bltz_ds_test)
