library IEEE;
use IEEE.std_logic_1164.all;

entity OP1MUX is
	port(
		OP1MUX_select : in std_logic_vector(2 downto 0);
		RX : in std_logic_vector(15 downto 0);
		RZ : in std_logic_vector(15 downto 0);
		Func : in std_logic_vector(15 downto 0);
		PC : in std_logic_vector(15 downto 0);
		OP1MUX_out : out std_logic_vector(15 downto 0)
		);
end entity OP1MUX;

architecture mux of OP1MUX is

begin 
	with OP1MUX_select select OP1MUX_out<=
		x"0000" when "000",
		RX when "001",
		RZ when "010",
		Func when "011",
		PC when "100",
		x"0000" when others;
end architecture;

