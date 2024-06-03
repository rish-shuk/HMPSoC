library IEEE;
use IEEE.std_logic_1164.all;

entity mux2to1 is
	port(
		mux_select : in std_logic;
		mux_in_0 : in std_logic_vector(15 downto 0);
		mux_in_1 : in std_logic_vector(15 downto 0);
		mux_out : out std_logic_vector(15 downto 0)
		);
end entity mux2to1;

architecture mux of mux2to1 is

begin 
	with mux_select select mux_out<=
		mux_in_0 when '0',
		mux_in_1 when '1';
		
end architecture;

