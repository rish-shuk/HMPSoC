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
-- Generated on "06/04/2024 17:59:38"
                                                             
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
SIGNAL compAddr : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DPCR_v : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL send_addr : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL send_data : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT hmpsoc_TopLevel
	PORT (
	CLOCK2_50 : IN STD_LOGIC;
	CLOCK3_50 : IN STD_LOGIC;
	CLOCK_50 : IN STD_LOGIC;
	compAddr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	DPCR_v : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	send_addr : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	send_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
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
	compAddr => compAddr,
	DPCR_v => DPCR_v,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	KEY => KEY,
	LEDR => LEDR,
	send_addr => send_addr,
	send_data => send_data,
	SW => SW
	);
END hmpsoc_TopLevel_arch;
