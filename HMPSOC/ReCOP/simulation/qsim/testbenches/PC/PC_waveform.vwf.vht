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
-- Generated on "05/19/2024 23:46:20"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          PC_testbench
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY PC_testbench_vhd_vec_tst IS
END PC_testbench_vhd_vec_tst;
ARCHITECTURE PC_testbench_arch OF PC_testbench_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL counterIN : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL counterOUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL loadPC : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT PC_testbench
	PORT (
	clk : IN STD_LOGIC;
	counterIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	counterOUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	loadPC : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : PC_testbench
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	counterIN => counterIN,
	counterOUT => counterOUT,
	loadPC => loadPC,
	reset => reset
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 17
	LOOP
		clk <= '0';
		WAIT FOR 20000 ps;
		clk <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- loadPC
t_prcs_loadPC: PROCESS
BEGIN
	loadPC <= '0';
	WAIT FOR 40000 ps;
	loadPC <= '1';
	WAIT FOR 400000 ps;
	loadPC <= '0';
	WAIT FOR 40000 ps;
	loadPC <= '1';
WAIT;
END PROCESS t_prcs_loadPC;
-- counterIN[15]
t_prcs_counterIN_15: PROCESS
BEGIN
	counterIN(15) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_15;
-- counterIN[14]
t_prcs_counterIN_14: PROCESS
BEGIN
	counterIN(14) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_14;
-- counterIN[13]
t_prcs_counterIN_13: PROCESS
BEGIN
	counterIN(13) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_13;
-- counterIN[12]
t_prcs_counterIN_12: PROCESS
BEGIN
	counterIN(12) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_12;
-- counterIN[11]
t_prcs_counterIN_11: PROCESS
BEGIN
	counterIN(11) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_11;
-- counterIN[10]
t_prcs_counterIN_10: PROCESS
BEGIN
	counterIN(10) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_10;
-- counterIN[9]
t_prcs_counterIN_9: PROCESS
BEGIN
	counterIN(9) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_9;
-- counterIN[8]
t_prcs_counterIN_8: PROCESS
BEGIN
	counterIN(8) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_8;
-- counterIN[7]
t_prcs_counterIN_7: PROCESS
BEGIN
	counterIN(7) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_7;
-- counterIN[6]
t_prcs_counterIN_6: PROCESS
BEGIN
	counterIN(6) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_6;
-- counterIN[5]
t_prcs_counterIN_5: PROCESS
BEGIN
	counterIN(5) <= '0';
	WAIT FOR 640000 ps;
	counterIN(5) <= '1';
WAIT;
END PROCESS t_prcs_counterIN_5;
-- counterIN[4]
t_prcs_counterIN_4: PROCESS
BEGIN
	counterIN(4) <= '0';
	WAIT FOR 320000 ps;
	counterIN(4) <= '1';
	WAIT FOR 320000 ps;
	counterIN(4) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_4;
-- counterIN[3]
t_prcs_counterIN_3: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		counterIN(3) <= '0';
		WAIT FOR 160000 ps;
		counterIN(3) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	counterIN(3) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_3;
-- counterIN[2]
t_prcs_counterIN_2: PROCESS
BEGIN
	FOR i IN 1 TO 4
	LOOP
		counterIN(2) <= '0';
		WAIT FOR 80000 ps;
		counterIN(2) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	counterIN(2) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_2;
-- counterIN[1]
t_prcs_counterIN_1: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		counterIN(1) <= '0';
		WAIT FOR 40000 ps;
		counterIN(1) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	counterIN(1) <= '0';
	WAIT FOR 40000 ps;
	counterIN(1) <= '1';
WAIT;
END PROCESS t_prcs_counterIN_1;
-- counterIN[0]
t_prcs_counterIN_0: PROCESS
BEGIN
	FOR i IN 1 TO 17
	LOOP
		counterIN(0) <= '0';
		WAIT FOR 20000 ps;
		counterIN(0) <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	counterIN(0) <= '0';
WAIT;
END PROCESS t_prcs_counterIN_0;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 420000 ps;
	reset <= '1';
	WAIT FOR 79000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END PC_testbench_arch;
