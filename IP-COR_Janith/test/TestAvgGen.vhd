library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity TestAvgGen is
    port (
        clock : in  std_logic;
        reset : in std_logic;
        send  : out tdma_min_port;
        recv  : in  tdma_min_port;
        AverageVal : out std_logic_vector(15 downto 0)
    );
end entity;

architecture rtl of TestAvgGen is
    signal counter : std_logic_vector(15 downto 0) := (OTHERS => '0');
begin
    send.addr <= x"02";
    process(clock, reset)
    begin
        if reset = '1' then
            -- 31 DOWNTO 28 IS CONF PACKET ID
            -- 23 DOWNTO 20 IS NEXT
            -- 7 IS ENABLE
            -- 6 DOWNTO 0 IS WINDOW SIZE
            send.data <= x"B0000084";
            --send.data <= x"B00000FF";
        else if rising_edge(clock) then
            else
                counter <= std_logic_vector(signed(counter) + 1);
                send.data <= x"8000" & counter;
                AverageVal <= counter;
            end if;
        end if; 
    end process;
end architecture;