library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
-- use work.macros.all;
use work.TdmaMinTypes.all;

entity NewTestTopLevel is
    generic (
        ports : positive := 3
    );
end entity;

architecture sim of NewTestTopLevel is
        signal clock   : std_logic := '0';
        -- signal reset : std_logic := '0';

        -- signal adc_data_ready : std_logic := '0';

        signal send_port  : tdma_min_ports(0 to 2);
        signal recv_port  : tdma_min_ports(0 to 2);

        signal state : std_logic_vector(3 downto 0);
        signal AverageVal  : std_logic_vector(15 downto 0);
        signal CorrVal: std_logic_vector(31 downto 0);
        signal correlation_count : std_logic_vector(20 downto 0);
        signal current_correlation_out : std_logic_vector(29 downto 0);
        signal last_correlation_out : std_logic_vector(29 downto 0);


    -- component aspadc is
    --     port (
    --             clock               : in std_logic;
    --             reset               : in std_logic;

    --             adc_data_ready      : out std_logic;

    --             send : out tdma_min_port;
    --             recv : in tdma_min_port
    --     );
    -- end component;

    -- component aspavg is
    --     port (
    --         clock   : in std_logic;
    --         send : out tdma_min_port;
    --         recv : in tdma_min_port
    --     );
    -- end component;
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

    CorTEST: entity work.TestAvgGen
    port map(
        clock => clock,
        state => state,
        send => send_port(0),
        recv => recv_port(0),
        AverageVal => AverageVal
    );

    CorASP: entity work.AspCor
    port map(
        clock => clock,
        send => send_port(1),
        recv => recv_port(1),
        CorrVal => CorrVal
    );

    PDASP: entity work.PD_ASP
    port map(
        clk => clock,
        recv => recv_port(2),
        send => send_port(2),
        correlation_count => correlation_count, 
        current_correlation_out => current_correlation_out, 
        last_correlation_out => last_correlation_out
    );

    -- asp_adc : aspadc port map(
    --     clock   => clock,
    --     reset   => reset,

    --     adc_data_ready => adc_data_ready,

    --     send => send_port(0),
    --     recv => recv_port(0)

    -- );

    -- asp_avg : aspAvg port map(
    --     clock => clock,
    --     send => send_port(1),
    --     recv => recv_port(1)
    -- );

        -- recv_port(0).addr <= x"00";
        -- recv_port(0).data <= "0001" & "0000" & "0001" & "0000" & "0000" & "0000" & "0000" & "1001"; -- config packet
        -- reset             <= '0' after 15 ns;
        clock             <= not  clock after 5 ns;
        state             <= x"1", x"0" after 45 ns;
end architecture;