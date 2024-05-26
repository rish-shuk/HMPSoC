library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;


entity test_adc_tdma is
end entity;

architecture sim of test_adc_tdma is
    	signal clock   : std_logic := '0';
    	signal reset : std_logic := '0';

    	signal adc_data_ready : std_logic := '0';

		signal send_port  : tdma_min_ports(0 to 8);
	   signal recv_port  : tdma_min_ports(0 to 8);

    component aspadc_tdma is
        port (
            	clock               : in std_logic;
            	reset               : in std_logic;

            	adc_data_ready      : out std_logic;

		        send : out tdma_min_port;
		        recv : in tdma_min_port
        );
    end component;
begin
    DUT : aspadc_tdma port map(
        clock   => clock,
        reset   => reset,

        adc_data_ready => adc_data_ready,

        send => send_port(0),
        recv => recv_port(0)

    );
        --recv_port(0).data <= "0001" & "0000" & "0000" & "0000" & "0000" & "0000" & "0000" & "1001" after 20 ns;
        --reset             <= '0' after 15 ns;
        --clock             <= not  clock after 5 ns;
end architecture;




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

begin

	clock <= CLOCK_50;

	adc_dac : entity work.Audio
	generic map (
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
	--port map (
	--	clock => clock,
	--	empty => adc_empty,
	--	get   => adc_get,
	--	data  => adc_data,

	--	send  => send_port(0),
	--	recv  => recv_port(0)
	--);
	
	
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
