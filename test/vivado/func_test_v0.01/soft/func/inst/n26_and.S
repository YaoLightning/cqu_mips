#include <asm.h>
#include <regdef.h>
#include <inst_test.h>

LEAF(n26_and_test)
    .set noreorder
    addiu s0, s0 ,1
    li  s2, 0x00
###test inst
    TEST_AND(0x5c95951a, 0xca00c414, 0x48008410)
    TEST_AND(0x9ba8ba70, 0xe99fce38, 0x89888a30)
    TEST_AND(0xd30319e0, 0x0ba4cff6, 0x030009e0)
    TEST_AND(0xce6912e8, 0x6676b20e, 0x46601208)
    TEST_AND(0x1d337960, 0x744dd280, 0x14015000)
    TEST_AND(0x79565822, 0xd58a73c7, 0x51025002)
    TEST_AND(0x5493ce59, 0xa7e95630, 0x04814610)
    TEST_AND(0x4a90f478, 0xdea16664, 0x4a806460)
    TEST_AND(0x912edb93, 0x8f4b9870, 0x810a9810)
    TEST_AND(0x08040b84, 0xfa97e908, 0x08040900)
    TEST_AND(0x187a1708, 0xff84714a, 0x18001108)
    TEST_AND(0xb139ef3d, 0x0008d970, 0x0008c930)
    TEST_AND(0xa57271c0, 0xa2ee9b84, 0xa0621180)
    TEST_AND(0xd62b2c40, 0x126bc8b0, 0x122b0800)
    TEST_AND(0x6a13dd76, 0x7d18d2c0, 0x6810d040)
    TEST_AND(0xc5a43778, 0x7c92bbcf, 0x44803348)
    TEST_AND(0xd2d22752, 0xa85fcf0e, 0x80520702)
    TEST_AND(0xa01004f0, 0x6447566b, 0x20000460)
    TEST_AND(0xef2075c0, 0x494b1e41, 0x49001440)
    TEST_AND(0x7156a5d8, 0x65b55820, 0x61140000)
    TEST_AND(0x31c796ae, 0xb49c4a52, 0x30840202)
    TEST_AND(0x76232809, 0x14caecb0, 0x14022800)
    TEST_AND(0x29c67a68, 0x977de748, 0x01446248)
    TEST_AND(0x391a132c, 0xdb8c8240, 0x19080200)
    TEST_AND(0x626187d0, 0x7dee4ac8, 0x606002c0)
    TEST_AND(0x67041d46, 0x9cc9d008, 0x04001000)
    TEST_AND(0xdc40afb0, 0x46358b58, 0x44008b10)
    TEST_AND(0xa1d7e318, 0x71e91fb8, 0x21c10318)
    TEST_AND(0x58b0656c, 0xd2c99848, 0x50800048)
    TEST_AND(0xd5753bfd, 0x389ded57, 0x10152955)
    TEST_AND(0x8973d568, 0x394adb92, 0x0942d100)
    TEST_AND(0xd22a9760, 0x86cd9020, 0x82089020)
    TEST_AND(0x43259f97, 0x89d36232, 0x01010212)
    TEST_AND(0x9e07993a, 0x4368b090, 0x02009010)
    TEST_AND(0x3f838050, 0x1686ce40, 0x16828040)
    TEST_AND(0xdf67503c, 0x09723ea0, 0x09621020)
    TEST_AND(0x94508308, 0x63b79ec0, 0x00108200)
    TEST_AND(0xb8355a8c, 0x01889dac, 0x0000188c)
    TEST_AND(0x963f8820, 0x7e5ad680, 0x161a8000)
    TEST_AND(0x2abd583c, 0xaaa67038, 0x2aa45038)
    TEST_AND(0x9614d1c0, 0x407fc954, 0x0014c140)
    TEST_AND(0x3a194614, 0xdf54fd98, 0x1a104410)
    TEST_AND(0x664c5f4c, 0x61dcf9b6, 0x604c5904)
    TEST_AND(0x0a6dfca6, 0xb2a543b7, 0x022540a6)
    TEST_AND(0x4c9af998, 0x00000000, 0x00000000)
    TEST_AND(0xa2db1ed8, 0x00000000, 0x00000000)
    TEST_AND(0x3a29d000, 0x00000000, 0x00000000)
    TEST_AND(0x6b63a800, 0x00000000, 0x00000000)
    TEST_AND(0xf6a7d130, 0x00000000, 0x00000000)
    TEST_AND(0x0035cf7f, 0x00000000, 0x00000000)
    TEST_AND(0x01f86960, 0x00000000, 0x00000000)
    TEST_AND(0x02a8c850, 0x00000000, 0x00000000)
    TEST_AND(0xffb00bf0, 0x00000000, 0x00000000)
    TEST_AND(0x36890d6a, 0x00000000, 0x00000000)
    TEST_AND(0x0d1f2cbe, 0x00000000, 0x00000000)
    TEST_AND(0x4e202c78, 0x00000000, 0x00000000)
    TEST_AND(0xefeb522a, 0x00000000, 0x00000000)
    TEST_AND(0x8fde116e, 0x00000000, 0x00000000)
    TEST_AND(0x2eb4f758, 0x00000000, 0x00000000)
    TEST_AND(0xf86bac3e, 0x00000000, 0x00000000)
    TEST_AND(0x13645b9d, 0x00000000, 0x00000000)
    TEST_AND(0x218ae799, 0x00000000, 0x00000000)
    TEST_AND(0xa43e4e94, 0x00000000, 0x00000000)
    TEST_AND(0x18aa1940, 0x00000000, 0x00000000)
    TEST_AND(0xeaa6b3d0, 0x00000000, 0x00000000)
    TEST_AND(0x0859169c, 0x00000000, 0x00000000)
    TEST_AND(0x05b77720, 0x00000000, 0x00000000)
    TEST_AND(0xcfee3094, 0x00000000, 0x00000000)
    TEST_AND(0xb2ee69a4, 0x00000000, 0x00000000)
    TEST_AND(0x9f73ccec, 0x00000000, 0x00000000)
    TEST_AND(0x8709e13e, 0x00000000, 0x00000000)
    TEST_AND(0x00000000, 0x78d0a5d8, 0x00000000)
    TEST_AND(0x00000000, 0xcb841e1e, 0x00000000)
    TEST_AND(0x00000000, 0x5c256710, 0x00000000)
    TEST_AND(0x00000000, 0xdc48ef02, 0x00000000)
    TEST_AND(0x00000000, 0x4c5625d9, 0x00000000)
    TEST_AND(0x00000000, 0x7518257d, 0x00000000)
    TEST_AND(0x00000000, 0x56d751f0, 0x00000000)
    TEST_AND(0x00000000, 0x8e7a79a0, 0x00000000)
    TEST_AND(0x00000000, 0x025e35a8, 0x00000000)
    TEST_AND(0x00000000, 0x30502894, 0x00000000)
    TEST_AND(0x00000000, 0xc083695b, 0x00000000)
    TEST_AND(0x00000000, 0x708d009d, 0x00000000)
    TEST_AND(0x00000000, 0x4b88db76, 0x00000000)
    TEST_AND(0x00000000, 0x05d6fcfc, 0x00000000)
    TEST_AND(0x00000000, 0xb5a4f620, 0x00000000)
    TEST_AND(0x00000000, 0x0ac9d65e, 0x00000000)
    TEST_AND(0x00000000, 0x68f3fd68, 0x00000000)
    TEST_AND(0x00000000, 0x18412472, 0x00000000)
    TEST_AND(0x00000000, 0x128cd0e0, 0x00000000)
    TEST_AND(0x00000000, 0x777b8540, 0x00000000)
    TEST_AND(0x00000000, 0xfafe9838, 0x00000000)
    TEST_AND(0x00000000, 0xe2a4a6e4, 0x00000000)
    TEST_AND(0x00000000, 0x3c8bc134, 0x00000000)
    TEST_AND(0x00000000, 0xdc6f1d78, 0x00000000)
    TEST_AND(0x00000000, 0xb84c0500, 0x00000000)
    TEST_AND(0x00000000, 0x23b45e2c, 0x00000000)
    TEST_AND(0x00000000, 0x14b92b6c, 0x00000000)
    TEST_AND(0x00000000, 0x00000000, 0x00000000)
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
END(n26_and_test)
