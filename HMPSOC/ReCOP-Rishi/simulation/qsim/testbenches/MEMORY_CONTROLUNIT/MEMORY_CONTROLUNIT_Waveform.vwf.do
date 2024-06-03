vcom -work work MEMORY_CONTROLUNIT_Waveform.vwf.vht
vsim -novopt -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.MEMORY_CONTROLUNIT_testbench_vhd_vec_tst -voptargs="+acc"
add wave /*
run -all
