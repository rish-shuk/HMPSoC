library IEEE;
use IEEE.std_logic_1164.all;

entity IR is
	port(
		clk: in std_logic;
		reset: in std_logic;
		instruction: in std_logic_vector(15 downto 0);
		IRHalfSelect: in std_logic;
		IRLoad : in std_logic;
		-- instruction type signal
		AM : out std_logic_vector(1 downto 0);
		OP : out std_logic_vector(5 downto 0);
		-- Destination registor
		RZ : out std_logic_vector(3 downto 0);
		RX : out std_logic_vector(3 downto 0);
		Func : out std_logic_vector(15 downto 0)
		);
end entity IR;

architecture splitIR of IR is

begin
	process(clk, reset) is
	begin
		if (reset = '1') then
			AM <= (others => '0');
			OP <= (others => '0');
			RZ <= (others => '0');
			RX <= (others => '0');
			Func <= (others => '0');
		elsif rising_edge(clk) then
			if (IRLoad = '1') then
				-- Recieve the upper half
				if (IRHalfSelect = '1') then
					AM <= instruction(15 downto 14);
					OP <= instruction(13 downto 8);
					RZ <= instruction(7 downto 4);
					RX <= instruction(3 downto 0);
				-- Recieve the lower half
				else 
					Func <= instruction(15 downto 0);
				end if;
			end if;
		end if;
	end process;
	

end architecture;