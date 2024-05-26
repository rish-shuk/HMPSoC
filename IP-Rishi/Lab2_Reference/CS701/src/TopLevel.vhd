library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity TopLevel is
	generic (
		ports : positive := 8
	);
	port (
		CLOCK_50      : in    std_logic;

		KEY           : in    std_logic_vector(3 downto 0);
		SW            : in    std_logic_vector(9 downto 0);
		LEDR          : out   std_logic_vector(9 downto 0);
		HEX0          : out   std_logic_vector(6 downto 0);
		HEX1          : out   std_logic_vector(6 downto 0);
		HEX2          : out   std_logic_vector(6 downto 0);
		HEX3          : out   std_logic_vector(6 downto 0);
		HEX4          : out   std_logic_vector(6 downto 0);
		HEX5          : out   std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of TopLevel is

	signal clock : std_logic;

	signal reset		: std_logic;
	signal adc_data_ready 	: std_logic;
	

	signal send_port : tdma_min_ports(0 to ports-1);
	signal recv_port : tdma_min_ports(0 to ports-1);

begin

	clock <= CLOCK_50;


	tdma_min : entity work.TdmaMin
	generic map (
		ports => ports
	)
	port map (
		clock => clock,
		sends => send_port,
		recvs => recv_port
	);

	asp_adc : entity work.AspAdc
	port map (
		clock => clock,
		reset => reset,
		adc_data_ready   => adc_data_ready,

		send  => send_port(0),
		recv  => recv_port(0)
	);

--	asp_example : entity work.NOC
--    port map (
--    addr_pio_external_connection_in_port    => recv_port(2).addr,
--    addr_pio_external_connection_out_port   => send_port(2).addr,
--    buttons_pio_external_connection_export  => KEY,
--    clk_clk                                 => clock,
--    data_pio_external_connection_in_port    => recv_port(2).data,
--    data_pio_external_connection_out_port   => send_port(2).data,
--    display0_pio_external_connection_export => HEX0,
--    display1_pio_external_connection_export => HEX1,
--    display2_pio_external_connection_export => HEX2,
--    display3_pio_external_connection_export => HEX3,
--    display4_pio_external_connection_export => HEX4,
--    display5_pio_external_connection_export => HEX5,
--    led_pio_external_connection_export      => LEDR,
--    reset_reset_n                           => not KEY(0),
--    switches_pio_external_connection_export => SW
--    );


end architecture;
