library IEEE;
use IEEE.std_logic_1164.all;

entity OP2MUX is
	port(
		OP2MUX_select : in std_logic_vector(2 downto 0);
		RX : in std_logic_vector(15 downto 0);
		RZ : in std_logic_vector(15 downto 0);
		Func : in std_logic_vector(15 downto 0);
		OP2MUX_out : out std_logic_vector(15 downto 0)
		);
end entity OP2MUX;

architecture mux of OP2MUX is

begin 
	with OP2MUX_select select OP2MUX_out<=
		x"0000" when "000",
		RX when "001",
		RZ when "010",
		Func when "011",
		x"0000" when others;
end architecture;

