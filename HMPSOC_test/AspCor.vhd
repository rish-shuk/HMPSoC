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
    signal enableCor : std_logic := '0';
    signal addr_s : std_logic_vector(7 downto 0) := x"02";
    signal data_flag : std_logic := '0';
    signal valid_flag : std_logic := '0';
    signal transmit_cor : signed(31 downto 0) := (others => '0');
    signal index : integer range 0 to 64 := 0;

begin
	process(clock)
    variable temp_corr_win : unsigned(6 downto 0) := to_unsigned(0, 7);
    variable buffer_index :  integer range 0 to 64 := 0;
    
	begin
		if rising_edge(clock) then
            data_flag <= '0';
            valid_flag <= '0';
            --temp_correlation := (others => '0');
            -- CHECK IF DATA PACKET IS A AVERAGE PACKET
            if recv.data(31 downto 27) = "10110" then
                data_flag <= '1';
                --temp_correlation := x"0000" & signed(recv.data(15 downto 0));
                if (enableCor = '1' and recv.data(16) = '1') then
                    -- IF WE HAVEN'T REACHED THE LAST INDEX
                    if (buffer_index <= (correlation_window - 1)) then
                        avg_buffer(buffer_index) <= recv.data(15 downto 0);
                        buffer_index := buffer_index + 1;
                    else
                        -- IF GETTING THE LAST ELEMENT
                        -- SET VALID FLAG TO INDICATE TO CORASP, RESET COUNTERS
                        valid_flag <= '1';
                        buffer_index := 0;
                    end if;
                end if;
            elsif recv.data(31 downto 27) = "10011" then
                addr_s <= x"0" & recv.data(23 downto 20);
                
                -- temp_corr_win := unsigned(recv.data(6 downto 0));
                case recv.data(4 downto 0) is
                    when "00001" =>
                        temp_corr_win := "0000100"; -- 4
                    when "00010" =>
                        temp_corr_win := "0001000"; -- 8
                    when "00100" =>
                        temp_corr_win := "0010000"; -- 16
                    when "01000" =>
                        temp_corr_win := "0100000"; -- 32
                    when "10000" =>
                        temp_corr_win := "1000000"; -- 64
                    when others =>
                end case;

                correlation_window <= temp_corr_win;
            end if;
		end if;
	end process;

    process(clock, valid_flag)
    variable temp_correlation : signed(31 downto 0) := (others => '1');    
	begin
        send.data <= x"0000" & std_logic_vector((recv.data(15 downto 0)));
		if rising_edge(valid_flag) then
            temp_correlation := (others => '0');
            for i in 0 to 31 loop
                if (i <= (to_integer(unsigned(correlation_window / 2))-1)) then 
                    temp_correlation := temp_correlation + (signed(avg_buffer(to_integer(unsigned(correlation_window / 2)) + i)) * signed(avg_buffer(to_integer(unsigned(correlation_window / 2)) - (i+1))));
                end if;
            end loop;

            if (temp_correlation > 268435455) then
                temp_correlation := (others => '1');
            end if;
            transmit_cor <= temp_correlation;
            send.data <= "1001" & std_logic_vector(temp_correlation(27 downto 0));
        end if;
        -- PASS THROUGH DATA
    end process;

    send.addr <= addr_s;
    --send.data <= data_flag & valid_flag & std_logic_vector(transmit_cor(29 downto 0));
    CorrVal <= std_logic_vector(transmit_cor);
end architecture;

