
module nios (
	clk_clk,
	reset_reset_n,
	hex5_external_connection_export,
	hex4_external_connection_export,
	hex3_external_connection_export,
	hex2_external_connection_export,
	hex1_external_connection_export,
	pio_input_external_connection_export,
	recv_addr_pio_external_connection_export,
	recv_data_pio_external_connection_export,
	pk_input_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[6:0]	hex5_external_connection_export;
	output	[6:0]	hex4_external_connection_export;
	output	[6:0]	hex3_external_connection_export;
	output	[6:0]	hex2_external_connection_export;
	output	[6:0]	hex1_external_connection_export;
	output	[31:0]	pio_input_external_connection_export;
	output	[7:0]	recv_addr_pio_external_connection_export;
	input	[31:0]	recv_data_pio_external_connection_export;
	input		pk_input_external_connection_export;
endmodule
