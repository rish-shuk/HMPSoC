
module NOC (
	addr_pio_external_connection_in_port,
	addr_pio_external_connection_out_port,
	buttons_pio_external_connection_export,
	clk_clk,
	data_pio_external_connection_in_port,
	data_pio_external_connection_out_port,
	display0_pio_external_connection_export,
	display1_pio_external_connection_export,
	display2_pio_external_connection_export,
	display3_pio_external_connection_export,
	display4_pio_external_connection_export,
	display5_pio_external_connection_export,
	led_pio_external_connection_export,
	reset_reset_n,
	switches_pio_external_connection_export);	

	input	[7:0]	addr_pio_external_connection_in_port;
	output	[7:0]	addr_pio_external_connection_out_port;
	input	[3:0]	buttons_pio_external_connection_export;
	input		clk_clk;
	input	[31:0]	data_pio_external_connection_in_port;
	output	[31:0]	data_pio_external_connection_out_port;
	output	[6:0]	display0_pio_external_connection_export;
	output	[6:0]	display1_pio_external_connection_export;
	output	[6:0]	display2_pio_external_connection_export;
	output	[6:0]	display3_pio_external_connection_export;
	output	[6:0]	display4_pio_external_connection_export;
	output	[6:0]	display5_pio_external_connection_export;
	output	[9:0]	led_pio_external_connection_export;
	input		reset_reset_n;
	input	[9:0]	switches_pio_external_connection_export;
endmodule
