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
-- Generated on "06/01/2024 12:09:33"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          RecopTopLevel
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RecopTopLevel_vhd_vec_tst IS
END RecopTopLevel_vhd_vec_tst;
ARCHITECTURE RecopTopLevel_arch OF RecopTopLevel_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ALU_Result : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL ALUClrZFlag : STD_LOGIC;
SIGNAL ALUOP : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL ALUZFlag : STD_LOGIC;
SIGNAL AM : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL conf_addr : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DMLoad : STD_LOGIC;
SIGNAL DMOut : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL DPCR : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DPCRLoad : STD_LOGIC;
SIGNAL FSMState : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Func : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL IR_RX : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL IR_RZ : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL IRHalfSel : STD_LOGIC;
SIGNAL IRLoad : STD_LOGIC;
SIGNAL LED_ADDR : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LED_ID : STD_LOGIC_VECTOR(9 DOWNTO 5);
SIGNAL OP : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL Op1Load : STD_LOGIC;
SIGNAL Op1Sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Op2Load : STD_LOGIC;
SIGNAL Op2Sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL OP_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL OP_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL PC : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL PCLoad : STD_LOGIC;
SIGNAL PCMuxSel : STD_LOGIC;
SIGNAL PM_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL REG_RX : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL REG_RZ : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL RFInputSel : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL RFLoad : STD_LOGIC;
SIGNAL SIP : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SIP_R : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SOP : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SOPLoad : STD_LOGIC;
COMPONENT RecopTopLevel
	PORT (
	ALU_Result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	ALUClrZFlag : OUT STD_LOGIC;
	ALUOP : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	ALUZFlag : OUT STD_LOGIC;
	AM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	clk : IN STD_LOGIC;
	conf_addr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	DMLoad : OUT STD_LOGIC;
	DMOut : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	DPCR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	DPCRLoad : OUT STD_LOGIC;
	FSMState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Func : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	IR_RX : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	IR_RZ : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	IRHalfSel : OUT STD_LOGIC;
	IRLoad : OUT STD_LOGIC;
	LED_ADDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	LED_ID : OUT STD_LOGIC_VECTOR(9 DOWNTO 5);
	OP : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	Op1Load : OUT STD_LOGIC;
	Op1Sel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	Op2Load : OUT STD_LOGIC;
	Op2Sel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	OP_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	OP_2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	PC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	PCLoad : OUT STD_LOGIC;
	PCMuxSel : OUT STD_LOGIC;
	PM_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	REG_RX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	REG_RZ : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	reset : IN STD_LOGIC;
	RFInputSel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	RFLoad : OUT STD_LOGIC;
	SIP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIP_R : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SOP : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SOPLoad : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : RecopTopLevel
	PORT MAP (
-- list connections between master ports and signals
	ALU_Result => ALU_Result,
	ALUClrZFlag => ALUClrZFlag,
	ALUOP => ALUOP,
	ALUZFlag => ALUZFlag,
	AM => AM,
	clk => clk,
	conf_addr => conf_addr,
	DMLoad => DMLoad,
	DMOut => DMOut,
	DPCR => DPCR,
	DPCRLoad => DPCRLoad,
	FSMState => FSMState,
	Func => Func,
	IR_RX => IR_RX,
	IR_RZ => IR_RZ,
	IRHalfSel => IRHalfSel,
	IRLoad => IRLoad,
	LED_ADDR => LED_ADDR,
	LED_ID => LED_ID,
	OP => OP,
	Op1Load => Op1Load,
	Op1Sel => Op1Sel,
	Op2Load => Op2Load,
	Op2Sel => Op2Sel,
	OP_1 => OP_1,
	OP_2 => OP_2,
	PC => PC,
	PCLoad => PCLoad,
	PCMuxSel => PCMuxSel,
	PM_OUT => PM_OUT,
	REG_RX => REG_RX,
	REG_RZ => REG_RZ,
	reset => reset,
	RFInputSel => RFInputSel,
	RFLoad => RFLoad,
	SIP => SIP,
	SIP_R => SIP_R,
	SOP => SOP,
	SOPLoad => SOPLoad
	);
-- SIP[15]
t_prcs_SIP_15: PROCESS
BEGIN
LOOP
	SIP(15) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_15;
-- SIP[14]
t_prcs_SIP_14: PROCESS
BEGIN
LOOP
	SIP(14) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_14;
-- SIP[13]
t_prcs_SIP_13: PROCESS
BEGIN
LOOP
	SIP(13) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_13;
-- SIP[12]
t_prcs_SIP_12: PROCESS
BEGIN
LOOP
	SIP(12) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_12;
-- SIP[11]
t_prcs_SIP_11: PROCESS
BEGIN
LOOP
	SIP(11) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_11;
-- SIP[10]
t_prcs_SIP_10: PROCESS
BEGIN
LOOP
	SIP(10) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_10;
-- SIP[9]
t_prcs_SIP_9: PROCESS
BEGIN
LOOP
	SIP(9) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_9;
-- SIP[8]
t_prcs_SIP_8: PROCESS
BEGIN
LOOP
	SIP(8) <= '0';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_8;
-- SIP[7]
t_prcs_SIP_7: PROCESS
BEGIN
LOOP
	SIP(7) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_7;
-- SIP[6]
t_prcs_SIP_6: PROCESS
BEGIN
LOOP
	SIP(6) <= '0';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_6;
-- SIP[5]
t_prcs_SIP_5: PROCESS
BEGIN
LOOP
	SIP(5) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_5;
-- SIP[4]
t_prcs_SIP_4: PROCESS
BEGIN
LOOP
	SIP(4) <= '0';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_4;
-- SIP[3]
t_prcs_SIP_3: PROCESS
BEGIN
LOOP
	SIP(3) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_3;
-- SIP[2]
t_prcs_SIP_2: PROCESS
BEGIN
LOOP
	SIP(2) <= '1';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_2;
-- SIP[1]
t_prcs_SIP_1: PROCESS
BEGIN
LOOP
	SIP(1) <= '0';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_1;
-- SIP[0]
t_prcs_SIP_0: PROCESS
BEGIN
LOOP
	SIP(0) <= '0';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SIP_0;

-- reset
t_prcs_reset: PROCESS
BEGIN
LOOP
	reset <= '0';
	WAIT FOR 530000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_reset;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	clk <= '0';
	WAIT FOR 10000 ps;
	IF (NOW >= 530000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
END RecopTopLevel_arch;