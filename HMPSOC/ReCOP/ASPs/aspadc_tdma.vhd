library ieee;
library altera_mf;
library work;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use altera_mf.all;

use work.TdmaMinTypes.all;

entity AspAdc is
    port(
			clock               : in std_logic;
			reset               : in std_logic;
			adc_data_ready      : out std_logic;
			
			send : out tdma_min_port;
			recv : in tdma_min_port
    );
end entity AspAdc;library ieee;
library altera_mf;
library work;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use altera_mf.all;

use work.TdmaMinTypes.all;

entity AspAdc is
    port(
			clock               : in std_logic;
			reset               : in std_logic;
			adc_data_ready      : out std_logic;
			
			send : out tdma_min_port;
			recv : in tdma_min_port
    );
end entity AspAdc;

architecture behaviour of AspAdc is

    COMPONENT altsyncram
	GENERIC (
		clock_enable_input_a		: STRING;
		clock_enable_output_a		: STRING;
		init_file		            : STRING;
		intended_device_family		: STRING;
		lpm_hint		            : STRING;
		lpm_type		            : STRING;
		maximum_depth		        : NATURAL;
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
    signal sampling_counter     : std_logic_vector(31 downto 0) := (others => '0');
    signal clock_a              : std_logic := '1';
	signal addr 				: std_logic_vector(3 downto 0) := "0001";
	signal data_bit 			: std_logic_vector(2 downto 0) := "011";-- (others => '0'); -- 001 = 8bit, 010 = 10bit, 011 = 12bit
	signal data_request 		: std_logic := '1'; -- initialised as 1


begin
    clock_a <= clock;

    altsyncram_component : altsyncram
	GENERIC MAP (
		clock_enable_input_a    => "BYPASS",
		clock_enable_output_a   => "BYPASS",
		init_file               => "input-generator/signal_12bit.mif",
		intended_device_family  => "Cyclone V",
		lpm_hint                => "ENABLE_RUNTIME_MOD=NO",
		lpm_type                => "altsyncram",
		maximum_depth           => 1600,
		numwords_a			  	=> 1600,
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

	-- check config packet if applicable
	process(clock)
	begin
		if rising_edge(clock) then
			if (recv.data(31 downto 27) = "10001") then 	-- if config message is received
				addr   <= recv.data(22 downto 19);		-- Address to where to port NEXT
				data_bit <= recv.data(2 downto 0);		-- Data-bit configuration
			end if;	
		end if;
	end process;


	-- To access ROM and send data
    process(clock, reset)
	variable data_width :integer;
	variable data_to_send : std_logic_vector(15 downto 0) := (others => '0');
    begin 
        if (reset = '1') then
        elsif rising_edge(clock) then
            sampling_counter <= sampling_counter + conv_std_logic_vector(1, 32);
            if (sampling_counter = conv_std_logic_vector(6249, 32)) then -- sampling rate configurable here
                sampling_counter <= conv_std_logic_vector(0, 32);
                rom_address <= rom_address + conv_std_logic_vector(1, 12);
                if (rom_address = conv_std_logic_vector(1600, 12)) then
                    rom_address <= conv_std_logic_vector(0, 12);
                end if;
				-- once sampling counter has been reached, then send new sample
				-- check bit width
				case data_bit is
					when "001" => data_width := 8;
					when "010" => data_width := 10;
					when "100" => data_width := 12;
					when others =>data_width := 12;
				end case;
				data_to_send(data_width - 1 downto 0) := data(data_width-1 downto 0); -- send data received from ROM
				send.addr <= "0000" & addr;	-- send to next component (port 1)
				send.data <= "1010100000000000" & data_to_send(15 downto 0); -- send with data head
				adc_data_ready <= '1';
			else
				send.addr <= "0000" & addr;
					send.data <= (others => '0');
					adc_data_ready <= '0';
            end if;
        end if;

    end process;

	
   
end architecture behaviour;


architecture behaviour of AspAdc is

    COMPONENT altsyncram
	GENERIC (
		clock_enable_input_a		: STRING;
		clock_enable_output_a		: STRING;
		init_file		            : STRING;
		intended_device_family		: STRING;
		lpm_hint		            : STRING;
		lpm_type		            : STRING;
		maximum_depth		        : NATURAL;
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
    signal sampling_counter     : std_logic_vector(31 downto 0) := (others => '0');
    signal clock_a              : std_logic := '1';
	signal addr 				: std_logic_vector(3 downto 0) := "0001";
	signal data_bit 			: std_logic_vector(2 downto 0) := "011";-- (others => '0'); -- 001 = 8bit, 010 = 10bit, 011 = 12bit
	signal data_request 		: std_logic := '1'; -- initialised as 1


begin
    clock_a <= clock;

    altsyncram_component : altsyncram
	GENERIC MAP (
		clock_enable_input_a    => "BYPASS",
		clock_enable_output_a   => "BYPASS",
		init_file               => "input-generator/signal_12bit.mif",
		intended_device_family  => "Cyclone V",
		lpm_hint                => "ENABLE_RUNTIME_MOD=NO",
		lpm_type                => "altsyncram",
		maximum_depth           => 1600,
		numwords_a			  	=> 1600,
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

	-- check config packet if applicable
	process(clock)
	begin
		if rising_edge(clock) then
			if (recv.data(31 downto 27) = "10001") then 	-- if config message is received
				addr   <= recv.data(23 downto 20);		-- Address to where to port
				data_bit <= recv.data(2 downto 0);		-- Data-bit configuration
				data_request <= recv.data(3);
			end if;	
		end if;
	end process;


	-- To access ROM and send data
    process(clock, reset)
	variable data_width :integer;
	variable data_to_send : std_logic_vector(15 downto 0) := (others => '0');
    begin 
        if (reset = '1') then
        elsif rising_edge(clock) then
            sampling_counter <= sampling_counter + conv_std_logic_vector(1, 32);
            if (sampling_counter = conv_std_logic_vector(6249, 32)) then -- sampling rate configurable here
                sampling_counter <= conv_std_logic_vector(0, 32);
                rom_address <= rom_address + conv_std_logic_vector(1, 12);
                if (rom_address = conv_std_logic_vector(1600, 12)) then
                    rom_address <= conv_std_logic_vector(0, 12);
                end if;
				-- once sampling counter has been reached, then send new sample
				-- check bit width
				if data_request = '1' then -- note data_request can be disabled via RECOP config package
					case data_bit is
						when "001" => data_width := 8;
						when "010" => data_width := 10;
						when "011" => data_width := 12;
						when others =>data_width := 12;
					end case;
					data_to_send(data_width - 1 downto 0) := data(data_width-1 downto 0); -- send data received from ROM
					send.addr <= "0000" & addr;	-- send to next component (port 1)
					send.data <= "1010000000000000" & data_to_send(15 downto 0); -- send with data head
					adc_data_ready <= '1';
				end if;
			else
				send.addr <= "0000" & addr;
					send.data <= (others => '0');
					adc_data_ready <= '0';
            end if;
        end if;

    end process;

	
   
end architecture behaviour;