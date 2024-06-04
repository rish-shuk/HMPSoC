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
		  segOut	: out std_logic_vector(6 downto 0);
		  foundConfig : out std_logic := '0'
    );
end entity;

architecture sim of aspAvg is
    

    signal WINDOWSIZE : unsigned(6 downto 0);  -- window size
    signal WINDOWSIZE_int : integer; 
    type memory_type is array (0 to 63) of std_logic_vector(15 downto 0);

    constant MAX_DEPTH : integer := 64;  -- Maximum FIFO size
    signal mem     : memory_type;   -- fifo instance
    signal count   : integer range 0 to 64 := 0; -- index of fifo

    signal sum     : unsigned(31 downto 0) := x"00000000";  -- Sum for averaging

    signal avg     : unsigned(15 downto 0) := x"0000"; -- output average
    signal data     : std_logic_vector(15 downto 0); -- input data
    signal addr     : std_logic_vector(7 downto 0) := x"02"; -- default send to COR
    signal newData : std_logic := '0'; -- flag indicating new data
begin
    -- config data to determine window size
    -- process(clock)
    
    -- process for the data
    -- process for the data
    process(clock)
    variable temp_windowsize : unsigned(6 downto 0);

    begin
        if rising_edge(clock) then
            --foundConfig <= '0';
            send.data <= recv.data; -- passthrough 
            newData <= '0';
            
            -- process adc data
            if recv.data(31 downto 27) = "10101"then
					 --foundConfig <= '1';
                data <= recv.data(15 downto 0); -- read new data

                if count = WINDOWSIZE_int then
			        avg <= resize(sum/windowsize_int,16);
                    count <= 0; -- reset count
                    sum <= x"00000000"; -- reset sum
                    newData <= '1'; -- enable write for autocorrelator
                    send.data <= "101100000000000" & '1' & std_logic_vector(avg);
                else
                    for i in 0 to MAX_DEPTH - 2 loop
                        if i < WINDOWSIZE_int-1 then
                            mem(i) <= mem(i+1); -- shift everything down, fill window, remove tail
                        end if;
                    end loop;

                    mem(WINDOWSIZE_int-1) <= recv.data(15 downto 0); -- update head in window
                    sum <= sum + unsigned(recv.data(15 downto 0)); -- increment sum
                    count <= count + 1; -- increment count
                    
                end if;
            -- check for config packet and update windowsize
            elsif recv.data(31 downto 27) = "10010" then
                foundConfig <= '1';
                addr <= "0000" & recv.data(22 downto 19);
                -- select windowsize
                case recv.data(4 downto 0) is
                    when "00001" =>
                        temp_WINDOWSIZE := "0000010"; -- 4
                        windowsize_int <= 4;
                    WHEN "00010" => 
                        temp_WINDOWSIZE := "0000100"; -- 8
                        windowsize_int <= 8;
                    when "00100" =>
                        temp_WINDOWSIZE := "0001000"; -- 16
                        windowsize_int <= 16;
                    WHEN "01000" =>
                        temp_WINDOWSIZE := "0010000"; -- 32
                        windowsize_int <= 32;
                    WHEN "10000" =>
                        temp_WINDOWSIZE := "0100000"; -- 64
                        windowsize_int <= 64;
                    WHEN OTHERS =>
                end case;
                WINDOWSIZE <= temp_windowsize;
                -- send.data <= recv.data; -- passthrough
            end if;
        end if;
    end process;
    
    send.addr <= addr; -- send to autocorrelator in port 2
	 
	 with WINDOWSIZE_int select segOut <=
		"1111001" when 4, --1
		"0100100" when 8, --2
		"0110000" when 16, --3
		"0011001" when 32, --4
		"0010010" when 64, --5
		"1111111" when others;
		
    send.addr <= addr; -- send to autocorrelator in port 2

end sim;