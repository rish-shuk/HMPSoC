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
    signal WINDOWSIZE : integer := 32;  -- window size 
    type memory_type is array (0 to MAX_DEPTH-1) of std_logic_vector(15 downto 0);
    signal mem     : memory_type;
    signal count   : integer range 0 to MAX_DEPTH := 0;
    signal sum     : signed(31 downto 0) := (others => '0');  -- Sum for averaging
    signal avg     : signed(15 downto 0);
    signal canSend     : std_logic := '0';
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
    begin
        if rising_edge(clock) then
            if recv.data(31 downto 28) = "1000" and recv.data(16) = '0' then
                data <= recv.data(15 downto 0);
                for i in 0 to MAX_DEPTH - 2 loop
                    if i < WINDOWSIZE - 1 then
                        mem(i) <= mem(i+1);
                    end if;
                end loop;
                mem(WINDOWSIZE-1) <= recv.data(15 downto 0);
                count <= count + 1;
                if count = WINDOWSIZE - 1 then
                    for i in 0 to MAX_DEPTH - 1 loop
                        if i < WINDOWSIZE - 1 then
                            sum <= sum + signed(mem(i));
                        end if;
                    end loop;
                    count <= 0;
                    canSend <= '1';
                else 
                    canSend <= '0';
                end if;
            end if;
        end if;
    end process;

    -- Calculate average
    avg <= resize(sum /  to_signed(WINDOWSIZE, 32), 16);
    send.data <= "1000000000000000" & std_logic_vector(avg);
    send.addr <= x"02"; -- send to autocorrelator in port 2

end sim;