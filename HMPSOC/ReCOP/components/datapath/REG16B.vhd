library IEEE;
use IEEE.std_logic_1164.all;

entity REG16B is
	port(
		clk: in std_logic;
		reset: in std_logic;
		load: in std_logic;
		Din: in std_logic_vector(15 downto 0);
		Dout : out std_logic_vector(15 downto 0)
		);
end entity REG16B;

architecture REG of REG16B is

begin
	process(clk, reset) is
	begin
		if (reset = '1') then
			Dout <= x"0000";
		elsif rising_edge(clk) then	
			if (load = '1') then
				Dout <= Din;
			end if;
		end if;
	end process;
	
end architecture;