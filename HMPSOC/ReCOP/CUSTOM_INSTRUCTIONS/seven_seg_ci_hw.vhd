library ieee;
use ieee.std_logic_1164.all;

entity SEVEN_SEG_CI_HW is
    port (
        number : in std_logic_vector(31 downto 0);
        seg   : out std_logic_vector(31 downto 0)
    );
end SEVEN_SEG_CI_HW;

architecture behavioural of SEVEN_SEG_CI_HW is
    signal seg_n : std_logic_vector(7 downto 0); 
begin
    process(number)
    begin
        case number is
            when "0000" => seg <= "0111111"; -- 0
            when "0001" => seg <= "0000110"; -- 1
            when "0010" => seg <= "1011011"; -- 2
            when "0011" => seg <= "1001111"; -- 3
            when "0100" => seg <= "1100110"; -- 4
            when "0101" => seg <= "1101101"; -- 5
            when "0110" => seg <= "1111101"; -- 6
            when "0111" => seg <= "0000111"; -- 7
            when "1000" => seg <= "1111111"; -- 8
            when "1001" => seg <= "1101111"; -- 9
            when others => seg <= "0000000"; -- default to blank
        end case;

        seg <= (others => '0');
        seg(7 downto 0) <= seg_n;
    end process;

end behavioural;