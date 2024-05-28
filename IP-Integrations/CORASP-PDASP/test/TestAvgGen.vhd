library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity TestAvgGen is
    port (
        clock : in  std_logic;
        state : in std_logic_vector(3 downto 0);
        send  : out tdma_min_port;
        recv  : in  tdma_min_port;
        AverageVal : out std_logic_vector(15 downto 0)
    );
end entity;

architecture rtl of TestAvgGen is
begin
    send.addr <= x"01";
    process(clock)
    variable counter : unsigned(15 downto 0) := (others => '0');
    --variable addr_v : std_logic_vector(7 downto 0) := (others => '0');
    variable data_v : std_logic_vector(31 downto 0) := (others => '0');
    variable counter_direction : std_logic := '0';
    begin
        if rising_edge(clock) then
            case (state) is
                -- SEND COUNT VALUES
                when x"0" =>
                    --addr_v := x"01";
                    if ((counter /= 1) and counter_direction = '1') then
                        counter := counter - 1;
                    else
                        counter_direction := '0';
                        counter := counter + 1;
                        if (counter = 6) then
                            counter_direction := '1';
                        end if;
                    end if;
                    --counter := std_logic_vector(signed(counter) + 1);
                    --data_v := x"8000" & counter;
                    --AverageVal <= counter;

                    data_v := x"8000" & std_logic_vector(counter);
                    AverageVal <= std_logic_vector(counter);
                
                -- SEND COR-ASP CONFIGURATION
                when x"1" =>
                    --addr_v := x"01";
                    -- 31 DOWNTO 28 IS CONF PACKET ID
                    -- 23 DOWNTO 20 IS NEXT
                    -- 7 IS ENABLE
                    -- 6 DOWNTO 0 IS WINDOW SIZE
                    data_v := x"B0200084";

                -- DO NOTHING
                when others =>
            end case;
            --send.addr <= addr_v;
            send.data <= data_v;
        end if;
    end process;


end architecture;