vcom -work work PC_MEMORY_Waveform.vwf.vht
vsim -novopt -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.PC_MEMORY_testbench_vhd_vec_tst -voptargs="+acc"
add wave /*
run -all
