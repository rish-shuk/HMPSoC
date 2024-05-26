library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.macros.all;
use work.TdmaMinTypes.all;

entity test_adc_tdma is
    generic (
		ports : positive := 3
	);
end entity;

architecture sim of test_adc_tdma is
    	signal clock   : std_logic := '0';
    	signal reset : std_logic := '0';

    	signal adc_data_ready : std_logic := '0';

   	    signal send_port  : tdma_min_ports(0 to 2);
	    signal recv_port  : tdma_min_ports(0 to 2);


    component aspadc is
        port (
            	clock               : in std_logic;
            	reset               : in std_logic;

            	adc_data_ready      : out std_logic;

		        send : out tdma_min_port;
		        recv : in tdma_min_port
        );
    end component;

    component aspavg is
        port (
            clock   : in std_logic;
            send : out tdma_min_port;
            recv : in tdma_min_port
        );
    end component;

begin

    tdma_min : entity work.TdmaMin
	generic map (
		ports => ports
	)
	port map (
		clock => clock,
		sends => send_port,
		recvs => recv_port
	);

    asp_adc : aspadc port map(
        clock   => clock,
        reset   => reset,

        adc_data_ready => adc_data_ready,

        send => send_port(0),
        recv => recv_port(0)

    );

    asp_avg : aspAvg port map(
        clock => clock,
        send => send_port(1),
        recv => recv_port(1)
    );

        recv_port(0).addr <= x"00";
        recv_port(0).data <= "0001" & "0000" & "0001" & "0000" & "0000" & "0000" & "0000" & "1001" for 20 ns; -- config packet
        reset             <= '0' after 15 ns;
        clock             <= not  clock after 5 ns;
end architecture;