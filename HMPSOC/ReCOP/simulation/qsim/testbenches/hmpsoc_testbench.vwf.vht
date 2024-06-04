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
-- Generated on "06/04/2024 13:44:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          hmpsoc_TopLevel
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY hmpsoc_TopLevel_vhd_vec_tst IS
END hmpsoc_TopLevel_vhd_vec_tst;
ARCHITECTURE hmpsoc_TopLevel_arch OF hmpsoc_TopLevel_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK2_50 : STD_LOGIC;
SIGNAL CLOCK3_50 : STD_LOGIC;
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL dmout_v : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL DPCR_v : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL op1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL op1sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL op2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL op2sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL opcode : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL operand : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL pc_v : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL pm_v : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL rfsel : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL rxdata : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL rxsel : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL rzdata : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL rzsel : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL send_v.addr : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL send_v.data : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL sip_v : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL sop_v : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT hmpsoc_TopLevel
	PORT (
	CLOCK2_50 : IN STD_LOGIC;
	CLOCK3_50 : IN STD_LOGIC;
	CLOCK_50 : IN STD_LOGIC;
	dmout_v : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	DPCR_v : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	op1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	op1sel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	op2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	op2sel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	opcode : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	operand : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	pc_v : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	pm_v : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	rfsel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	rxdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	rxsel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	rzdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	rzsel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	\send_v.addr\ : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	\send_v.data\ : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	sip_v : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	sop_v : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : hmpsoc_TopLevel
	PORT MAP (
-- list connections between master ports and signals
	CLOCK2_50 => CLOCK2_50,
	CLOCK3_50 => CLOCK3_50,
	CLOCK_50 => CLOCK_50,
	dmout_v => dmout_v,
	DPCR_v => DPCR_v,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	KEY => KEY,
	LEDR => LEDR,
	op1 => op1,
	op1sel => op1sel,
	op2 => op2,
	op2sel => op2sel,
	opcode => opcode,
	operand => operand,
	pc_v => pc_v,
	pm_v => pm_v,
	rfsel => rfsel,
	rxdata => rxdata,
	rxsel => rxsel,
	rzdata => rzdata,
	rzsel => rzsel,
	\send_v.addr\ => send_v.addr,
	\send_v.data\ => send_v.data,
	sip_v => sip_v,
	sop_v => sop_v,
	SW => SW
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 10000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 2000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;

-- KEY[1]
t_prcs_KEY_1: PROCESS
BEGIN
	KEY(1) <= '0';
WAIT;
END PROCESS t_prcs_KEY_1;
-- SW[9]
t_prcs_SW_9: PROCESS
BEGIN
	SW(9) <= '0';
WAIT;
END PROCESS t_prcs_SW_9;
-- SW[8]
t_prcs_SW_8: PROCESS
BEGIN
	SW(8) <= '1';
WAIT;
END PROCESS t_prcs_SW_8;
-- SW[7]
t_prcs_SW_7: PROCESS
BEGIN
	SW(7) <= '0';
WAIT;
END PROCESS t_prcs_SW_7;
-- SW[6]
t_prcs_SW_6: PROCESS
BEGIN
	SW(6) <= '1';
WAIT;
END PROCESS t_prcs_SW_6;
-- SW[5]
t_prcs_SW_5: PROCESS
BEGIN
	SW(5) <= '0';
WAIT;
END PROCESS t_prcs_SW_5;
-- SW[4]
t_prcs_SW_4: PROCESS
BEGIN
	SW(4) <= '0';
WAIT;
END PROCESS t_prcs_SW_4;
-- SW[3]
t_prcs_SW_3: PROCESS
BEGIN
	SW(3) <= '0';
WAIT;
END PROCESS t_prcs_SW_3;
-- SW[2]
t_prcs_SW_2: PROCESS
BEGIN
	SW(2) <= '0';
WAIT;
END PROCESS t_prcs_SW_2;
-- SW[1]
t_prcs_SW_1: PROCESS
BEGIN
	SW(1) <= '0';
WAIT;
END PROCESS t_prcs_SW_1;
-- SW[0]
t_prcs_SW_0: PROCESS
BEGIN
	SW(0) <= '1';
WAIT;
END PROCESS t_prcs_SW_0;
END hmpsoc_TopLevel_arch;
