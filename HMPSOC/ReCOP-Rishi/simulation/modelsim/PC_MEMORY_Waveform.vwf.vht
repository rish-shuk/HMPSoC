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
-- Generated on "05/09/2024 19:38:12"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          PC_MEMORY_testbench
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY PC_MEMORY_testbench_vhd_vec_tst IS
END PC_MEMORY_testbench_vhd_vec_tst;
ARCHITECTURE PC_MEMORY_testbench_arch OF PC_MEMORY_testbench_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Am : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL Func : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL loadPC : STD_LOGIC;
SIGNAL Op : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL PC_MUX_SELECT : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL PC_OUTPUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL Rx : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Rz : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL WriteHalfSelect : STD_LOGIC;
COMPONENT PC_MEMORY_testbench
	PORT (
	Am : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	clk : IN STD_LOGIC;
	Func : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	loadPC : IN STD_LOGIC;
	Op : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	PC_MUX_SELECT : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	PC_OUTPUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	reset : IN STD_LOGIC;
	Rx : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Rz : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	WriteHalfSelect : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : PC_MEMORY_testbench
	PORT MAP (
-- list connections between master ports and signals
	Am => Am,
	clk => clk,
	Func => Func,
	loadPC => loadPC,
	Op => Op,
	PC_MUX_SELECT => PC_MUX_SELECT,
	PC_OUTPUT => PC_OUTPUT,
	reset => reset,
	Rx => Rx,
	Rz => Rz,
	WriteHalfSelect => WriteHalfSelect
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- loadPC
t_prcs_loadPC: PROCESS
BEGIN
	loadPC <= '0';
	WAIT FOR 40000 ps;
	loadPC <= '1';
WAIT;
END PROCESS t_prcs_loadPC;
-- PC_MUX_SELECT[1]
t_prcs_PC_MUX_SELECT_1: PROCESS
BEGIN
	PC_MUX_SELECT(1) <= '0';
	WAIT FOR 500000 ps;
	PC_MUX_SELECT(1) <= '1';
	WAIT FOR 60000 ps;
	PC_MUX_SELECT(1) <= '0';
WAIT;
END PROCESS t_prcs_PC_MUX_SELECT_1;
-- PC_MUX_SELECT[0]
t_prcs_PC_MUX_SELECT_0: PROCESS
BEGIN
	PC_MUX_SELECT(0) <= '0';
	WAIT FOR 500000 ps;
	PC_MUX_SELECT(0) <= '1';
	WAIT FOR 60000 ps;
	PC_MUX_SELECT(0) <= '0';
WAIT;
END PROCESS t_prcs_PC_MUX_SELECT_0;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 480000 ps;
	reset <= '1';
	WAIT FOR 40000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- WriteHalfSelect
t_prcs_WriteHalfSelect: PROCESS
BEGIN
	WriteHalfSelect <= '1';
	WAIT FOR 20000 ps;
	FOR i IN 1 TO 24
	LOOP
		WriteHalfSelect <= '0';
		WAIT FOR 20000 ps;
		WriteHalfSelect <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	WriteHalfSelect <= '0';
WAIT;
END PROCESS t_prcs_WriteHalfSelect;
END PC_MEMORY_testbench_arch;
