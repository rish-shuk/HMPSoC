library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity TopLevel is
	generic (
		ports : positive := 5
	);
	port (
		CLOCK_50      : in    std_logic;
		CLOCK2_50     : in    std_logic;
		CLOCK3_50     : in    std_logic;

--		FPGA_I2C_SCLK : out   std_logic;
--		FPGA_I2C_SDAT : inout std_logic;
--		AUD_ADCDAT    : in    std_logic;
--		AUD_ADCLRCK   : inout std_logic;
--		AUD_BCLK      : inout std_logic;
--		AUD_DACDAT    : out   std_logic;
--		AUD_DACLRCK   : inout std_logic;
--		AUD_XCK       : out   std_logic;

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

--	signal adc_empty : std_logic;
--	signal adc_get   : std_logic;
--	signal adc_data  : std_logic_vector(16 downto 0);
--	signal dac_full  : std_logic;
--	signal dac_put   : std_logic;
--	signal dac_data  : std_logic_vector(16 downto 0);

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
		reset => '0',
		adc_data_ready => open,
		send  => send_port(0),
		recv  => recv_port(0)
	);

	asp_avg : entity work.AspAvg
	port map (
		clock => clock,
		send => send_port(1),
		recv => recv_port(1)
	);
	
	asp_cor : entity work.AspCor
	port map (
		clock => clock,
		send => send_port(2),
		recv => recv_port(2),
		corrVal => open
	);
	
	asp_pd : entity work.PD_ASP
	port map (
		clk => clock,
		send => send_port(4),
		recv => recv_port(4)
	);

--	asp_example : entity work.AspExample
--	port map (
--		clock => clock,
--		key   => KEY,
--		sw    => SW,
--		ledr  => LEDR,
--		hex0  => HEX0,
--		hex1  => HEX1,
--		hex2  => HEX2,
--		hex3  => HEX3,
--		hex4  => HEX4,
--		hex5  => HEX5,
--
--		send  => send_port(3),
--		recv  => recv_port(3)
--	);

end architecture;
