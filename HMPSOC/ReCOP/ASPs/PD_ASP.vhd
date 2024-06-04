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

entity PD_ASP is
    port(
        clk : in std_logic;

        send : out tdma_min_port;  
        recv : in tdma_min_port;
		  
		  segOut : out std_logic_vector(6 downto 0)
        
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
    signal last_correlation : std_logic_vector(27 downto 0);
    signal wanted_data : std_logic_vector(27 downto 0);

    signal correlation_count : std_logic_vector(20 downto 0);

    signal current_correlation_out : std_logic_vector(27 downto 0) := (others => '0');
    signal last_correlation_out : std_logic_vector(27 downto 0);
	 
	 signal mode : unsigned(1 downto 0);


begin
    process(clk)
		  -- send to Nios by default
        variable send_addr_v : std_logic_vector(7 downto 0) := x"04";

        variable last_corr : std_logic_vector(27 downto 0) := (others => '0');
        variable current_corr : std_logic_vector(27 downto 0) := (others => '0');
        variable load_initials : std_logic:= '0';
        variable both_loaded : std_logic := '0';
    begin
            if rising_edge(clk) then
                --Congig
                -- Handle config packet -NOTE: Set config proccesors port
                if recv.data(31 downto 27) = "10100" then
						case recv.data(3 downto 0) is
							when "0001" =>
								detect_troughs <= '0'; -- off
                        current_state <= IDLE; 
                        last_correlation <= x"0000000";
                        counter <= x"00000"&'0';
                        system_on <= '0';
                        load_initials := '0';
                        both_loaded  := '0';
								mode <= "00";
							when "0010" => -- on
								system_on <= '1';
								mode <= "01";
							when "0100" => -- 
								detect_troughs <= '1';
								mode <= "10";
							when "1000" =>
								detect_troughs <= '0';
								mode <= "11";
							when others =>
						end case;
						
                    send_addr_v := (7 downto 4 => '0') & recv.data(22 downto 19);
						  
					end if;
--                    -- Check if we must detect toughs
--                    if (recv.data(18 downto 15) = "0000") then
--                        detect_troughs <= '0';
--                        current_state <= IDLE;
--                        last_correlation <= x"0000000";
--                        counter <= x"00000"&'0';
--                        system_on <= '0';
--                        load_initials := '0';
--                        both_loaded  := '0';
--                    elsif (recv.data(18 downto 15) = "0001") then
--                        system_on <= '1';
--                    elsif (recv.data(18 downto 15) = "0010") then
--                         detect_troughs <= '1';
--                    elsif (recv.data(18 downto 15) = "0011") then
--                        detect_troughs <= '0';
--                    end if;
--                end if;

                -- Initial loading and setting of the current and load registers
                -- Can source reg to find where data came from
                -- if (recv.addr = x"03" and both_loaded = '0' and recv.data(30) = '1' and system_on = '1') then
                if (both_loaded = '0' and recv.data(31 downto 28) = "1001" and system_on = '1') then
                    if (load_initials = '0') then
                        last_corr := recv.data(27 downto 0);
                        load_initials := '1';
                        counter <= counter + 1;
                        both_loaded := '0';
                    else
                        current_corr := recv.data(27 downto 0);
                        both_loaded := '1';
                    end if;
                end if;

                
                
                if both_loaded = '1'  and system_on = '1' then
                    -- recvdata from coorlaton-ASP is = (1 (31) Valid TDMN bit) (1 (30) corrolation ready flag) (29 (29 downto 0) Coorlation value)
                    --if unsigned(recv.addr) = 1 and recv.data(30) = '1' and system_on = '1' then
                        if (current_state = POSITIVE_SLOPE) or (current_state = IDLE) then
                            if (current_corr < last_corr) then
                                peak_detected <= '1';
                                current_state <= NEGATIVE_SLOPE;

                                send.data <= "10111"&x"0"&"11"&std_logic_vector(counter); -- sets IRQ and PEAK detected
                                -- Reset the counter to the next peak
                                counter <= (others => '0');
                            else
                                counter <= counter + 1;
                            end if;
                        elsif (current_state = NEGATIVE_SLOPE) then
                            if (current_corr > last_corr) then
                                current_state <= POSITIVE_SLOPE;
                                -- returns correlatio ncount from the last peak
                                if (detect_troughs = '1') then
                                    send.data <= "10111"&x"0"&"10"&std_logic_vector(counter);
                                end if;
                                counter <= counter + 1;
                            else
                                counter <= counter + 1;
                            end if;
                        end if;

                        last_corr := current_corr;
                        last_correlation <= last_corr;
                        last_correlation_out <= last_corr;
                        both_loaded := '0';
                else
                    -- Clear the data sent to nios
                    send.data <= x"B8000069";
                end if;
                
                -- case (recv.addr) is
                --     when x"03" =>
                --         wanted_data <= recv.data;
                --     when others => 
                -- end case;
                
            end if;
            send.addr <= send_addr_v;
    end process;

    current_correlation_out <= recv.data(27 downto 0) when system_on = '1';
    correlation_count <= std_logic_vector(counter);

    state <= "000" when current_state = IDLE else
        "001" when current_state = POSITIVE_SLOPE else
        "010" when current_state = NEGATIVE_SLOPE;
		  
	 with mode select segOut <=
		"1111001" when "00", --1 off
		"0100100" when "01", --2 on
		"0110000" when "10", --3 trough
		"0011001" when "11", --4 peak
		"1111111" when others;
end find_peak;