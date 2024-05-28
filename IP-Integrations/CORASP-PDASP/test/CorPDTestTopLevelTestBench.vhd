library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity CorPDTestTopLevelTestBench is
end entity;

architecture TestBench of CorPDTestTopLevelTestBench is

    signal clock : std_logic;
    signal state : std_logic_vector(3 downto 0);
    signal AverageVal : std_logic_vector(15 downto 0);
    signal CorrVal : std_logic_vector(31 downto 0);
    signal correlation_count : std_logic_vector(20 downto 0);
    signal current_correlation_out : std_logic_vector(29 downto 0);
    signal last_correlation_out :  std_logic_vector(29 downto 0);

begin

    uut : entity work.CorPDTestTopLevel
        GENERIC MAP(
            ports => 4
        )
        port map(
            clock => clock,
            state => state,
            AverageVal => AverageVal,
            CorrVal => CorrVal
        );

    -- GENERATE CLOCK
    clock_proc : process
    begin
        while True loop
            clock <= '0';
            wait for 10 ns;
            clock <= '1';
            wait for 10 ns;
        end loop;
    end process clock_proc;

    -- GENERATE SIGNALS
    stimulus_proc : process
    begin
        state <= x"1", x"0" after 90 ns;
        wait; 
    end process stimulus_proc;

END ARCHITECTURE;