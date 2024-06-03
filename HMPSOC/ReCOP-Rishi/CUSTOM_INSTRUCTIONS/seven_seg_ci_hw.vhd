library ieee;
use ieee.std_logic_1164.all;

entity SEVEN_SEG_CI_HW is
    port (
        --clk, clk_en, reset, start     : in std_logic;
        number  : in std_logic_vector(31 downto 0);
        seg     : out std_logic_vector(31 downto 0)
    );
end entity SEVEN_SEG_CI_HW;

architecture behavioural of SEVEN_SEG_CI_HW is
		signal number_n : std_logic_vector(3 downto 0) := number(3 downto 0);
		signal seg_n : std_logic_vector(6 downto 0); 
begin
    process(number_n)
    begin
        case number_n is
            when "0000" => seg_n <= "1000000"; -- 0
            when "0001" => seg_n <= "1111001"; -- 1
            when "0010" => seg_n <= "0100100"; -- 2
            when "0011" => seg_n <= "0110000"; -- 3
            when "0100" => seg_n <= "0011001"; -- 4
            when "0101" => seg_n <= "0010010"; -- 5
            when "0110" => seg_n <= "0000010"; -- 6
            when "0111" => seg_n <= "1111000"; -- 7
            when "1000" => seg_n <= "0000000"; -- 8
            when "1001" => seg_n <= "0010000"; -- 9
            when others => seg_n <= "1111111"; -- default to blank
        end case;

        seg <= (others => '0');
        seg(6 downto 0) <= seg_n;
    end process;

end behavioural;