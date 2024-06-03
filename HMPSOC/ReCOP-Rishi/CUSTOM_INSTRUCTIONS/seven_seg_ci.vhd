library ieee;
use ieee.std_logic_1164.all;

entity SEVEN_SEG_CI is
    port (
        dataa : in std_logic_vector(31 downto 0);
        result   : out std_logic_vector(31 downto 0)
    );
end SEVEN_SEG_CI;

architecture structural of SEVEN_SEG_CI is
    component SEVEN_SEG_CI_HW is
        port (
            number : in std_logic_vector(31 downto 0);
            seg   : out std_logic_vector(31 downto 0)
        );
    end component SEVEN_SEG_CI_HW;
begin 
    C1: SEVEN_SEG_CI_HW port map (number => dataa, seg => result);
end structural;
