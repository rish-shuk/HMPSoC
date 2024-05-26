library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.TdmaMinTypes.all;


-- Adresses
-- DP_ASP = 4
-- NIOS = 5
-- CORRELATION ASP = 6

--PACKETS
-- SEND TO NIOS - DEST = 3
-- 01111 DEST(26 downto 23) 22 21 20 19 18 17 16 15 Data(14 downto 0)

entity PD_ASP2 is
    port(
        clk : in std_logic;


        recv : in tdma_min_port;  
        send : out tdma_min_port;

        correlation_count : out std_logic_vector(20 downto 0);

        current_correlation_out : out std_logic_vector(29 downto 0);
        last_correlation_out : out std_logic_vector(29 downto 0)
    );
end PD_ASP2;

architecture find_peak of PD_ASP2 is
    type state_type is (IDLE, PEAK_OR_TROUGH, POSITIVE_SLOPE, NEGATIVE_SLOPE);

    signal current_state : state_type := IDLE;
    signal counter : unsigned(20 downto 0) := x"00000"&'0';
    signal detect_troughs : std_logic := '0';
    signal system_on :  std_logic := '1';
    
    signal state : std_logic_vector(2 downto 0) := "000";
    signal peak_detected : std_logic := '0';
    signal last_correlation : std_logic_vector(29 downto 0);


begin
    process(clk)
    
    begin
            if rising_edge(clk) then

                -- Change later to use configuation address
                send.addr <= x"05";


                -- Check if we must detect toughs
                if (unsigned(recv.addr) = 4 and recv.data(30 downto 27) = "0111" and recv.data(22 downto 19) = "0000") then
                    detect_troughs <= '0';
                    current_state <= IDLE;
                    last_correlation <= x"0000000"&"00";
                    counter <= x"00000"&'0';
                    system_on <= '0';
                elsif (unsigned(recv.addr) = 4 and recv.data(30 downto 27) = "0111" and recv.data(22 downto 19) = "0001") then
                    system_on <= '1';
                elsif (unsigned(recv.addr) = 4 and recv.data(30 downto 27) = "0111" and recv.data(22 downto 19) = "0010") then
                        detect_troughs <= '1';
                elsif (unsigned(recv.addr) = 4 and recv.data(30 downto 27) = "0111" and recv.data(22 downto 19) = "0011") then
                    detect_troughs <= '0';
                end if;
                
                -- recvdata from coorlaton-ASP is = (1 (31) Valid TDMN bit) (1 (30) corrolation ready flag) (29 (29 downto 0) Coorlation value)
                if unsigned(recv.addr) = 6 and recv.data(30) = '1' and system_on = '1' then
                    if (current_state = POSITIVE_SLOPE) or (current_state = IDLE) then
                        if (recv.data(29 downto 0) < last_correlation) then
                            peak_detected <= '1';
                            current_state <= NEGATIVE_SLOPE;

                            send.data <= "11111"&x"3"&"11"&std_logic_vector(counter);
                            -- Reset the counter to the next peak
                            counter <= (others => '0');
                        else
                            counter <= counter + 1;
                        end if;
                    elsif (current_state = NEGATIVE_SLOPE) then
                        if (recv.data(29 downto 0) > last_correlation) then
                            current_state <= POSITIVE_SLOPE;
                            -- returns correlatio ncount from the last peak
                            if (detect_troughs = '1') then
                                send.data <= "11111"&x"3"&"10"&std_logic_vector(counter);
                            end if;
                            counter <= counter + 1;
                        else
                            counter <= counter + 1;
                        end if;

                    end if;

                    last_correlation <= recv.data(29 downto 0);
                    last_correlation_out <= recv.data(29 downto 0);
                else
                    -- Clear the data sent to nios
                    send.data <= x"80000000";
                end if;

                
            end if;
    end process;

    current_correlation_out <= recv.data(29 downto 0) when unsigned(recv.addr) = 6 and system_on = '1';
    correlation_count <= std_logic_vector(counter);


    state <= "000" when current_state = IDLE else
        "001" when current_state = POSITIVE_SLOPE else
        "010" when current_state = NEGATIVE_SLOPE;
end find_peak;