transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+ram_easy  -L xil_defaultlib -L blk_mem_gen_v8_4_9 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ram_easy xil_defaultlib.glbl

do {ram_easy.udo}

run 1000ns

endsim

quit -force
