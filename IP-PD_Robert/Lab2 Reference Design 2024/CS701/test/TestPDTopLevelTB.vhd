library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity TestPDTopLevelTB is
end entity;

architecture TestBench of TestPDTopLevelTB is

    signal clk   : std_logic;
    signal send_config : std_logic;
    signal enable : std_logic;
    signal CorVal  : std_logic_vector(29 downto 0);
    signal correlation_count : std_logic_vector(20 downto 0);
    signal current_correlation_out : std_logic_vector(29 downto 0);
    signal last_correlation_out :  std_logic_vector(29 downto 0);

begin

    uut : entity work.TestPDTopLevel
        GENERIC MAP(
            ports => 3
        )
        port map(
            clk => clk,
            send_config => send_config,
            enable => enable,
            correlation_count => correlation_count,
            current_correlation_out => current_correlation_out,
            last_correlation_out => last_correlation_out
        );

    clock_process : process
    begin
        while True loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process clock_process;

    config_proccess : process
    begin
        -- SEND DISABLE CONF AT 100ns, TEHN SEND ENABLE CONF AT 200ns
        send_config <= '0', '1' after 30 ns, '0' after 50 ns, '1' after 90 ns, '0' after 110 ns;
        enable <= '1', '0' after 30 ns, '1' after 90 ns;
        wait; 
    end process config_proccess;

END ARCHITECTURE;