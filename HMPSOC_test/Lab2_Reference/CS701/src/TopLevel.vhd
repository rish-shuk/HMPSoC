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

	asp_adc : entity work.aspavg
	port map (
		clock => clock,

		send  => send_port(0),
		recv  => recv_port(0)
	);
	
	



end architecture;
