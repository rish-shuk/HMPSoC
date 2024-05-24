library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.macros.all;
--use work.TdmaMinTypes.all;

entity test_adc is
end entity;

architecture sim of test_adc is
    signal clock   : std_logic := '0';
    signal reset : std_logic := '0';

    signal adc_data_request : std_logic := '0';
    signal adc_data_ready : std_logic := '0';
    signal adc_data : std_logic_vector(11 downto 0);

    --signal send_port : tdma_min_ports(0 TO 8);
    --signal recv_port : tdma_min_ports(0 TO 8);

    component aspadc is
        port (
            clock               : in std_logic;
            reset               : in std_logic;

            adc_data_request    : in std_logic;
            adc_data_ready      : out std_logic;
            adc_data            : out std_logic_vector((data_width-1) downto 0)
        );
    end component;
begin
    DUT : aspadc port map(
        clock   => clock,
        reset => reset,

        adc_data_ready => adc_data_ready,
        adc_data_request => adc_data_request

    );
    adc_data_request <= '1' after 10 ns;
    reset             <= '0' after 150 ns;
    clock               <= not clock after 100 ns;
end architecture;