transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/blk_mem_gen_v8_4_9
vlib riviera/xil_defaultlib

vmap blk_mem_gen_v8_4_9 riviera/blk_mem_gen_v8_4_9
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work blk_mem_gen_v8_4_9  -incr -v2k5 -l blk_mem_gen_v8_4_9 -l xil_defaultlib \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l blk_mem_gen_v8_4_9 -l xil_defaultlib \
"../../../../cqu_mips.gen/sources_1/ip/ram_easy/sim/ram_easy.v" \


vlog -work xil_defaultlib \
"glbl.v"

