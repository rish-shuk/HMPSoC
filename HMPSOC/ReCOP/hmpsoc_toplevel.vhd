library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity hmpsoc_TopLevel is
	generic (
		ports : positive := 6
	);
	port (
		CLOCK_50      : in    std_logic;
		CLOCK2_50     : in    std_logic;
		CLOCK3_50     : in    std_logic;

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

architecture rtl of hmpsoc_TopLevel is

	signal clock : std_logic;

	signal send_port : tdma_min_ports(0 to ports-1);
	signal recv_port : tdma_min_ports(0 to ports-1);

	-- component nios_v1 is
	-- 	port (
	-- 		clk_clk                                  : in  std_logic                     := 'X';             -- clk
	-- 		hex_0_external_connection_export         : out std_logic_vector(6 downto 0);                     -- export
	-- 		hex_1_external_connection_export         : out std_logic_vector(6 downto 0);                     -- export
	-- 		hex_2_external_connection_export         : out std_logic_vector(6 downto 0);                     -- export
	-- 		hex_3_external_connection_export         : out std_logic_vector(6 downto 0);                     -- export
	-- 		hex_4_external_connection_export         : out std_logic_vector(6 downto 0);                     -- export
	-- 		hex_5_external_connection_export         : out std_logic_vector(6 downto 0);                     -- export
	-- 		input_pio_external_connection_export     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
	-- 		pk_detect_external_connection_export     : in  std_logic                     := 'X';             -- export
	-- 		recv_addr_pio_external_connection_export : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
	-- 		recv_data_pio_external_connection_export : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
	-- 		reset_reset_n                            : in  std_logic                     := 'X'              -- reset_n
	-- 	);
	-- end component nios_v1;

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
		send => send_port(3),
		recv => recv_port(3) -- should be 3
	);
	
	-- nios : entity work.nios
--    port map (
--		clk => clock,
--		recv => recv_port(4)
--	);
	
	recop : entity work.recopTopLevel
	port map (
		clk => clock,
		reset => '0',
		SIP => "00000" & KEY(1) & SW, -- switches and buttons input
		DPCR => send_port(5).data, -- config packet
		CONF_ADDR => send_port(5).addr(3 downto 0),
		LED_PARAM => LEDR(4 downto 0), -- output packet param
		LED_ID => LEDR(9 downto 5) -- output packet id
	);

		-- u0 : component nios_v1
		-- port map (
		-- 	clk_clk                                  => clock,                                  --                               clk.clk
		-- 	hex_0_external_connection_export         => HEX0,         --         hex_0_external_connection.export
		-- 	hex_1_external_connection_export         => HEX1,         --         hex_1_external_connection.export
		-- 	hex_2_external_connection_export         => HEX2,         --         hex_2_external_connection.export
		-- 	hex_3_external_connection_export         => HEX3,         --         hex_3_external_connection.export
		-- 	hex_4_external_connection_export         => HEX4,         --         hex_4_external_connection.export
		-- 	hex_5_external_connection_export         => HEX5,         --         hex_5_external_connection.export
		-- 	input_pio_external_connection_export     => pio_input,     --     input_pio_external_connection.export
		-- 	pk_detect_external_connection_export     => pk_detect,     --     pk_detect_external_connection.export
		-- 	recv_addr_pio_external_connection_export => recv_port(4).addr, -- recv_addr_pio_external_connection.export
		-- 	recv_data_pio_external_connection_export => recv_port(4).data, -- recv_data_pio_external_connection.export
		-- 	reset_reset_n                            => '1'                             --                             reset.reset_n
		-- );




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
