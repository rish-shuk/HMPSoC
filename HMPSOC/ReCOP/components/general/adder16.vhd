library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity adder16 is
	port(
		add_in_1 : in std_logic_vector(15 downto 0);
		add_out : out std_logic_vector(15 downto 0)
		);
end entity adder16;

architecture adder of adder16 is

begin 
	add_out <= add_in_1 + 1;
end architecture;

