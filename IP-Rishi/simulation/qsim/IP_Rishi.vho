-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "05/24/2024 10:26:28"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	toplevel IS
    PORT (
	adc_data_ready : OUT std_logic;
	clock : IN std_logic;
	reset : IN std_logic;
	adc_request : IN std_logic;
	adc_data : OUT std_logic_vector(11 DOWNTO 0);
	counter : OUT std_logic_vector(13 DOWNTO 0)
	);
END toplevel;

ARCHITECTURE structure OF toplevel IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_adc_data_ready : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_adc_request : std_logic;
SIGNAL ww_adc_data : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_counter : std_logic_vector(13 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \adc_data_ready~output_o\ : std_logic;
SIGNAL \adc_data[11]~output_o\ : std_logic;
SIGNAL \adc_data[10]~output_o\ : std_logic;
SIGNAL \adc_data[9]~output_o\ : std_logic;
SIGNAL \adc_data[8]~output_o\ : std_logic;
SIGNAL \adc_data[7]~output_o\ : std_logic;
SIGNAL \adc_data[6]~output_o\ : std_logic;
SIGNAL \adc_data[5]~output_o\ : std_logic;
SIGNAL \adc_data[4]~output_o\ : std_logic;
SIGNAL \adc_data[3]~output_o\ : std_logic;
SIGNAL \adc_data[2]~output_o\ : std_logic;
SIGNAL \adc_data[1]~output_o\ : std_logic;
SIGNAL \adc_data[0]~output_o\ : std_logic;
SIGNAL \counter[13]~output_o\ : std_logic;
SIGNAL \counter[12]~output_o\ : std_logic;
SIGNAL \counter[11]~output_o\ : std_logic;
SIGNAL \counter[10]~output_o\ : std_logic;
SIGNAL \counter[9]~output_o\ : std_logic;
SIGNAL \counter[8]~output_o\ : std_logic;
SIGNAL \counter[7]~output_o\ : std_logic;
SIGNAL \counter[6]~output_o\ : std_logic;
SIGNAL \counter[5]~output_o\ : std_logic;
SIGNAL \counter[4]~output_o\ : std_logic;
SIGNAL \counter[3]~output_o\ : std_logic;
SIGNAL \counter[2]~output_o\ : std_logic;
SIGNAL \counter[1]~output_o\ : std_logic;
SIGNAL \counter[0]~output_o\ : std_logic;
SIGNAL \adc_request~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \inst|Add1~1_sumout\ : std_logic;
SIGNAL \inst|Add1~2\ : std_logic;
SIGNAL \inst|Add1~5_sumout\ : std_logic;
SIGNAL \inst|Add0~53_sumout\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \inst|Equal0~1_combout\ : std_logic;
SIGNAL \inst|Equal0~2_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \inst|Add0~54\ : std_logic;
SIGNAL \inst|Add0~49_sumout\ : std_logic;
SIGNAL \inst|Add0~50\ : std_logic;
SIGNAL \inst|Add0~45_sumout\ : std_logic;
SIGNAL \inst|Add0~46\ : std_logic;
SIGNAL \inst|Add0~41_sumout\ : std_logic;
SIGNAL \inst|Add0~42\ : std_logic;
SIGNAL \inst|Add0~37_sumout\ : std_logic;
SIGNAL \inst|Add0~38\ : std_logic;
SIGNAL \inst|Add0~33_sumout\ : std_logic;
SIGNAL \inst|Add0~34\ : std_logic;
SIGNAL \inst|Add0~29_sumout\ : std_logic;
SIGNAL \inst|Add0~30\ : std_logic;
SIGNAL \inst|Add0~25_sumout\ : std_logic;
SIGNAL \inst|Add0~26\ : std_logic;
SIGNAL \inst|Add0~21_sumout\ : std_logic;
SIGNAL \inst|Add0~22\ : std_logic;
SIGNAL \inst|Add0~17_sumout\ : std_logic;
SIGNAL \inst|Add0~18\ : std_logic;
SIGNAL \inst|Add0~13_sumout\ : std_logic;
SIGNAL \inst|Add0~14\ : std_logic;
SIGNAL \inst|Add0~9_sumout\ : std_logic;
SIGNAL \inst|Add0~10\ : std_logic;
SIGNAL \inst|Add0~5_sumout\ : std_logic;
SIGNAL \inst|Add0~6\ : std_logic;
SIGNAL \inst|Add0~1_sumout\ : std_logic;
SIGNAL \inst|rom_address[0]~0_combout\ : std_logic;
SIGNAL \inst|Add1~6\ : std_logic;
SIGNAL \inst|Add1~9_sumout\ : std_logic;
SIGNAL \inst|Add1~10\ : std_logic;
SIGNAL \inst|Add1~13_sumout\ : std_logic;
SIGNAL \inst|Add1~14\ : std_logic;
SIGNAL \inst|Add1~17_sumout\ : std_logic;
SIGNAL \inst|Add1~18\ : std_logic;
SIGNAL \inst|Add1~21_sumout\ : std_logic;
SIGNAL \inst|Add1~22\ : std_logic;
SIGNAL \inst|Add1~25_sumout\ : std_logic;
SIGNAL \inst|Add1~26\ : std_logic;
SIGNAL \inst|Add1~29_sumout\ : std_logic;
SIGNAL \inst|Add1~30\ : std_logic;
SIGNAL \inst|Add1~33_sumout\ : std_logic;
SIGNAL \inst|Add1~34\ : std_logic;
SIGNAL \inst|Add1~37_sumout\ : std_logic;
SIGNAL \inst|Add1~38\ : std_logic;
SIGNAL \inst|Add1~41_sumout\ : std_logic;
SIGNAL \inst|Add1~42\ : std_logic;
SIGNAL \inst|Add1~45_sumout\ : std_logic;
SIGNAL \inst|Equal1~0_combout\ : std_logic;
SIGNAL \inst|Equal1~1_combout\ : std_logic;
SIGNAL \inst|Equal1~2_combout\ : std_logic;
SIGNAL \inst|adc_data[11]~0_combout\ : std_logic;
SIGNAL \inst|adc_data[10]~1_combout\ : std_logic;
SIGNAL \inst|adc_data[9]~2_combout\ : std_logic;
SIGNAL \inst|adc_data[8]~3_combout\ : std_logic;
SIGNAL \inst|adc_data[7]~4_combout\ : std_logic;
SIGNAL \inst|adc_data[6]~5_combout\ : std_logic;
SIGNAL \inst|adc_data[5]~6_combout\ : std_logic;
SIGNAL \inst|adc_data[4]~7_combout\ : std_logic;
SIGNAL \inst|adc_data[3]~8_combout\ : std_logic;
SIGNAL \inst|adc_data[2]~9_combout\ : std_logic;
SIGNAL \inst|adc_data[1]~10_combout\ : std_logic;
SIGNAL \inst|adc_data[0]~11_combout\ : std_logic;
SIGNAL \inst|altsyncram_component|auto_generated|q_a\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|sampling_counter\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \inst|rom_address\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_clock~input_o\ : std_logic;
SIGNAL \ALT_INV_adc_request~input_o\ : std_logic;
SIGNAL \inst|ALT_INV_Equal1~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_rom_address\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst|ALT_INV_sampling_counter\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ALT_INV_q_a\ : std_logic_vector(11 DOWNTO 0);

BEGIN

adc_data_ready <= ww_adc_data_ready;
ww_clock <= clock;
ww_reset <= reset;
ww_adc_request <= adc_request;
adc_data <= ww_adc_data;
counter <= ww_counter;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(11) <= \inst|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(10) <= \inst|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(9) <= \inst|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(8) <= \inst|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(7) <= \inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(6) <= \inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(5) <= \inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(4) <= \inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(3) <= \inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(2) <= \inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(1) <= \inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst|rom_address\(10) & \inst|rom_address\(9) & \inst|rom_address\(8) & \inst|rom_address\(7) & \inst|rom_address\(6) & \inst|rom_address\(5) & \inst|rom_address\(4)
& \inst|rom_address\(3) & \inst|rom_address\(2) & \inst|rom_address\(1) & \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|q_a\(0) <= \inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_clock~input_o\ <= NOT \clock~input_o\;
\ALT_INV_adc_request~input_o\ <= NOT \adc_request~input_o\;
\inst|ALT_INV_Equal1~1_combout\ <= NOT \inst|Equal1~1_combout\;
\inst|ALT_INV_Equal1~0_combout\ <= NOT \inst|Equal1~0_combout\;
\inst|ALT_INV_Equal0~1_combout\ <= NOT \inst|Equal0~1_combout\;
\inst|ALT_INV_Equal0~0_combout\ <= NOT \inst|Equal0~0_combout\;
\inst|ALT_INV_rom_address\(11) <= NOT \inst|rom_address\(11);
\inst|ALT_INV_rom_address\(10) <= NOT \inst|rom_address\(10);
\inst|ALT_INV_rom_address\(9) <= NOT \inst|rom_address\(9);
\inst|ALT_INV_rom_address\(8) <= NOT \inst|rom_address\(8);
\inst|ALT_INV_rom_address\(7) <= NOT \inst|rom_address\(7);
\inst|ALT_INV_rom_address\(6) <= NOT \inst|rom_address\(6);
\inst|ALT_INV_rom_address\(5) <= NOT \inst|rom_address\(5);
\inst|ALT_INV_rom_address\(4) <= NOT \inst|rom_address\(4);
\inst|ALT_INV_rom_address\(3) <= NOT \inst|rom_address\(3);
\inst|ALT_INV_rom_address\(2) <= NOT \inst|rom_address\(2);
\inst|ALT_INV_rom_address\(1) <= NOT \inst|rom_address\(1);
\inst|ALT_INV_rom_address\(0) <= NOT \inst|rom_address\(0);
\inst|ALT_INV_sampling_counter\(0) <= NOT \inst|sampling_counter\(0);
\inst|ALT_INV_sampling_counter\(1) <= NOT \inst|sampling_counter\(1);
\inst|ALT_INV_sampling_counter\(2) <= NOT \inst|sampling_counter\(2);
\inst|ALT_INV_sampling_counter\(3) <= NOT \inst|sampling_counter\(3);
\inst|ALT_INV_sampling_counter\(4) <= NOT \inst|sampling_counter\(4);
\inst|ALT_INV_sampling_counter\(5) <= NOT \inst|sampling_counter\(5);
\inst|ALT_INV_sampling_counter\(6) <= NOT \inst|sampling_counter\(6);
\inst|ALT_INV_sampling_counter\(7) <= NOT \inst|sampling_counter\(7);
\inst|ALT_INV_sampling_counter\(8) <= NOT \inst|sampling_counter\(8);
\inst|ALT_INV_sampling_counter\(9) <= NOT \inst|sampling_counter\(9);
\inst|ALT_INV_sampling_counter\(10) <= NOT \inst|sampling_counter\(10);
\inst|ALT_INV_sampling_counter\(11) <= NOT \inst|sampling_counter\(11);
\inst|ALT_INV_sampling_counter\(12) <= NOT \inst|sampling_counter\(12);
\inst|ALT_INV_sampling_counter\(13) <= NOT \inst|sampling_counter\(13);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(0) <= NOT \inst|altsyncram_component|auto_generated|q_a\(0);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(1) <= NOT \inst|altsyncram_component|auto_generated|q_a\(1);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(2) <= NOT \inst|altsyncram_component|auto_generated|q_a\(2);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(3) <= NOT \inst|altsyncram_component|auto_generated|q_a\(3);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(4) <= NOT \inst|altsyncram_component|auto_generated|q_a\(4);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(5) <= NOT \inst|altsyncram_component|auto_generated|q_a\(5);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(6) <= NOT \inst|altsyncram_component|auto_generated|q_a\(6);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(7) <= NOT \inst|altsyncram_component|auto_generated|q_a\(7);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(8) <= NOT \inst|altsyncram_component|auto_generated|q_a\(8);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(9) <= NOT \inst|altsyncram_component|auto_generated|q_a\(9);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(10) <= NOT \inst|altsyncram_component|auto_generated|q_a\(10);
\inst|altsyncram_component|auto_generated|ALT_INV_q_a\(11) <= NOT \inst|altsyncram_component|auto_generated|q_a\(11);

\adc_data_ready~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adc_request~input_o\,
	devoe => ww_devoe,
	o => \adc_data_ready~output_o\);

