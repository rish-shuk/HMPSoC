library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity AspCor is
	port (
		clock : in  std_logic;
		send  : out tdma_min_port;
		recv  : in  tdma_min_port;
        CorrVal : out std_logic_vector(31 downto 0)
	);
end entity;

architecture rtl of AspCor is

    signal correlation_window : unsigned(6 downto 0) := to_unsigned(4, 7);

    type buffer_type is array (63 downto 0) of std_logic_vector(15 downto 0);
    signal avg_buffer : buffer_type := (others => (others => '0'));
    signal buffer_index :  integer range 0 to 64 := 0;
    signal CorrN : integer range 0 to 32 := 2;
    signal enableCor : std_logic := '0';

begin
	process(clock)
    variable buffer_full : std_logic := '0';
    variable temp_correlation : signed(31 downto 0) := (others => '1');
    variable temp_corr_win : unsigned(6 downto 0) := to_unsigned(0, 7);
    variable valid_flag : std_logic := '0';
	begin
		if rising_edge(clock) then
            -- CHECK IF DATA PACKET IS A AVERAGE PACKET
            if recv.data(31 downto 28) = "1000" then
                valid_flag := '0';
                temp_correlation := x"0000" & signed(recv.data(15 downto 0));
                if (enableCor = '1') then
                    -- IF WE HAVEN'T REACHED THE LAST INDEX
                    if (buffer_index < (correlation_window - 1)) then
                        avg_buffer(buffer_index) <= recv.data(15 downto 0);
                        buffer_index <= buffer_index + 1;
                        send.data(15 downto 0) <= x"0000";
                    -- IF GETTING THE LAST ELEMENT
                    elsif ((buffer_index = (correlation_window - 1)) and (buffer_full = '0')) then
                        avg_buffer(buffer_index) <= recv.data(15 downto 0);
                        buffer_full := '1';
                        send.data(15 downto 0) <= x"0001";
                    -- IF BUFFER IS FULL
                    elsif (buffer_full = '1') then
                        temp_correlation := (others => '0');
                        -- CALCULATE CORRELATION VALUE (MAX LOOP SIZE IS 64/2 - 1 = 31)
                        for i in 0 to 31 loop
                            if (i <= (CorrN-1)) then 
                                temp_correlation := temp_correlation + (signed(avg_buffer(CorrN + i)) * signed(avg_buffer(CorrN - (i+1))));
                            end if;
                        end loop;
                        -- SET VALID FLAG TO INDICATE TO CORASP, RESET COUNTERS
                        valid_flag := '1';
                        CorrVal <= std_logic_vector(temp_correlation);
                        avg_buffer <= (others => (others => '0'));
                        buffer_index <= 0;
                        buffer_full := '0';
                    end if;
                end if;
            elsif recv.data(31 downto 28) = "1011" then
                send.addr <= x"0" & recv.data(23 downto 20);
                temp_corr_win := unsigned(recv.data(6 downto 0));

                -- IF THE PROVIDED CORRELATION WINDOW IS GREATER THAN 64, SET THE WINDOW TO 64
                if (temp_corr_win > 64) then
                    temp_corr_win := to_unsigned(64, 7);
                -- IF THE CORRELATION WINDOW IS ODD, MAKE IT EVEN BY REDUCING IT BY ONE
                elsif (temp_corr_win(0) = '1') then
                    temp_corr_win(0) := '0';
                end if;

                -- IF THE PROVIDED CORRELATION WINDOW IS EQUAL TO 0, DISABLE THE CORASP (PASSTHROUGH)
                if (temp_corr_win = 0) then 
                    enableCor <= '0';
                -- ELSE SET ENABLE ACCORDING TO WHAT IS RECIEVED
                else
                    enableCor <= recv.data(7);
                end if;

                correlation_window <= temp_corr_win;
                CorrN <= to_integer(temp_corr_win / 2);
            end if;
		end if;
    -- PASS THROUGH DATA
    send.data <= "0" & valid_flag & std_logic_vector(temp_correlation(29 downto 0));
	end process;
end architecture;