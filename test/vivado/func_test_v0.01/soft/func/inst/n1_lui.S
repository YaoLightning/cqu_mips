#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n1_lui_test)
    .set noreorder
    addiu s0, s0 ,1
    addiu s2, zero, 0x0
    lui   t2, 0x1
###test inst
    addiu t1, zero, 0x0
    TEST_LUI(0x0000, 0x0000)
    TEST_LUI(0x0001, 0x0000)
    TEST_LUI(0x0002, 0x0000)
    TEST_LUI(0x0003, 0x0000)
    TEST_LUI(0x0004, 0x0000)
    TEST_LUI(0x0005, 0x0000)
    TEST_LUI(0x0006, 0x0000)
    TEST_LUI(0x0007, 0x0000)
    addiu t1, zero, 0x0
    TEST_LUI(0x1010, 0x1010)
    TEST_LUI(0x1011, 0x1010)
    TEST_LUI(0x1012, 0x1010)
    TEST_LUI(0x1013, 0x1010)
    TEST_LUI(0x1014, 0x1010)
    TEST_LUI(0x1015, 0x1010)
    TEST_LUI(0x1016, 0x1010)
    TEST_LUI(0x1017, 0x1010)
    addiu t1, zero, 0x0
    TEST_LUI(0x2020, 0x2020)
    TEST_LUI(0x2021, 0x2020)
    TEST_LUI(0x2022, 0x2020)
    TEST_LUI(0x2023, 0x2020)
    TEST_LUI(0x2024, 0x2020)
    TEST_LUI(0x2025, 0x2020)
    TEST_LUI(0x2026, 0x2020)
    addiu t1, zero, 0x0
    TEST_LUI(0x3030, 0x3030)
    TEST_LUI(0x3031, 0x3030)
    TEST_LUI(0x3032, 0x3030)
    TEST_LUI(0x3033, 0x3030)
    TEST_LUI(0x3034, 0x3030)
    TEST_LUI(0x3035, 0x3030)
    TEST_LUI(0x3036, 0x3030)
    addiu t1, zero, 0x0
    TEST_LUI(0x4040, 0x4040)
    TEST_LUI(0x4041, 0x4040)
    TEST_LUI(0x4042, 0x4040)
    TEST_LUI(0x4043, 0x4040)
    TEST_LUI(0x4044, 0x4040)
    TEST_LUI(0x4045, 0x4040)
    TEST_LUI(0x4046, 0x4040)
    addiu t1, zero, 0x0
    TEST_LUI(0x5040, 0x5040)
    TEST_LUI(0x5041, 0x5040)
    TEST_LUI(0x5042, 0x5040)
    TEST_LUI(0x5043, 0x5040)
    TEST_LUI(0x5044, 0x5040)
    TEST_LUI(0x5045, 0x5040)
    TEST_LUI(0x5046, 0x5040)
    addiu t1, zero, 0x0
    TEST_LUI(0x6050, 0x6050)
    TEST_LUI(0x6051, 0x6050)
    TEST_LUI(0x6052, 0x6050)
    TEST_LUI(0x6053, 0x6050)
    TEST_LUI(0x6054, 0x6050)
    TEST_LUI(0x6055, 0x6050)
    TEST_LUI(0x6056, 0x6050)
    addiu t1, zero, 0x0
    TEST_LUI(0x8060, 0x8060)
    TEST_LUI(0x8061, 0x8060)
    TEST_LUI(0x8062, 0x8060)
    TEST_LUI(0x8063, 0x8060)
    TEST_LUI(0x8064, 0x8060)
    TEST_LUI(0x8065, 0x8060)
    TEST_LUI(0x8066, 0x8060)
    addiu t1, zero, 0x0
    TEST_LUI(0xa070, 0xa070)
    TEST_LUI(0xa071, 0xa070)
    TEST_LUI(0xa072, 0xa070)
    TEST_LUI(0xa073, 0xa070)
    TEST_LUI(0xa074, 0xa070)
    TEST_LUI(0xa075, 0xa070)
    TEST_LUI(0xa076, 0xa070)
    addiu t1, zero, 0x0
    TEST_LUI(0xc080, 0xc080)
    TEST_LUI(0xc081, 0xc080)
    TEST_LUI(0xc082, 0xc080)
    TEST_LUI(0xc083, 0xc080)
    TEST_LUI(0xc084, 0xc080)
    TEST_LUI(0xc085, 0xc080)
    TEST_LUI(0xc086, 0xc080)
    addiu t1, zero, 0x0
    TEST_LUI(0xe090, 0xe090)
    TEST_LUI(0xe091, 0xe090)
    TEST_LUI(0xe092, 0xe090)
    TEST_LUI(0xe093, 0xe090)
    TEST_LUI(0xe094, 0xe090)
    TEST_LUI(0xe095, 0xe090)
    TEST_LUI(0xe096, 0xe090)
    addiu t1, zero, 0x0
    TEST_LUI(0xf0a0, 0xf0a0)
    TEST_LUI(0xf0a1, 0xf0a0)
    TEST_LUI(0xf0a2, 0xf0a0)
    TEST_LUI(0xf0a3, 0xf0a0)
    TEST_LUI(0xf0a4, 0xf0a0)
    TEST_LUI(0xf0a5, 0xf0a0)
    TEST_LUI(0xf0a6, 0xf0a0)
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
END(n1_lui_test)
