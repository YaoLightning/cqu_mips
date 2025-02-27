#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n10_sltiu_test)
    .set noreorder
    addiu s0, s0 ,1
    li  s2, 0x0
###test inst
    TEST_SLTIU(0xedd0687b, 0x00003f54, 0x00000000)
    TEST_SLTIU(0x7b0e659c, 0x00005e34, 0x00000000)
    TEST_SLTIU(0x91943cee, 0x0000c600, 0x00000001)
    TEST_SLTIU(0x294713b8, 0x0000b802, 0x00000001)
    TEST_SLTIU(0xa3d95ee0, 0x0000ef7c, 0x00000001)
    TEST_SLTIU(0x69d2bd20, 0x00009188, 0x00000001)
    TEST_SLTIU(0x6f482088, 0x0000c9ce, 0x00000001)
    TEST_SLTIU(0x9dcfc840, 0x00007978, 0x00000000)
    TEST_SLTIU(0x5a77cae0, 0x00003af8, 0x00000000)
    TEST_SLTIU(0x8dbfa5c0, 0x0000d029, 0x00000001)
    TEST_SLTIU(0xb38acbe0, 0x00006530, 0x00000000)
    TEST_SLTIU(0xde6673f0, 0x000041de, 0x00000000)
    TEST_SLTIU(0xa3520110, 0x0000bb9c, 0x00000001)
    TEST_SLTIU(0x39a3ed60, 0x0000b1f0, 0x00000001)
    TEST_SLTIU(0x84385a48, 0x000076f2, 0x00000000)
    TEST_SLTIU(0x67b1b642, 0x00002168, 0x00000000)
    TEST_SLTIU(0x3f1896ae, 0x0000c9ce, 0x00000001)
    TEST_SLTIU(0xc7206c26, 0x00000e88, 0x00000000)
    TEST_SLTIU(0x1d42f6c4, 0x0000bab6, 0x00000001)
    TEST_SLTIU(0x60d2b080, 0x000028c7, 0x00000000)
    TEST_SLTIU(0x0f6672d4, 0x0000ecd4, 0x00000001)
    TEST_SLTIU(0x39924098, 0x0000c018, 0x00000001)
    TEST_SLTIU(0xbafc22ea, 0x0000d300, 0x00000001)
    TEST_SLTIU(0x1f6fd4e4, 0x00002168, 0x00000000)
    TEST_SLTIU(0xff275c54, 0x00007680, 0x00000000)
    TEST_SLTIU(0xbeecd49a, 0x00007c1e, 0x00000000)
    TEST_SLTIU(0x1fdc48da, 0x000082d8, 0x00000001)
    TEST_SLTIU(0xd9bfb444, 0x00004cfa, 0x00000000)
    TEST_SLTIU(0xbfcf86d4, 0x0000f1ac, 0x00000001)
    TEST_SLTIU(0x8a880440, 0x000018ca, 0x00000000)
    TEST_SLTIU(0x517132d0, 0x0000205f, 0x00000000)
    TEST_SLTIU(0x25554980, 0x00008565, 0x00000001)
    TEST_SLTIU(0x5c768b80, 0x00009c24, 0x00000001)
    TEST_SLTIU(0xa5e0ee9c, 0x0000d6c8, 0x00000001)
    TEST_SLTIU(0x99a79a82, 0x00005378, 0x00000000)
    TEST_SLTIU(0xe0f14238, 0x000080b5, 0x00000001)
    TEST_SLTIU(0x48cb8610, 0x000013d8, 0x00000000)
    TEST_SLTIU(0xcaf0c374, 0x00002c75, 0x00000000)
    TEST_SLTIU(0x9b94e694, 0x00009b36, 0x00000001)
    TEST_SLTIU(0xaad1ada4, 0x0000752a, 0x00000000)
    TEST_SLTIU(0xb5abcbf4, 0x00006693, 0x00000000)
    TEST_SLTIU(0xae3df620, 0x0000aa36, 0x00000001)
    TEST_SLTIU(0x76ac762c, 0x0000e100, 0x00000001)
    TEST_SLTIU(0xc2c23308, 0x000036a0, 0x00000000)
    TEST_SLTIU(0x8c04ec50, 0x00007e44, 0x00000000)
    TEST_SLTIU(0x59220200, 0x0000bab0, 0x00000001)
    TEST_SLTIU(0xb954b083, 0x00002760, 0x00000000)
    TEST_SLTIU(0x945ffd60, 0x00006f87, 0x00000000)
    TEST_SLTIU(0x4bb5630c, 0x000019a8, 0x00000000)
    TEST_SLTIU(0x459425f4, 0x0000b028, 0x00000001)
    TEST_SLTIU(0x4a584c00, 0x00000dcc, 0x00000000)
    TEST_SLTIU(0x94b54308, 0x0000ee2a, 0x00000001)
    TEST_SLTIU(0x4687236c, 0x00003fa4, 0x00000000)
    TEST_SLTIU(0x1ee5c220, 0x00001945, 0x00000000)
    TEST_SLTIU(0x4df1c530, 0x00005c00, 0x00000000)
    TEST_SLTIU(0xec982c3e, 0x0000a4a0, 0x00000001)
    TEST_SLTIU(0xa49e3620, 0x0000de96, 0x00000001)
    TEST_SLTIU(0xa8d76ac0, 0x0000c736, 0x00000001)
    TEST_SLTIU(0xa36d33dc, 0x000065dc, 0x00000000)
    TEST_SLTIU(0x9cea8ff4, 0x0000f8d4, 0x00000001)
    TEST_SLTIU(0x22c1d98a, 0x00007210, 0x00000000)
    TEST_SLTIU(0x41b0979c, 0x0000a8d7, 0x00000001)
    TEST_SLTIU(0x9dc93b4f, 0x0000a4a0, 0x00000001)
    TEST_SLTIU(0x78de88d2, 0x00002880, 0x00000000)
    TEST_SLTIU(0x13f6e998, 0x0000008b, 0x00000000)
    TEST_SLTIU(0xb7c07400, 0x00002644, 0x00000000)
    TEST_SLTIU(0x42f188fe, 0x00009314, 0x00000001)
    TEST_SLTIU(0x93ac3400, 0x00005d13, 0x00000000)
    TEST_SLTIU(0x3a970198, 0x0000e401, 0x00000001)
    TEST_SLTIU(0x2a1b0bb4, 0x000098d0, 0x00000001)
    TEST_SLTIU(0xd0b4acf0, 0x0000d491, 0x00000001)
    TEST_SLTIU(0xe0d2b5fa, 0x0000b1b6, 0x00000001)
    TEST_SLTIU(0x533c7880, 0x00008e63, 0x00000001)
    TEST_SLTIU(0x0251adc0, 0x0000d3d8, 0x00000001)
    TEST_SLTIU(0x2d2085dc, 0x00008640, 0x00000001)
    TEST_SLTIU(0x3f6730a0, 0x0000008f, 0x00000000)
    TEST_SLTIU(0x5a887b40, 0x00000000, 0x00000000)
    TEST_SLTIU(0x77f6f704, 0x00000000, 0x00000000)
    TEST_SLTIU(0x17065b00, 0x00000000, 0x00000000)
    TEST_SLTIU(0x40e644f8, 0x00000000, 0x00000000)
    TEST_SLTIU(0x051f0300, 0x00000000, 0x00000000)
    TEST_SLTIU(0x21822ca0, 0x00000000, 0x00000000)
    TEST_SLTIU(0x10be5096, 0x00000000, 0x00000000)
    TEST_SLTIU(0xe044c598, 0x00000000, 0x00000000)
    TEST_SLTIU(0x502f3ef8, 0x00000000, 0x00000000)
    TEST_SLTIU(0xff47ef40, 0x00000000, 0x00000000)
    TEST_SLTIU(0x66ce7cbe, 0x00000000, 0x00000000)
    TEST_SLTIU(0x29372a28, 0x00000000, 0x00000000)
    TEST_SLTIU(0x845ce200, 0x00000000, 0x00000000)
    TEST_SLTIU(0x16321ee0, 0x00000000, 0x00000000)
    TEST_SLTIU(0x456540c0, 0x00000000, 0x00000000)
    TEST_SLTIU(0x9b0705f0, 0x00000000, 0x00000000)
    TEST_SLTIU(0x95e20950, 0x00000000, 0x00000000)
    TEST_SLTIU(0x08312224, 0x00000000, 0x00000000)
    TEST_SLTIU(0x03138460, 0x00000000, 0x00000000)
    TEST_SLTIU(0x3978fdde, 0x00000000, 0x00000000)
    TEST_SLTIU(0xfad1e400, 0x00000000, 0x00000000)
    TEST_SLTIU(0x514ede20, 0x00000000, 0x00000000)
    TEST_SLTIU(0x8889e66f, 0x00000000, 0x00000000)
    TEST_SLTIU(0x3ac1a4fc, 0x00000000, 0x00000000)
    TEST_SLTIU(0x3ed2ea5f, 0x00000000, 0x00000000)
    TEST_SLTIU(0x80633134, 0x00000000, 0x00000000)
    TEST_SLTIU(0x6ba5c2bb, 0x00000000, 0x00000000)
    TEST_SLTIU(0x6fa0b5c0, 0x00000000, 0x00000000)
    TEST_SLTIU(0xd2aaa7be, 0x00000000, 0x00000000)
    TEST_SLTIU(0xe48a4b08, 0x00000000, 0x00000000)
    TEST_SLTIU(0x6fb22958, 0x00000000, 0x00000000)
    TEST_SLTIU(0x154e6134, 0x00000000, 0x00000000)
    TEST_SLTIU(0x9cf23035, 0x00000000, 0x00000000)
    TEST_SLTIU(0x5fe5308c, 0x00000000, 0x00000000)
    TEST_SLTIU(0xafc0d82c, 0x00000000, 0x00000000)
    TEST_SLTIU(0x2472d528, 0x00000000, 0x00000000)
    TEST_SLTIU(0x28196e0f, 0x00000000, 0x00000000)
    TEST_SLTIU(0x8c5ad5f4, 0x00000000, 0x00000000)
    TEST_SLTIU(0x579eb980, 0x00000000, 0x00000000)
    TEST_SLTIU(0xf5210f00, 0x00000000, 0x00000000)
    TEST_SLTIU(0x93aa7fc5, 0x00000000, 0x00000000)
    TEST_SLTIU(0x1bab4b60, 0x00000000, 0x00000000)
    TEST_SLTIU(0xe5817240, 0x00000000, 0x00000000)
    TEST_SLTIU(0xcc59904c, 0x00000000, 0x00000000)
    TEST_SLTIU(0x398bd619, 0x00000000, 0x00000000)
    TEST_SLTIU(0x67b89b28, 0x00000000, 0x00000000)
    TEST_SLTIU(0xefd80fc4, 0x00000000, 0x00000000)
    TEST_SLTIU(0x55d2d016, 0x00000000, 0x00000000)
    TEST_SLTIU(0x96099350, 0x00000000, 0x00000000)
    TEST_SLTIU(0x719d44a8, 0x00000000, 0x00000000)
    TEST_SLTIU(0x00000000, 0x0000b625, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000d72e, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00005e36, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00009e40, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00006d08, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000c6c4, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00002f0d, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000e460, 0x00000001)
    TEST_SLTIU(0x00000000, 0x000099de, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000a798, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000da38, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000e6b4, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00001bdf, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00003cc8, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000771c, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000e4d6, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00002100, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000d725, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00005d3a, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000cc47, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00003eb8, 0x00000001)
    TEST_SLTIU(0x00000000, 0x000044ec, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000bde0, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000a4b1, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000cbae, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00001c44, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000ae1d, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000f028, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000f520, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000ab2f, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000e612, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00003665, 0x00000001)
    TEST_SLTIU(0x00000000, 0x000018ec, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000c23a, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00002345, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000031d, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000a3d0, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00002c47, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00002d66, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00008ca7, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00005d13, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000b8b8, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000ba66, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00007960, 0x00000001)
    TEST_SLTIU(0x00000000, 0x000012f0, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000859f, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000ed76, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00002594, 0x00000001)
    TEST_SLTIU(0x00000000, 0x000070df, 0x00000001)
    TEST_SLTIU(0x00000000, 0x0000c3b8, 0x00000001)
    TEST_SLTIU(0x00000000, 0x00000000, 0x00000000)
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
END(n10_sltiu_test)
