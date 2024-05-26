library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity TestPDTopLevel is
    generic (
        ports : positive := 3
    );
    port (
        clk   : in std_logic;
        send_config : in std_logic;
        enable : in std_logic;
        correlation_count : out std_logic_vector(20 downto 0);
        current_correlation_out : out std_logic_vector(29 downto 0);
        last_correlation_out : out std_logic_vector(29 downto 0)
    );
end entity;

architecture sim of TestPDTopLevel is

    signal send_port : tdma_min_ports(0 to ports-1);
    signal recv_port : tdma_min_ports(0 to ports-1);

begin

    TDMAMIN: entity work.TdmaMin
        generic map (
            ports => ports
        )
        port map (
            clock => clk,
            sends => send_port,
            recvs => recv_port
        );

    CorGen: entity work.TestCorGen
    port map(
        clk => clk,
        send_config => send_config,
        enable => enable,
        send => send_port(1),   
        recv => recv_port(1)
    );

    PDASP: entity work.PD_ASP
    port map(
        clk    => clk,
        recv     => recv_port(2),
        send     => send_port(2),
        correlation_count => correlation_count, 
        current_correlation_out => current_correlation_out, 
        last_correlation_out => last_correlation_out
    );
end architecture;