library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.macros.all;
use work.TdmaMinTypes.all;

entity testTopLevel is
end entity;

architecture sim of testTopLevel is
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

    component aspavg_tdma is
        port (
            clock   : in std_logic;
            send : out tdma_min_port;
            recv : in tdma_min_port
        );
    end component;

begin
    aspadc : aspadc_tdma port map(
        clock   => clock,
        reset   => reset,

        adc_data_ready => adc_data_ready,

        send => send_port(0),
        recv => recv_port(0)

    );

    aspavg : aspavg_tdma port map(
        clock => clock,
        send => send_port(1),
        recv => recv_port(1)
    );
    
        recv_port(0).data <= "0001" & "0000" & "0000" & "0000" & "0000" & "0000" & "0000" & "1001" after 20 ns;
        reset             <= '0' after 15 ns;
        clock             <= not clock after 5 ns;
end architecture;