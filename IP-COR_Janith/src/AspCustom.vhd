library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity AspCustom is
	port (
		clock : in  std_logic;
		send  : out tdma_min_port;
		recv  : in  tdma_min_port
	);
end entity;

architecture rtl of AspCustom is

begin
    send.addr <= x"01";

	process(clock)
    variable edited_data : signed(15 downto 0);
    variable overflow : signed(31 downto 0);
    variable result : std_logic_vector(15 downto 0);
	begin
		if rising_edge(clock) then
            -- Check if data recived is data-audio
			if recv.data(31 downto 28) = "1000" then
                -- Get audio data
                edited_data := signed(recv.data(15 downto 0));
                -- Check if over 2048 or under -2048
                if edited_data >  2048 then
                    edited_data := to_signed(4096, 16);
                elsif edited_data < to_signed(-2048, 16) then
                    edited_data := to_signed(-4096, 16);
                else
                    -- Perform multiplication 32 bits
                    overflow := edited_data * 2;
                    -- Removes the LSBs
                    edited_data := resize(overflow, edited_data'length);
                end if;
                -- Set the channel bit to 1 (right) or 0 (Left) depending on the recieved data.
                -- One channel at a time
				if recv.data(16) = '0' then
                    send.data <= x"8000" & std_logic_vector(edited_data);
                else
                    send.data <= x"8001" & std_logic_vector(edited_data);
                end if;

            elsif recv.data(31 downto 28) = "1001" then
                send.addr <= x"0" & recv.data(23 downto 20);
            end if;
		end if;
	end process;

end architecture;
