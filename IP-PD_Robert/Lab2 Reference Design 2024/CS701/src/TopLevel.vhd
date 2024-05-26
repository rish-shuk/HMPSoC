library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity TopLevel is
	generic (
		ports : positive := 4
	);
	port (
		CLOCK_50      : in    std_logic;
		CLOCK2_50     : in    std_logic;
		CLOCK3_50     : in    std_logic;

		FPGA_I2C_SCLK : out   std_logic;
		FPGA_I2C_SDAT : inout std_logic;
		AUD_ADCDAT    : in    std_logic;
		AUD_ADCLRCK   : inout std_logic;
		AUD_BCLK      : inout std_logic;
		AUD_DACDAT    : out   std_logic;
		AUD_DACLRCK   : inout std_logic;
		AUD_XCK       : out   std_logic;

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

	signal adc_empty : std_logic;
	signal adc_get   : std_logic;
	signal adc_data  : std_logic_vector(16 downto 0);
	signal dac_full  : std_logic;
	signal dac_put   : std_logic;
	signal dac_data  : std_logic_vector(16 downto 0);

	signal send_port : tdma_min_ports(0 to ports-1);
	signal recv_port : tdma_min_ports(0 to ports-1);
	
	component Nios_System is
		port (
			clk_clk                               : in  std_logic                     := 'X';             -- clk
			led_pio_external_connection_export    : out std_logic_vector(9 downto 0);                     -- export
			reset_reset_n                         : in  std_logic                     := 'X';             -- reset_n
			sw_pio_external_connection_export     : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- export
			btn_pio_external_connection_export    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- export
			recev_addr_external_connection_export : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			recev_data_external_connection_export : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			send_addr_external_connection_export  : out std_logic_vector(7 downto 0);                     -- export
			send_data_external_connection_export  : out std_logic_vector(31 downto 0)                     -- export
		);
	end component Nios_System;
begin
	clock <= CLOCK_50;

	adc_dac : entity work.Audio
	generic map (
		-- set to true to use line in jack false to use test hex file
		enable_adc => false
	)
	port map (
		ref_clock     => CLOCK3_50,
		fpga_i2c_sclk => FPGA_I2C_SCLK,
		fpga_i2c_sdat => FPGA_I2C_SDAT,
		aud_adcdat    => AUD_ADCDAT,
		aud_adclrck   => AUD_ADCLRCK,
		aud_bclk      => AUD_BCLK,
		aud_dacdat    => AUD_DACDAT,
		aud_daclrck   => AUD_DACLRCK,
		aud_xck       => AUD_XCK,

		clock         => clock,
		adc_empty     => adc_empty,
		adc_get       => adc_get,
		adc_data      => adc_data,
		dac_full      => dac_full,
		dac_put       => dac_put,
		dac_data      => dac_data
	);

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
		empty => adc_empty,
		get   => adc_get,
		data  => adc_data,

		send  => send_port(0),
		recv  => recv_port(0)
	);

	asp_dac : entity work.AspDac
	port map (
		clock => clock,
		full  => dac_full,
		put   => dac_put,
		data  => dac_data,

		send  => send_port(1),
		recv  => recv_port(1)
	);

	-- ModelSim pin mappins
	asp_example : entity work.AspExample
	port map (
		clock => clock,
		key   => KEY,
		sw    => SW,
		ledr  => LEDR,
		hex0  => HEX0,
		hex1  => HEX1,
		hex2  => HEX2,
		hex3  => HEX3,
		hex4  => HEX4,
		hex5  => HEX5,

		send  => send_port(2),
		recv  => recv_port(2)
	);

	asp_custom : entity work.AspCustom
	port map (
		clock => clock,
		send  => send_port(3),
		recv  => recv_port(3)
	);
	
	-- FPGA NIOS Pin Mappings (NIOS uses port 2)
	-- nios_cpu : component Nios_System
	-- port map (
	-- 	clk_clk                               => clock,                               --                            clk.clk
	-- 	led_pio_external_connection_export    => LEDR,    --    led_pio_external_connection.export
	-- 	reset_reset_n                         => KEY(0),                         --                          reset.reset_n
	-- 	sw_pio_external_connection_export     => SW,     --     sw_pio_external_connection.export
	-- 	btn_pio_external_connection_export    => KEY(3 downto 1),    --    btn_pio_external_connection.export
	-- 	recev_addr_external_connection_export => recv_port(2).addr, -- recev_addr_external_connection.export
	-- 	recev_data_external_connection_export => recv_port(2).data, -- recev_data_external_connection.export
	-- 	send_addr_external_connection_export  => send_port(2).addr,  --  send_addr_external_connection.export
	-- 	send_data_external_connection_export  => send_port(2).data   --  send_data_external_connection.export
	-- );

end architecture;
