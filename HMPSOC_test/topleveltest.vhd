library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.macros.all;
use work.TdmaMinTypes.all;

entity topleveltest is
    generic (
		ports : positive := 2
	);
end entity;

architecture sim of topleveltest is
    	signal clock   : std_logic := '0';
    	signal reset : std_logic := '0';

    	signal adc_data_ready : std_logic := '0';

   	    signal send_port  : tdma_min_ports(0 to 1);
	    signal recv_port  : tdma_min_ports(0 to 1);


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

    asp_adc : entity work.aspadc port map(
        clock   => clock,
        reset   => reset,

        adc_data_ready => adc_data_ready,

        send => send_port(0),
        recv => recv_port(0)

    );

    asp_avg : entity work.aspAvg port map(
        clock => clock,
        send => send_port(1),
        recv => recv_port(1)
    );


    reset             <= '0' after 15 ns;
    clock             <= not  clock after 5 ns;

end architecture;