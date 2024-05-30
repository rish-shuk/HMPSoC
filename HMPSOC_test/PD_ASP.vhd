library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.TdmaMinTypes.all;


-- Adresses
-- RECOP = 6 -- Fortesting, corTestaddr = 1 is sending corrolation and config data
-- NIOS = 5
-- CORRELATION ASP = 1

--PACKETS
-- SEND TO NIOS - DEST = 5
-- 1 0111 Dest (26-23) ISR_FLAG (22) PEAK/TROUGH (21) COrrelation Count (20-0)

-- Configuration packets 
-- 1 0011 Source (26 - 23) Next (22 - 19) Mode (18 - 15) Unused (14 - 0)

entity PD_ASP is
    port(
        clk : in std_logic;
        recv : in tdma_min_port;  
        send : out tdma_min_port;
        correlation_count : out std_logic_vector(20 downto 0);
        current_correlation_out : out std_logic_vector(27 downto 0) := (others => '0');
        last_correlation_out : out std_logic_vector(27 downto 0)
    );
end PD_ASP;

architecture find_peak of PD_ASP is
    type state_type is (IDLE, PEAK_OR_TROUGH, POSITIVE_SLOPE, NEGATIVE_SLOPE);

    signal current_state : state_type := IDLE;
    signal counter : unsigned(20 downto 0) := x"00000"&'0';
    signal detect_troughs : std_logic := '0';
    signal system_on :  std_logic := '1';
    
    signal state : std_logic_vector(2 downto 0) := "000";
    signal peak_detected : std_logic := '0';

    signal wanted_recv_data : std_logic_vector(31 downto 0);


begin
    process(clk)
        variable send_addr_v : std_logic_vector(7 downto 0) := x"04"; -- Modifed by configuration packet
        --Corrolation compare values
        variable last_corr : std_logic_vector(27 downto 0) := (others => '0');
        variable current_corr : std_logic_vector(27 downto 0) := (others => '0');
        -- Load two compare values before making a compatison
        variable load_initials : std_logic:= '0';
        variable both_loaded : std_logic := '0';
    begin
            if rising_edge(clk) then
                peak_detected <= '0';
                
                -- Handle config packets -NOTE: Set config proccesors port
                if recv.data(30 downto 27) = "0100" then
                    send_addr_v := (7 downto 4 => '0') & recv.data(22 downto 19);
                    -- Turn Peak Detector Off
                    if (recv.data(18 downto 15) = "0000") then
                        detect_troughs <= '0';
                        current_state <= IDLE;
                        last_corr := x"0000000";
                        counter <= x"00000"&'0';
                        system_on <= '0';
                        load_initials := '0';
                        both_loaded  := '0';
                    --Turn Peak detector on
                    elsif (recv.data(18 downto 15) = "0001") then
                        system_on <= '1';
                    -- Detect troughs mode on
                    elsif (recv.data(18 downto 15) = "0010") then
                         detect_troughs <= '1';
                    -- Detect trough mode off
                    elsif (recv.data(18 downto 15) = "0011") then
                        detect_troughs <= '0';
                    end if;
                end if;

                -- Hanld Initial comparison errors, load two values before compuation
                if (recv.data(31 downto 29) = "100" and both_loaded = '0' and recv.data(28) = '1' and system_on = '1') then
                    if (load_initials = '0') then
                        last_corr := recv.data(27 downto 0);
                        load_initials := '1';
                        counter <= counter + 1;
                        both_loaded := '0';
                    -- Load the current value every clock
                    else
                        current_corr := recv.data(27 downto 0);
                        both_loaded := '1';
                    end if;
                end if;
              
                if both_loaded = '1' and system_on = '1' then
                        if (current_state = POSITIVE_SLOPE) or (current_state = IDLE) then
                            -- Peak detector send value to nios and clear the counter
                            if (current_corr < last_corr) then
                                peak_detected <= '1';
                                current_state <= NEGATIVE_SLOPE;
                                send.data <= "10111"&x"0"&"11"&std_logic_vector(counter);
                                counter <= (others => '0');
                            else
                                counter <= counter + 1;
                            end if;
                        elsif (current_state = NEGATIVE_SLOPE) then
                            -- Trough detected, send if trough mode is on
                            if (current_corr > last_corr) then
                                current_state <= POSITIVE_SLOPE;
                                -- returns correlation count from the last peak
                                if (detect_troughs = '1') then
                                    send.data <= "11111"&x"3"&"10"&std_logic_vector(counter);
                                end if;
                                counter <= counter + 1;
                            else
                                counter <= counter + 1;
                            end if;
                        end if;

                        -- update the last correlation value
                        last_corr := current_corr;
                        last_correlation_out <= last_corr;
                        both_loaded := '0';
                else
                    -- Clear the data sent to nios if nothing to be sent
                    send.data <= x"80000000";
                end if;
                
                -- To check when we recieve value from tdmn
                case (recv.addr) is
                    when x"01" =>
                        wanted_recv_data <= recv.data;
                    when others => 
                end case;
                
            end if;
            -- update address to that sent by config packet
            send.addr <= send_addr_v;
    end process;


    current_correlation_out <= recv.data(27 downto 0) when recv.data(31 downto 28) = "1001" and system_on = '1';
    correlation_count <= std_logic_vector(counter);

    state <= "000" when current_state = IDLE else
        "001" when current_state = POSITIVE_SLOPE else
        "010" when current_state = NEGATIVE_SLOPE;
        
end find_peak;