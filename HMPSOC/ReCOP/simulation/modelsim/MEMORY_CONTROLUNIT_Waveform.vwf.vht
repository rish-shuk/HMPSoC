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
-- Generated on "05/19/2024 05:13:30"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          TopLevel
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY TopLevel_vhd_vec_tst IS
END TopLevel_vhd_vec_tst;
ARCHITECTURE TopLevel_arch OF TopLevel_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ALU_Result : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL ALUClrZFlag : STD_LOGIC;
SIGNAL ALUOP : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL ALUZFlag : STD_LOGIC;
SIGNAL AM : STD_LOGIC_VECTOR(1 DOWNTO 0);
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
SIGNAL REG_R7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL REG_RX : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL REG_RZ : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL RFInputSel : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL RFLoad : STD_LOGIC;
SIGNAL SIP : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SIP_R : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SOP : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL SOPLoad : STD_LOGIC;
SIGNAL system_clk15 : STD_LOGIC;
COMPONENT TopLevel
	PORT (
	ALU_Result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	ALUClrZFlag : OUT STD_LOGIC;
	ALUOP : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	ALUZFlag : OUT STD_LOGIC;
	AM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
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
	REG_R7 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	REG_RX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	REG_RZ : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	reset : IN STD_LOGIC;
	RFInputSel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	RFLoad : OUT STD_LOGIC;
	SIP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIP_R : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SOP : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SOPLoad : OUT STD_LOGIC;
	system_clk15 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : TopLevel
	PORT MAP (
-- list connections between master ports and signals
	ALU_Result => ALU_Result,
	ALUClrZFlag => ALUClrZFlag,
	ALUOP => ALUOP,
	ALUZFlag => ALUZFlag,
	AM => AM,
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
	REG_R7 => REG_R7,
	REG_RX => REG_RX,
	REG_RZ => REG_RZ,
	reset => reset,
	RFInputSel => RFInputSel,
	RFLoad => RFLoad,
	SIP => SIP,
	SIP_R => SIP_R,
	SOP => SOP,
	SOPLoad => SOPLoad,
	system_clk15 => system_clk15
	);

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 540000 ps;
	reset <= '1';
	WAIT FOR 80000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END TopLevel_arch;