\adc_data[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[11]~0_combout\,
	devoe => ww_devoe,
	o => \adc_data[11]~output_o\);

\adc_data[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[10]~1_combout\,
	devoe => ww_devoe,
	o => \adc_data[10]~output_o\);

\adc_data[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[9]~2_combout\,
	devoe => ww_devoe,
	o => \adc_data[9]~output_o\);

\adc_data[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[8]~3_combout\,
	devoe => ww_devoe,
	o => \adc_data[8]~output_o\);

\adc_data[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[7]~4_combout\,
	devoe => ww_devoe,
	o => \adc_data[7]~output_o\);

\adc_data[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[6]~5_combout\,
	devoe => ww_devoe,
	o => \adc_data[6]~output_o\);

\adc_data[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[5]~6_combout\,
	devoe => ww_devoe,
	o => \adc_data[5]~output_o\);

\adc_data[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[4]~7_combout\,
	devoe => ww_devoe,
	o => \adc_data[4]~output_o\);

\adc_data[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[3]~8_combout\,
	devoe => ww_devoe,
	o => \adc_data[3]~output_o\);

\adc_data[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[2]~9_combout\,
	devoe => ww_devoe,
	o => \adc_data[2]~output_o\);

\adc_data[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[1]~10_combout\,
	devoe => ww_devoe,
	o => \adc_data[1]~output_o\);

