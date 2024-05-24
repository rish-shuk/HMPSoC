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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/24/2024 10:07:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          toplevel
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY toplevel_vhd_vec_tst IS
END toplevel_vhd_vec_tst;
ARCHITECTURE toplevel_arch OF toplevel_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL adc_data : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL adc_data_ready : STD_LOGIC;
SIGNAL adc_request : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL counter : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT toplevel
	PORT (
	adc_data : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
	adc_data_ready : OUT STD_LOGIC;
	adc_request : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	counter : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : toplevel
	PORT MAP (
-- list connections between master ports and signals
	adc_data => adc_data,
	adc_data_ready => adc_data_ready,
	adc_request => adc_request,
	clock => clock,
	counter => counter,
	reset => reset
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 10000 ps;
	clock <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 10000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;

-- adc_request
t_prcs_adc_request: PROCESS
BEGIN
	adc_request <= '1';
WAIT;
END PROCESS t_prcs_adc_request;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END toplevel_arch;
