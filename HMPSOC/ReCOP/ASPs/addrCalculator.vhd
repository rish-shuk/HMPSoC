library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

library work;
use work.TdmaMinTypes.all;

entity addrCalculator is
	port(
		dpcr_val : in std_logic_vector(31 downto 0);
		add_in_1 : in std_logic_vector(3 downto 0);
		add_out : out std_logic_vector(7 downto 0);
		send : out tdma_min_port
		);
end entity addrCalculator;

architecture adder of addrCalculator is

begin 
	add_out <= x"0" & (add_in_1 - 1);
	send.data <= dpcr_val;
	send.addr <= x"0"&(add_in_1 - 1);
end architecture;

