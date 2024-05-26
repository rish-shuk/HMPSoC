library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity TestCorGen is
    port (
        clk : in  std_logic;
        send_config : in std_logic;
        enable : in std_logic;
        send  : out tdma_min_port;
        recv  : in  tdma_min_port
    );
end entity;

architecture generateCorrelations of TestCorGen is
    signal sendEmpty: std_logic := '0';
begin
    --Sending to port 2
    send.addr <= x"02";
    process(clk)
    variable data_v: std_logic_vector(31 downto 0) := (OTHERS => '0');
    variable counter : unsigned(29 downto 0) := to_unsigned(0, 30);
    begin
        if rising_edge(clk) then
            if send_config = '1' then
                if enable = '1' then
                    data_v := x"00000000";
                    data_v(31) := '1';
                    data_v(30 downto 27) := "0111";
                    data_v(22 downto 19) := "0001";
                else
                    data_v := x"00000000";
                    data_v(31) := '1';
                    data_v(30 downto 27) := "0111";
                    data_v(22 downto 19) := "0000";
                end if;
            else
                if (sendEmpty = '0') then
                    if (counter > 3 and counter /= 0) then
                        counter := counter - 1;
                    else
                        counter := counter + 1;
                    end if;
                    data_v := "11" & std_logic_vector(counter);
                else
                    data_v := x"80000007";
                end if;
            end if;
            send.data <= data_v;
            sendEmpty <= not sendEmpty;
        end if; 
    end process;
end architecture;