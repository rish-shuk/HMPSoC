
module Nios_System (
	btn_pio_external_connection_export,
	clk_clk,
	led_pio_external_connection_export,
	recev_addr_external_connection_export,
	recev_data_external_connection_export,
	reset_reset_n,
	send_addr_external_connection_export,
	send_data_external_connection_export,
	sw_pio_external_connection_export);	

	input	[2:0]	btn_pio_external_connection_export;
	input		clk_clk;
	output	[9:0]	led_pio_external_connection_export;
	input	[7:0]	recev_addr_external_connection_export;
	input	[31:0]	recev_data_external_connection_export;
	input		reset_reset_n;
	output	[7:0]	send_addr_external_connection_export;
	output	[31:0]	send_data_external_connection_export;
	input	[9:0]	sw_pio_external_connection_export;
endmodule
