library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity CorTestTopLevelTestBench is
end entity;

architecture TestBench of CorTestTopLevelTestBench is

    signal clock : std_logic;
    signal reset : std_logic := '1';
    signal AverageVal : std_logic_vector(15 downto 0);
    signal CorrVal : std_logic_vector(31 downto 0);

begin

    uut : entity work.CorTestTopLevel
        GENERIC MAP(
            ports => 3
        )
        port map(
            clock => clock,
            reset => reset,
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
        reset <= '0' after 20 ns;
        wait; 
    end process stimulus_proc;

END ARCHITECTURE;