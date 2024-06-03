library IEEE;
use IEEE.std_logic_1164.all;

entity PC is
	port(
		clk : in std_logic;
		reset : in std_logic;
		PCLoad : std_logic;
		programCounterIn : in std_logic_vector(15 downto 0);
		programCounterOut : out std_logic_vector(15 downto 0)
	);
end entity PC;

architecture incrementPC of PC is

begin 
	process(clk, reset)
	begin
		if (reset = '1') then
			ProgramCounterOut <= x"0000";
		elsif rising_edge(clk) then
			if (PCLoad = '1') then
				programCounterOut <= programCounterIn;
			end if;
		end if;
	end process;
end architecture;

