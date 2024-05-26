library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity CorTestTopLevel is
    generic (
        ports : positive := 3
    );
    port (
        clock   : in std_logic;
        reset : std_logic;
        AverageVal  : out std_logic_vector(15 downto 0);
        CorrVal: out std_logic_vector(31 downto 0)
    );
end entity;

architecture sim of CorTestTopLevel is

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
        reset => reset,
        send => send_port(1),
        recv => recv_port(1),
        AverageVal => AverageVal
    );

    CorASP: entity work.AspCor
    port map(
        clock    => clock,
        send     => send_port(2),
        recv     => recv_port(2),
        CorrVal => CorrVal
    );
end architecture;