
library ieee;
library altera_mf;
library work;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use altera_mf.all;

use work.macros.all;

entity aspadc is
    port(
        clock               : in std_logic;
        reset               : in std_logic;

        adc_data_request    : in std_logic;
        adc_data_ready      : out std_logic;
        adc_data            : out std_logic_vector(11 downto 0)

    );
end entity aspadc;

architecture behaviour of aspadc is

    COMPONENT altsyncram
	GENERIC (
		clock_enable_input_a		: STRING;
		clock_enable_output_a		: STRING;
		init_file		            : STRING;
		intended_device_family		: STRING;
		lpm_hint		            : STRING;
		lpm_type		            : STRING;
		numwords_a		            : NATURAL;
		operation_mode		        : STRING;
		outdata_aclr_a		        : STRING;
		outdata_reg_a		        : STRING;
		widthad_a		            : NATURAL;
		width_a		                : NATURAL;
		width_byteena_a		        : NATURAL
	);
	PORT(
		address_a	: in std_logic_vector (11 downto 0);
		clock0	    : in std_logic;
		q_a	        : out std_logic_vector(11 downto 0)
	);
	END COMPONENT;

    signal rom_address          : std_logic_vector(11 downto 0) := (others => '0');
    signal data                 : std_logic_vector(11 downto 0) := (others => '0');
    signal sampling_counter     : std_logic_vector(13 downto 0) := (others => '0');
    signal clock_a              : std_logic := '1';

begin
    clock_a <= clock;

    altsyncram_component : altsyncram
	GENERIC MAP (
		clock_enable_input_a    => "BYPASS",
		clock_enable_output_a   => "BYPASS",
		init_file               => "input-generator/signal_8bit.mif",
		intended_device_family  => "Cyclone V",
		lpm_hint                => "ENABLE_RUNTIME_MOD=NO",
		lpm_type                => "altsyncram",
		numwords_a              => 1600,
		operation_mode          => "ROM",
		outdata_aclr_a          => "NONE",
		outdata_reg_a           => "UNREGISTERED",
		widthad_a               => 12,
		width_a                 => 12,
		width_byteena_a         => 1
	)
	PORT MAP (
		address_a => rom_address,
		clock0 => clock_a,
		q_a => data
	);

    process(clock, reset)
    begin 

        if (reset = '1') then

        elsif rising_edge(clock) then
            sampling_counter <= sampling_counter + conv_std_logic_vector(1, 14);

            if (sampling_counter = conv_std_logic_vector(6249, 14)) then
                sampling_counter <= conv_std_logic_vector(0, 14);
                rom_address <= rom_address + conv_std_logic_vector(1, 12);
                if (rom_address = conv_std_logic_vector(1600, 12)) then
                    rom_address <= conv_std_logic_vector(0, 12);
                end if;
            end if;
        end if;

    end process;
    adc_data <= data when adc_data_request = '1' else (others => '0');
    adc_data_ready <= '1' when adc_data_request = '1' else '0';
   
end architecture behaviour;