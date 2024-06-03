
module nios_v1 (
	clk_clk,
	hex_0_external_connection_export,
	hex_1_external_connection_export,
	hex_2_external_connection_export,
	hex_3_external_connection_export,
	hex_4_external_connection_export,
	hex_5_external_connection_export,
	input_pio_external_connection_export,
	pk_detect_external_connection_export,
	recv_addr_pio_external_connection_export,
	recv_data_pio_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[6:0]	hex_0_external_connection_export;
	output	[6:0]	hex_1_external_connection_export;
	output	[6:0]	hex_2_external_connection_export;
	output	[6:0]	hex_3_external_connection_export;
	output	[6:0]	hex_4_external_connection_export;
	output	[6:0]	hex_5_external_connection_export;
	input	[31:0]	input_pio_external_connection_export;
	input		pk_detect_external_connection_export;
	input	[7:0]	recv_addr_pio_external_connection_export;
	input	[31:0]	recv_data_pio_external_connection_export;
	input		reset_reset_n;
endmodule
