library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity recopTest is
port(
    clk : in std_logic;

    send : out tdma_min_port
);
end entity recopTest;

architecture beh of recopTest is
begin
	send.data <= "10010000000100000000000000001000";-- send config packet
	send.addr <= x"01";
end beh;
