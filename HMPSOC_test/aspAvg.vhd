library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity aspAvg is
    port (
        clock : in  std_logic;
        send  : out tdma_min_port;
        recv  : in  tdma_min_port
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
begin
    -- config data to determine window size
    process(clock)


    begin 
        if rising_edge(clock) then
            if recv.data(31 downto 28) = "0010" then
                WINDOWSIZE <= to_integer(unsigned(recv.data(5 downto 0))); -- config packet from recop
            end if;
        end if;
    end process;
    
    -- process for the data
    process(clock)
    variable newData     : std_logic := '0';
    begin
        if rising_edge(clock) then
            send.data <= recv.data; -- passthrough 
            newData := '0';
            if recv.data(31 downto 27) = "10100" then
                data <= recv.data(15 downto 0); -- read new data

                if count = WINDOWSIZE then
                    avg <= resize(sum / to_unsigned(WINDOWSIZE, 32),16); -- calculate average
                    count <= 0; -- reset count
                    sum <= x"00000000"; -- reset sum
                    newData := '1'; -- enable write for autocorrelator
                    send.data <= "101010000000000" & '1' & std_logic_vector(avg);

                else
                    for i in 0 to MAX_DEPTH - 2 loop
                        if i < WINDOWSIZE - 1 then
                            mem(i) <= mem(i+1); -- shift everything down, fill window, remove tail
                        end if;
                    end loop;

                    mem(WINDOWSIZE-1) <= recv.data(15 downto 0); -- update head in window

                    sum <= sum + unsigned(recv.data(15 downto 0)); -- increment sum

                    count <= count + 1; -- increment count
                    -- newData <= '0';
                    
                end if;
            else
                -- data <= x"0000";
            end if;
        end if;
    end process;
    
    -- send.data <= "101010000000000" & newData & std_logic_vector(avg);
    send.addr <= x"02"; -- send to autocorrelator in port 2

end sim;