\adc_data[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|adc_data[0]~11_combout\,
	devoe => ww_devoe,
	o => \adc_data[0]~output_o\);

\counter[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(13),
	devoe => ww_devoe,
	o => \counter[13]~output_o\);

\counter[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(12),
	devoe => ww_devoe,
	o => \counter[12]~output_o\);

\counter[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(11),
	devoe => ww_devoe,
	o => \counter[11]~output_o\);

\counter[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(10),
	devoe => ww_devoe,
	o => \counter[10]~output_o\);

\counter[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(9),
	devoe => ww_devoe,
	o => \counter[9]~output_o\);

\counter[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(8),
	devoe => ww_devoe,
	o => \counter[8]~output_o\);

\counter[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(7),
	devoe => ww_devoe,
	o => \counter[7]~output_o\);

\counter[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(6),
	devoe => ww_devoe,
	o => \counter[6]~output_o\);

\counter[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(5),
	devoe => ww_devoe,
	o => \counter[5]~output_o\);

\counter[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(4),
	devoe => ww_devoe,
	o => \counter[4]~output_o\);

\counter[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(3),
	devoe => ww_devoe,
	o => \counter[3]~output_o\);

\counter[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(2),
	devoe => ww_devoe,
	o => \counter[2]~output_o\);

\counter[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(1),
	devoe => ww_devoe,
	o => \counter[1]~output_o\);

