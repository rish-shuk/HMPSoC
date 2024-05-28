library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity CorPDTestTopLevel is
    generic (
        ports : positive := 4
    );
    port (
        clock   : in std_logic;
        state : in std_logic_vector(3 downto 0);
        AverageVal  : out std_logic_vector(15 downto 0);
        CorrVal: out std_logic_vector(31 downto 0);
        correlation_count : out std_logic_vector(20 downto 0);
        current_correlation_out : out std_logic_vector(29 downto 0);
        last_correlation_out : out std_logic_vector(29 downto 0)
    );
end entity;

architecture sim of CorPDTestTopLevel is

    signal send_port : tdma_min_ports(0 to ports-1);
    signal recv_port : tdma_min_ports(0 to ports-1);

begin

    TDMAMIN: entity work.TdmaMin
        generic map (
            ports => ports
        )
        port map (
            clock => clock,
            sends => send_port,
            recvs => recv_port
        );

    CorTEST: entity work.TestAvgGen
    port map(
        clock => clock,
        state => state,
        send => send_port(1),
        recv => recv_port(1),
        AverageVal => AverageVal
    );

    CorASP: entity work.AspCor
    port map(
        clock => clock,
        send => send_port(2),
        recv => recv_port(2),
        CorrVal => CorrVal
    );

    PDASP: entity work.PD_ASP
    port map(
        clk => clock,
        recv => recv_port(3),
        send => send_port(3),
        correlation_count => correlation_count, 
        current_correlation_out => current_correlation_out, 
        last_correlation_out => last_correlation_out
    );
end architecture;