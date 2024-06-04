vcom -work work hmpsoc_testbench.vwf.vht
vsim -novopt -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.hmpsoc_toplevel_vhd_vec_tst -voptargs="+acc"
add wave /*
run -all
