library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity TestAmp is
	port (
		clock : in  std_logic;
		send  : out tdma_min_port;
		recv  : in  tdma_min_port
	);
end entity;

architecture sim of TestAmp is

	signal channel_0 : signed(15 downto 0);
	signal channel_1 : signed(15 downto 0);

begin
	process(clock)
		variable shiftedVal : signed(15 downto 0);
		variable finalVal : signed(15 downto 0);
	begin
		if rising_edge(clock) then
			if recv.data(31 downto 28) = "1000" then
				shiftedVal := (signed(recv.data(15 downto 0)) sll 1);
				if shiftedVal(15 downto 0) >= to_signed(4096, 16) then
					finalVal := "0001000000000000";
				else
					finalVal := signed(shiftedVal(15 downto 0));
				end if;

				if recv.data(16) = '0' then
					channel_0 <= finalVal(15 downto 0);
				else
					--Shift left by 1
					channel_1 <= finalVal(15 downto 0);
				end if;
			end if;
		end if;
	end process;

end architecture;