\counter[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sampling_counter\(0),
	devoe => ww_devoe,
	o => \counter[0]~output_o\);

\adc_request~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_adc_request,
	o => \adc_request~input_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\inst|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~1_sumout\ = SUM(( \inst|rom_address\(0) ) + ( VCC ) + ( !VCC ))
-- \inst|Add1~2\ = CARRY(( \inst|rom_address\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(0),
	cin => GND,
	sumout => \inst|Add1~1_sumout\,
	cout => \inst|Add1~2\);

\inst|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~5_sumout\ = SUM(( \inst|rom_address\(1) ) + ( GND ) + ( \inst|Add1~2\ ))
-- \inst|Add1~6\ = CARRY(( \inst|rom_address\(1) ) + ( GND ) + ( \inst|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(1),
	cin => \inst|Add1~2\,
	sumout => \inst|Add1~5_sumout\,
	cout => \inst|Add1~6\);

\inst|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~53_sumout\ = SUM(( \inst|sampling_counter\(0) ) + ( VCC ) + ( !VCC ))
-- \inst|Add0~54\ = CARRY(( \inst|sampling_counter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(0),
	cin => GND,
	sumout => \inst|Add0~53_sumout\,
	cout => \inst|Add0~54\);

\inst|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = ( !\inst|sampling_counter\(7) & ( \inst|sampling_counter\(6) & ( (\inst|sampling_counter\(11) & (!\inst|sampling_counter\(10) & (!\inst|sampling_counter\(9) & !\inst|sampling_counter\(8)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_sampling_counter\(11),
	datab => \inst|ALT_INV_sampling_counter\(10),
	datac => \inst|ALT_INV_sampling_counter\(9),
	datad => \inst|ALT_INV_sampling_counter\(8),
	datae => \inst|ALT_INV_sampling_counter\(7),
	dataf => \inst|ALT_INV_sampling_counter\(6),
	combout => \inst|Equal0~0_combout\);

\inst|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal0~1_combout\ = ( \inst|sampling_counter\(0) & ( (!\inst|sampling_counter\(4) & (\inst|sampling_counter\(3) & (!\inst|sampling_counter\(2) & \inst|sampling_counter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000010000000000000000000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_sampling_counter\(4),
	datab => \inst|ALT_INV_sampling_counter\(3),
	datac => \inst|ALT_INV_sampling_counter\(2),
	datad => \inst|ALT_INV_sampling_counter\(1),
	datae => \inst|ALT_INV_sampling_counter\(0),
	combout => \inst|Equal0~1_combout\);

\inst|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal0~2_combout\ = ( \inst|Equal0~1_combout\ & ( (!\inst|sampling_counter\(13) & (\inst|sampling_counter\(12) & (\inst|sampling_counter\(5) & \inst|Equal0~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000001000000000000000000000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_sampling_counter\(13),
	datab => \inst|ALT_INV_sampling_counter\(12),
	datac => \inst|ALT_INV_sampling_counter\(5),
	datad => \inst|ALT_INV_Equal0~0_combout\,
	datae => \inst|ALT_INV_Equal0~1_combout\,
	combout => \inst|Equal0~2_combout\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\inst|sampling_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~53_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(0));

\inst|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~49_sumout\ = SUM(( \inst|sampling_counter\(1) ) + ( GND ) + ( \inst|Add0~54\ ))
-- \inst|Add0~50\ = CARRY(( \inst|sampling_counter\(1) ) + ( GND ) + ( \inst|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(1),
	cin => \inst|Add0~54\,
	sumout => \inst|Add0~49_sumout\,
	cout => \inst|Add0~50\);

\inst|sampling_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~49_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(1));

\inst|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~45_sumout\ = SUM(( \inst|sampling_counter\(2) ) + ( GND ) + ( \inst|Add0~50\ ))
-- \inst|Add0~46\ = CARRY(( \inst|sampling_counter\(2) ) + ( GND ) + ( \inst|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(2),
	cin => \inst|Add0~50\,
	sumout => \inst|Add0~45_sumout\,
	cout => \inst|Add0~46\);

\inst|sampling_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~45_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(2));

\inst|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~41_sumout\ = SUM(( \inst|sampling_counter\(3) ) + ( GND ) + ( \inst|Add0~46\ ))
-- \inst|Add0~42\ = CARRY(( \inst|sampling_counter\(3) ) + ( GND ) + ( \inst|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(3),
	cin => \inst|Add0~46\,
	sumout => \inst|Add0~41_sumout\,
	cout => \inst|Add0~42\);

\inst|sampling_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~41_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(3));

\inst|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~37_sumout\ = SUM(( \inst|sampling_counter\(4) ) + ( GND ) + ( \inst|Add0~42\ ))
-- \inst|Add0~38\ = CARRY(( \inst|sampling_counter\(4) ) + ( GND ) + ( \inst|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(4),
	cin => \inst|Add0~42\,
	sumout => \inst|Add0~37_sumout\,
	cout => \inst|Add0~38\);

\inst|sampling_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~37_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(4));

\inst|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~33_sumout\ = SUM(( \inst|sampling_counter\(5) ) + ( GND ) + ( \inst|Add0~38\ ))
-- \inst|Add0~34\ = CARRY(( \inst|sampling_counter\(5) ) + ( GND ) + ( \inst|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(5),
	cin => \inst|Add0~38\,
	sumout => \inst|Add0~33_sumout\,
	cout => \inst|Add0~34\);

\inst|sampling_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~33_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(5));

\inst|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~29_sumout\ = SUM(( \inst|sampling_counter\(6) ) + ( GND ) + ( \inst|Add0~34\ ))
-- \inst|Add0~30\ = CARRY(( \inst|sampling_counter\(6) ) + ( GND ) + ( \inst|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(6),
	cin => \inst|Add0~34\,
	sumout => \inst|Add0~29_sumout\,
	cout => \inst|Add0~30\);

\inst|sampling_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~29_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(6));

\inst|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~25_sumout\ = SUM(( \inst|sampling_counter\(7) ) + ( GND ) + ( \inst|Add0~30\ ))
-- \inst|Add0~26\ = CARRY(( \inst|sampling_counter\(7) ) + ( GND ) + ( \inst|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(7),
	cin => \inst|Add0~30\,
	sumout => \inst|Add0~25_sumout\,
	cout => \inst|Add0~26\);

\inst|sampling_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~25_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(7));

\inst|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~21_sumout\ = SUM(( \inst|sampling_counter\(8) ) + ( GND ) + ( \inst|Add0~26\ ))
-- \inst|Add0~22\ = CARRY(( \inst|sampling_counter\(8) ) + ( GND ) + ( \inst|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(8),
	cin => \inst|Add0~26\,
	sumout => \inst|Add0~21_sumout\,
	cout => \inst|Add0~22\);

\inst|sampling_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~21_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(8));

\inst|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~17_sumout\ = SUM(( \inst|sampling_counter\(9) ) + ( GND ) + ( \inst|Add0~22\ ))
-- \inst|Add0~18\ = CARRY(( \inst|sampling_counter\(9) ) + ( GND ) + ( \inst|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(9),
	cin => \inst|Add0~22\,
	sumout => \inst|Add0~17_sumout\,
	cout => \inst|Add0~18\);

\inst|sampling_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~17_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(9));

\inst|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~13_sumout\ = SUM(( \inst|sampling_counter\(10) ) + ( GND ) + ( \inst|Add0~18\ ))
-- \inst|Add0~14\ = CARRY(( \inst|sampling_counter\(10) ) + ( GND ) + ( \inst|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(10),
	cin => \inst|Add0~18\,
	sumout => \inst|Add0~13_sumout\,
	cout => \inst|Add0~14\);

\inst|sampling_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~13_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(10));

\inst|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~9_sumout\ = SUM(( \inst|sampling_counter\(11) ) + ( GND ) + ( \inst|Add0~14\ ))
-- \inst|Add0~10\ = CARRY(( \inst|sampling_counter\(11) ) + ( GND ) + ( \inst|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(11),
	cin => \inst|Add0~14\,
	sumout => \inst|Add0~9_sumout\,
	cout => \inst|Add0~10\);

\inst|sampling_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~9_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(11));

\inst|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~5_sumout\ = SUM(( \inst|sampling_counter\(12) ) + ( GND ) + ( \inst|Add0~10\ ))
-- \inst|Add0~6\ = CARRY(( \inst|sampling_counter\(12) ) + ( GND ) + ( \inst|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(12),
	cin => \inst|Add0~10\,
	sumout => \inst|Add0~5_sumout\,
	cout => \inst|Add0~6\);

\inst|sampling_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~5_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(12));

\inst|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~1_sumout\ = SUM(( \inst|sampling_counter\(13) ) + ( GND ) + ( \inst|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_sampling_counter\(13),
	cin => \inst|Add0~6\,
	sumout => \inst|Add0~1_sumout\);

\inst|sampling_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~1_sumout\,
	sclr => \inst|Equal0~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sampling_counter\(13));

\inst|rom_address[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|rom_address[0]~0_combout\ = ( \inst|Equal0~0_combout\ & ( \inst|Equal0~1_combout\ & ( (!\inst|sampling_counter\(13) & (\inst|sampling_counter\(12) & (\inst|sampling_counter\(5) & !\reset~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_sampling_counter\(13),
	datab => \inst|ALT_INV_sampling_counter\(12),
	datac => \inst|ALT_INV_sampling_counter\(5),
	datad => \ALT_INV_reset~input_o\,
	datae => \inst|ALT_INV_Equal0~0_combout\,
	dataf => \inst|ALT_INV_Equal0~1_combout\,
	combout => \inst|rom_address[0]~0_combout\);

\inst|rom_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~5_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(1));

\inst|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~9_sumout\ = SUM(( \inst|rom_address\(2) ) + ( GND ) + ( \inst|Add1~6\ ))
-- \inst|Add1~10\ = CARRY(( \inst|rom_address\(2) ) + ( GND ) + ( \inst|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(2),
	cin => \inst|Add1~6\,
	sumout => \inst|Add1~9_sumout\,
	cout => \inst|Add1~10\);

\inst|rom_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~9_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(2));

\inst|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~13_sumout\ = SUM(( \inst|rom_address\(3) ) + ( GND ) + ( \inst|Add1~10\ ))
-- \inst|Add1~14\ = CARRY(( \inst|rom_address\(3) ) + ( GND ) + ( \inst|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(3),
	cin => \inst|Add1~10\,
	sumout => \inst|Add1~13_sumout\,
	cout => \inst|Add1~14\);

\inst|rom_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~13_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(3));

\inst|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~17_sumout\ = SUM(( \inst|rom_address\(4) ) + ( GND ) + ( \inst|Add1~14\ ))
-- \inst|Add1~18\ = CARRY(( \inst|rom_address\(4) ) + ( GND ) + ( \inst|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(4),
	cin => \inst|Add1~14\,
	sumout => \inst|Add1~17_sumout\,
	cout => \inst|Add1~18\);

\inst|rom_address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~17_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(4));

\inst|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~21_sumout\ = SUM(( \inst|rom_address\(5) ) + ( GND ) + ( \inst|Add1~18\ ))
-- \inst|Add1~22\ = CARRY(( \inst|rom_address\(5) ) + ( GND ) + ( \inst|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(5),
	cin => \inst|Add1~18\,
	sumout => \inst|Add1~21_sumout\,
	cout => \inst|Add1~22\);

\inst|rom_address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~21_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(5));

\inst|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~25_sumout\ = SUM(( \inst|rom_address\(6) ) + ( GND ) + ( \inst|Add1~22\ ))
-- \inst|Add1~26\ = CARRY(( \inst|rom_address\(6) ) + ( GND ) + ( \inst|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(6),
	cin => \inst|Add1~22\,
	sumout => \inst|Add1~25_sumout\,
	cout => \inst|Add1~26\);

\inst|rom_address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~25_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(6));

\inst|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~29_sumout\ = SUM(( \inst|rom_address\(7) ) + ( GND ) + ( \inst|Add1~26\ ))
-- \inst|Add1~30\ = CARRY(( \inst|rom_address\(7) ) + ( GND ) + ( \inst|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(7),
	cin => \inst|Add1~26\,
	sumout => \inst|Add1~29_sumout\,
	cout => \inst|Add1~30\);

\inst|rom_address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~29_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(7));

\inst|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~33_sumout\ = SUM(( \inst|rom_address\(8) ) + ( GND ) + ( \inst|Add1~30\ ))
-- \inst|Add1~34\ = CARRY(( \inst|rom_address\(8) ) + ( GND ) + ( \inst|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(8),
	cin => \inst|Add1~30\,
	sumout => \inst|Add1~33_sumout\,
	cout => \inst|Add1~34\);

\inst|rom_address[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~33_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(8));

\inst|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~37_sumout\ = SUM(( \inst|rom_address\(9) ) + ( GND ) + ( \inst|Add1~34\ ))
-- \inst|Add1~38\ = CARRY(( \inst|rom_address\(9) ) + ( GND ) + ( \inst|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(9),
	cin => \inst|Add1~34\,
	sumout => \inst|Add1~37_sumout\,
	cout => \inst|Add1~38\);

\inst|rom_address[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~37_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(9));

\inst|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~41_sumout\ = SUM(( \inst|rom_address\(10) ) + ( GND ) + ( \inst|Add1~38\ ))
-- \inst|Add1~42\ = CARRY(( \inst|rom_address\(10) ) + ( GND ) + ( \inst|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(10),
	cin => \inst|Add1~38\,
	sumout => \inst|Add1~41_sumout\,
	cout => \inst|Add1~42\);

\inst|rom_address[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~41_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(10));

\inst|Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add1~45_sumout\ = SUM(( \inst|rom_address\(11) ) + ( GND ) + ( \inst|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_rom_address\(11),
	cin => \inst|Add1~42\,
	sumout => \inst|Add1~45_sumout\);

\inst|rom_address[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~45_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(11));

\inst|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal1~0_combout\ = ( \inst|rom_address\(10) & ( (\inst|rom_address\(6) & (!\inst|rom_address\(7) & (!\inst|rom_address\(8) & \inst|rom_address\(9)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000100000000000000000000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_rom_address\(6),
	datab => \inst|ALT_INV_rom_address\(7),
	datac => \inst|ALT_INV_rom_address\(8),
	datad => \inst|ALT_INV_rom_address\(9),
	datae => \inst|ALT_INV_rom_address\(10),
	combout => \inst|Equal1~0_combout\);

\inst|Equal1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal1~1_combout\ = (!\inst|rom_address\(0) & (!\inst|rom_address\(1) & (!\inst|rom_address\(2) & !\inst|rom_address\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_rom_address\(0),
	datab => \inst|ALT_INV_rom_address\(1),
	datac => \inst|ALT_INV_rom_address\(2),
	datad => \inst|ALT_INV_rom_address\(3),
	combout => \inst|Equal1~1_combout\);

\inst|Equal1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Equal1~2_combout\ = ( \inst|Equal1~1_combout\ & ( (!\inst|rom_address\(4) & (!\inst|rom_address\(5) & (!\inst|rom_address\(11) & \inst|Equal1~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001000000000000000000000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_rom_address\(4),
	datab => \inst|ALT_INV_rom_address\(5),
	datac => \inst|ALT_INV_rom_address\(11),
	datad => \inst|ALT_INV_Equal1~0_combout\,
	datae => \inst|ALT_INV_Equal1~1_combout\,
	combout => \inst|Equal1~2_combout\);

\inst|rom_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add1~1_sumout\,
	sclr => \inst|Equal1~2_combout\,
	ena => \inst|rom_address[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|rom_address\(0));

\inst|altsyncram_component|auto_generated|ram_block1a11\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\);

\inst|adc_data[11]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[11]~0_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(11))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(11),
	combout => \inst|adc_data[11]~0_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a10\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

\inst|adc_data[10]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[10]~1_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(10))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(10),
	combout => \inst|adc_data[10]~1_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a9\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

\inst|adc_data[9]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[9]~2_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(9))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(9),
	combout => \inst|adc_data[9]~2_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a8\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

\inst|adc_data[8]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[8]~3_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(8))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(8),
	combout => \inst|adc_data[8]~3_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a7\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE80000000000000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD80000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8000000000000000000000000000000000000001BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0000000000000000000000000000000000000000FFFFFFF",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

\inst|adc_data[7]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[7]~4_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(7))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(7),
	combout => \inst|adc_data[7]~4_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a6\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "FFFFDFDFFFFFFFFFFFFFFFFFF69E000017FC0000000021000000000000000000000B9FFFF801FFFFFFFFE7EFFFFFFFFFFFFFFFFFEEC000000FF800000000020000000000000000000016FFFFF802FFFFFFFFF7EFFFFFFFFFFFFFFFEFFB12000027FC0000000000000000000000000000114BFFFFFC03FFFFFFFFFFFFFDFFFFFFFFFFFFFFFF40000027FC0000000000000000000000000000029BFFFFE401FFFFFFFFBFFFFFDFFFFFFFFFFFFFFD9000001FFE000000000080000000000000000000BBBFFFF0027FFF",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

\inst|adc_data[6]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[6]~5_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(6))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(6),
	combout => \inst|adc_data[6]~5_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a5\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "FF00202000000000000000000961FF601783C000081FDEFFFFFFFFFF1A6EFBFFFFF4640F783E0BFFDC0018100000000001010000113FFEDA0F475800207FFDFFFFFFF3DFBFBFF7FDFFE90003F81D0FFFF4000810000000020400001004EDFFF42763D80002BFFFFFFFFFFFFE6EF3FEFFEEB40005FC1C0FFFFC000000020000601000000000BFFF2C2743A000063FFFFFFFFFF7B33BBEFFFFFD64005BE47E05FF700040000020000000408000026FFFF81F01D800017FFF7FFFFFFEEBCEFFF6FFFF44400FF03D85FF",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

\inst|adc_data[5]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[5]~6_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(5))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(5),
	combout => \inst|adc_data[5]~6_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a4\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "08CDA074842FDFF3EFEFBD680965F79F167B3DC065E490C64A554008E59144429FD47070C9CE363C23F29C5B88A6BCD5EEDEF1E4D93FF1246EB6A6971F9B75F891005E204042281A2BE9177C586D3103ABA81810E18601FDBBB6FD7324EDE80B269B26025543B2D8CC288183910C21218EA40C6A3CE4716D83BE0802EB2E1715E7BBD3A680B21ED2E4A3DD5729C9A9A8E5271D4CC5450201656409A4E7873A048FF84C0193211CFE7FBF7728426FF8471EC166026E85050E6CF0C11433001922FB4447B092C5FA37",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

\inst|adc_data[4]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[4]~7_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(4))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(4),
	combout => \inst|adc_data[4]~7_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a3\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0410F9BA315405345CB06007F8608CDBF903EEA5B7FBC7A8B52A957065D3949D3F2423E33A97F5AEE7491B357758DB7BBA7EEE5B330C27018987E0E8C384AC253C15ED3240DC59D1D6FD98DC212568662977EED91E407A05D37B4898ECA4132BE5C0A6C91C743CACAAB3D605816E9BDE01101308CDF8841223409BDC9653F11A01DF6A53E73DF9B223B673A199D2567312582ACCC0D359809864F2042E480B9AE527539E18779369DAA548762A7906C1FEFDA3199E33FA31230F291BF587AC140544C9E2E9B9BF80",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

\inst|adc_data[3]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[3]~8_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(3))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(3),
	combout => \inst|adc_data[3]~8_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a2\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "F26641237BA0AEED9315DC9F3D8B1AFA814A5C9387522419A5F568A16DD8046513AC48C1BD560D5534065C345CD719AEF069C4CBBE0B0E6D2B29E441874BC0CAEC2E0CCC1411BE3FC241E2E4E99098C3CB57EF4C8A18EE68621945F07695ADA2FBCBEC94ADB5D62739C9260921148A146830293B9768A38E4A1350E707D4A90866E03D9C769DF9F1AA9B5A6888627CE558B6D8384623853E0CE968CBC1987AEEAFD26C02B0B0AE57AA1E0158C66AD02CBDFCE3B55CF2916E564F725445E06D803F5650B9E97C0B4F",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

\inst|adc_data[2]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[2]~9_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(2))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(2),
	combout => \inst|adc_data[2]~9_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "83E8C846DEB5FDAFD303798B69A2E7A8CD4BB2D9106EF9E4F2DAE91307A13FA059B06F90C8B30C48F1C75419FBFC87AEC6F23C1F96C3DD2422B7402E4B206484CAD34DE075AE8EE04D7B60929086E5DED86599087AEEAF344EF1A8CD142C01B8BEE3EBAB8909CFB32370AD08FC7D5DEB475FC19B5E2FBC91875BDC4054C2C30A0465623351A14E3CA98D7D09B79DB74538D06B1E4054CBB88F5B1C8D50957666F750F055725CFAD561972A3BDB36021662DC44F77B8838A8904FCBFD1C69314B8361B6E54F38B8D3",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

\inst|adc_data[1]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[1]~10_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(1))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(1),
	combout => \inst|adc_data[1]~10_combout\);

\inst|altsyncram_component|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "EB6B20E54935E80B0714D1902A20840969C542EDA31C1AD0740799B8A84F8E0B0820DEF4312D04C2C861AC77F31D3FBA29E7DD2420ADA316789CF3AE99E671733DC30940659DD0220D3CE09429962BFA5A9A4AF5AABA9508B75FC13503815E7BBE0E344A6934DD6736B18491382A8FD64A933D03791AA9120949872D4F3BEA5712E277C5D632207BBA1070EAA49C1FCDD73B716BD1509C66BAE0C63EFCDBCB275D7AA712D7CBC084B142938524C9BB1B839C5EF71B673A2F7BFF1B1FA26B8856772A6E41C6F5D1C9",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "signal_8bit.mif",
	init_file_layout => "port_a",
	logical_ram_name => "aspadc:inst|altsyncram:altsyncram_component|altsyncram_1oe1:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1599,
	port_a_logical_ram_depth => 1600,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

\inst|adc_data[0]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|adc_data[0]~11_combout\ = (\adc_request~input_o\ & \inst|altsyncram_component|auto_generated|q_a\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_adc_request~input_o\,
	datab => \inst|altsyncram_component|auto_generated|ALT_INV_q_a\(0),
	combout => \inst|adc_data[0]~11_combout\);

ww_adc_data_ready <= \adc_data_ready~output_o\;

ww_adc_data(11) <= \adc_data[11]~output_o\;

ww_adc_data(10) <= \adc_data[10]~output_o\;

ww_adc_data(9) <= \adc_data[9]~output_o\;

ww_adc_data(8) <= \adc_data[8]~output_o\;

ww_adc_data(7) <= \adc_data[7]~output_o\;

ww_adc_data(6) <= \adc_data[6]~output_o\;

ww_adc_data(5) <= \adc_data[5]~output_o\;

ww_adc_data(4) <= \adc_data[4]~output_o\;

ww_adc_data(3) <= \adc_data[3]~output_o\;

ww_adc_data(2) <= \adc_data[2]~output_o\;

ww_adc_data(1) <= \adc_data[1]~output_o\;

ww_adc_data(0) <= \adc_data[0]~output_o\;

ww_counter(13) <= \counter[13]~output_o\;

ww_counter(12) <= \counter[12]~output_o\;

ww_counter(11) <= \counter[11]~output_o\;

ww_counter(10) <= \counter[10]~output_o\;

ww_counter(9) <= \counter[9]~output_o\;

ww_counter(8) <= \counter[8]~output_o\;

ww_counter(7) <= \counter[7]~output_o\;

ww_counter(6) <= \counter[6]~output_o\;

ww_counter(5) <= \counter[5]~output_o\;

ww_counter(4) <= \counter[4]~output_o\;

ww_counter(3) <= \counter[3]~output_o\;

ww_counter(2) <= \counter[2]~output_o\;

ww_counter(1) <= \counter[1]~output_o\;

ww_counter(0) <= \counter[0]~output_o\;
END structure;


