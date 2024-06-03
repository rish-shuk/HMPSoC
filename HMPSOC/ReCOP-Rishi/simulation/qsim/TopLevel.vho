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

-- DATE "05/19/2024 23:46:21"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
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

ENTITY 	PC_testbench IS
    PORT (
	counterOUT : OUT std_logic_vector(15 DOWNTO 0);
	clk : IN std_logic;
	reset : IN std_logic;
	loadPC : IN std_logic;
	counterIN : IN std_logic_vector(15 DOWNTO 0)
	);
END PC_testbench;

ARCHITECTURE structure OF PC_testbench IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_counterOUT : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_loadPC : std_logic;
SIGNAL ww_counterIN : std_logic_vector(15 DOWNTO 0);
SIGNAL \counterOUT[15]~output_o\ : std_logic;
SIGNAL \counterOUT[14]~output_o\ : std_logic;
SIGNAL \counterOUT[13]~output_o\ : std_logic;
SIGNAL \counterOUT[12]~output_o\ : std_logic;
SIGNAL \counterOUT[11]~output_o\ : std_logic;
SIGNAL \counterOUT[10]~output_o\ : std_logic;
SIGNAL \counterOUT[9]~output_o\ : std_logic;
SIGNAL \counterOUT[8]~output_o\ : std_logic;
SIGNAL \counterOUT[7]~output_o\ : std_logic;
SIGNAL \counterOUT[6]~output_o\ : std_logic;
SIGNAL \counterOUT[5]~output_o\ : std_logic;
SIGNAL \counterOUT[4]~output_o\ : std_logic;
SIGNAL \counterOUT[3]~output_o\ : std_logic;
SIGNAL \counterOUT[2]~output_o\ : std_logic;
SIGNAL \counterOUT[1]~output_o\ : std_logic;
SIGNAL \counterOUT[0]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \counterIN[15]~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \loadPC~input_o\ : std_logic;
SIGNAL \counterIN[14]~input_o\ : std_logic;
SIGNAL \counterIN[13]~input_o\ : std_logic;
SIGNAL \counterIN[12]~input_o\ : std_logic;
SIGNAL \counterIN[11]~input_o\ : std_logic;
SIGNAL \counterIN[10]~input_o\ : std_logic;
SIGNAL \counterIN[9]~input_o\ : std_logic;
SIGNAL \counterIN[8]~input_o\ : std_logic;
SIGNAL \counterIN[7]~input_o\ : std_logic;
SIGNAL \counterIN[6]~input_o\ : std_logic;
SIGNAL \counterIN[5]~input_o\ : std_logic;
SIGNAL \counterIN[4]~input_o\ : std_logic;
SIGNAL \counterIN[3]~input_o\ : std_logic;
SIGNAL \counterIN[2]~input_o\ : std_logic;
SIGNAL \counterIN[1]~input_o\ : std_logic;
SIGNAL \counterIN[0]~input_o\ : std_logic;
SIGNAL \inst2|programCounterOut\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

BEGIN

counterOUT <= ww_counterOUT;
ww_clk <= clk;
ww_reset <= reset;
ww_loadPC <= loadPC;
ww_counterIN <= counterIN;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;

\counterOUT[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(15),
	devoe => ww_devoe,
	o => \counterOUT[15]~output_o\);

\counterOUT[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(14),
	devoe => ww_devoe,
	o => \counterOUT[14]~output_o\);

\counterOUT[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(13),
	devoe => ww_devoe,
	o => \counterOUT[13]~output_o\);

\counterOUT[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(12),
	devoe => ww_devoe,
	o => \counterOUT[12]~output_o\);

\counterOUT[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(11),
	devoe => ww_devoe,
	o => \counterOUT[11]~output_o\);

\counterOUT[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(10),
	devoe => ww_devoe,
	o => \counterOUT[10]~output_o\);

\counterOUT[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(9),
	devoe => ww_devoe,
	o => \counterOUT[9]~output_o\);

\counterOUT[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(8),
	devoe => ww_devoe,
	o => \counterOUT[8]~output_o\);

\counterOUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(7),
	devoe => ww_devoe,
	o => \counterOUT[7]~output_o\);

\counterOUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(6),
	devoe => ww_devoe,
	o => \counterOUT[6]~output_o\);

\counterOUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(5),
	devoe => ww_devoe,
	o => \counterOUT[5]~output_o\);

\counterOUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(4),
	devoe => ww_devoe,
	o => \counterOUT[4]~output_o\);

\counterOUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(3),
	devoe => ww_devoe,
	o => \counterOUT[3]~output_o\);

\counterOUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(2),
	devoe => ww_devoe,
	o => \counterOUT[2]~output_o\);

\counterOUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(1),
	devoe => ww_devoe,
	o => \counterOUT[1]~output_o\);

\counterOUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|programCounterOut\(0),
	devoe => ww_devoe,
	o => \counterOUT[0]~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\counterIN[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(15),
	o => \counterIN[15]~input_o\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\loadPC~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadPC,
	o => \loadPC~input_o\);

\inst2|programCounterOut[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[15]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(15));

\counterIN[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(14),
	o => \counterIN[14]~input_o\);

\inst2|programCounterOut[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[14]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(14));

\counterIN[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(13),
	o => \counterIN[13]~input_o\);

\inst2|programCounterOut[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[13]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(13));

\counterIN[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(12),
	o => \counterIN[12]~input_o\);

\inst2|programCounterOut[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[12]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(12));

\counterIN[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(11),
	o => \counterIN[11]~input_o\);

\inst2|programCounterOut[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[11]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(11));

\counterIN[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(10),
	o => \counterIN[10]~input_o\);

\inst2|programCounterOut[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[10]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(10));

\counterIN[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(9),
	o => \counterIN[9]~input_o\);

\inst2|programCounterOut[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[9]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(9));

\counterIN[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(8),
	o => \counterIN[8]~input_o\);

\inst2|programCounterOut[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[8]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(8));

\counterIN[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(7),
	o => \counterIN[7]~input_o\);

\inst2|programCounterOut[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(7));

\counterIN[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(6),
	o => \counterIN[6]~input_o\);

\inst2|programCounterOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(6));

\counterIN[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(5),
	o => \counterIN[5]~input_o\);

\inst2|programCounterOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(5));

\counterIN[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(4),
	o => \counterIN[4]~input_o\);

\inst2|programCounterOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(4));

\counterIN[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(3),
	o => \counterIN[3]~input_o\);

\inst2|programCounterOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(3));

\counterIN[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(2),
	o => \counterIN[2]~input_o\);

\inst2|programCounterOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(2));

\counterIN[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(1),
	o => \counterIN[1]~input_o\);

\inst2|programCounterOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(1));

\counterIN[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_counterIN(0),
	o => \counterIN[0]~input_o\);

\inst2|programCounterOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \counterIN[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \loadPC~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|programCounterOut\(0));

ww_counterOUT(15) <= \counterOUT[15]~output_o\;

ww_counterOUT(14) <= \counterOUT[14]~output_o\;

ww_counterOUT(13) <= \counterOUT[13]~output_o\;

ww_counterOUT(12) <= \counterOUT[12]~output_o\;

ww_counterOUT(11) <= \counterOUT[11]~output_o\;

ww_counterOUT(10) <= \counterOUT[10]~output_o\;

ww_counterOUT(9) <= \counterOUT[9]~output_o\;

ww_counterOUT(8) <= \counterOUT[8]~output_o\;

ww_counterOUT(7) <= \counterOUT[7]~output_o\;

ww_counterOUT(6) <= \counterOUT[6]~output_o\;

ww_counterOUT(5) <= \counterOUT[5]~output_o\;

ww_counterOUT(4) <= \counterOUT[4]~output_o\;

ww_counterOUT(3) <= \counterOUT[3]~output_o\;

ww_counterOUT(2) <= \counterOUT[2]~output_o\;

ww_counterOUT(1) <= \counterOUT[1]~output_o\;

ww_counterOUT(0) <= \counterOUT[0]~output_o\;
END structure;


