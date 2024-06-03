library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity aspAvg is
    port (
        clock : in  std_logic;
        send  : out tdma_min_port;
        recv  : in  tdma_min_port;
		  segOut	: out std_logic_vector(6 downto 0)
    );
end entity;

architecture sim of aspAvg is
    constant MAX_DEPTH : integer := 64;  -- Maximum FIFO size
    signal WINDOWSIZE : integer := 8;  -- window size 
    type memory_type is array (0 to MAX_DEPTH-1) of std_logic_vector(15 downto 0);
    signal mem     : memory_type;
    signal count   : integer range 0 to MAX_DEPTH := 0;
    signal sum     : unsigned(31 downto 0) := x"00000000";  -- Sum for averaging
    signal avg     : unsigned(15 downto 0) := x"0000";
    signal data     : std_logic_vector(15 downto 0);
    signal addr     : std_logic_vector(7 downto 0) := x"02"; -- default send to COR
    signal newData : std_logic := '0';
begin
    -- config data to determine window size
    -- process(clock)
    
    -- process for the data
    process(clock)
    begin
        if rising_edge(clock) then
            send.data <= recv.data; -- passthrough 
            newData <= '0';

            -- check for config packet and update windowsize
            if recv.data(31 downto 27) = "10010" then
                addr <= "0000" & recv.data(22 downto 19);
                -- select windowsize
                case recv.data(4 downto 0) is
                    when "00001" =>
                        WINDOWSIZE <= 4;
                    WHEN "00010" => 
                        WINDOWSIZE <= 8;
                    when "00100" =>
                        WINDOWSIZE <= 16;
                    WHEN "01000" =>
                        WINDOWSIZE <= 32;
                    WHEN "10000" =>
                        WINDOWSIZE <= 64;
                    WHEN OTHERS =>
                end case;
                send.data <= recv.data; -- passthrough

            else
                -- process data from adc
                if recv.data(31 downto 27) = "10101" then
                    data <= recv.data(15 downto 0); -- read new data

                    if count = WINDOWSIZE then
                        avg <= resize(sum / to_unsigned(WINDOWSIZE, 32),16); -- calculate average
                        count <= 0; -- reset count
                        sum <= x"00000000"; -- reset sum
                        newData <= '1'; -- enable write for autocorrelator
                        send.data <= "101100000000000" & '1' & std_logic_vector(avg);
                    else
                        for i in 0 to MAX_DEPTH - 2 loop
                            if i < WINDOWSIZE - 1 then
                                mem(i) <= mem(i+1); -- shift everything down, fill window, remove tail
                            end if;
                        end loop;

                        mem(WINDOWSIZE-1) <= recv.data(15 downto 0); -- update head in window
                        sum <= sum + unsigned(recv.data(15 downto 0)); -- increment sum
                        count <= count + 1; -- increment count
                        
                    end if;
                else
                    -- data <= x"0000";
                end if;
            end if;
        end if;
    end process;
	 
	 with WINDOWSIZE select segOut <=
		"1111001" when 4, --1
		"0100100" when 8, --2
		"0010000" when 16, --3
		"0011001" when 32, --4
		"0010010" when 64, --5
		"1111111" when others;
		
    send.addr <= addr; -- send to autocorrelator in port 2

end sim;