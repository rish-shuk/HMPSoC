onerror {exit -code 1}
vlib work
vcom -work work TopLevel.vho
vcom -work work testbenches/PC_MEMORY/PC_MEMORY_Waveform.vwf.vht
vsim -novopt -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.hmpsoc_toplevel_vhd_vec_tst
vcd file -direction TopLevel.msim.vcd
vcd add -internal hmpsoc_toplevel_vhd_vec_tst/*
vcd add -internal hmpsoc_toplevel_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

