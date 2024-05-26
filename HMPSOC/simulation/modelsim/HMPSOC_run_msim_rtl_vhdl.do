transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/TdmaMin/TdmaMinFifo.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/TdmaMin/TdmaMinTypes.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/TdmaMin/TdmaMinSlots.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/TdmaMin/TdmaMinSwitch.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/TdmaMin/TdmaMinInterface.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/aspAvg.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/aspadc_tdma.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/TdmaMin/TdmaMinStage.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/TdmaMin/TdmaMinFabric.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/TdmaMin/TdmaMin.vhd}
vcom -93 -work work {C:/Users/ianku/OneDrive/Documents/Github/HMPSoC/HMPSOC/toplevel.vhd}

