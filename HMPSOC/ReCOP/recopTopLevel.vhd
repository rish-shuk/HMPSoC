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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
-- CREATED		"Sat Jun 01 12:13:54 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY RecopTopLevel IS 
	PORT
	(
		reset :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		SIP :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		ALUZFlag :  OUT  STD_LOGIC;
		PCLoad :  OUT  STD_LOGIC;
		IRHalfSel :  OUT  STD_LOGIC;
		IRLoad :  OUT  STD_LOGIC;
		ALUClrZFlag :  OUT  STD_LOGIC;
		Op1Load :  OUT  STD_LOGIC;
		Op2Load :  OUT  STD_LOGIC;
		RFLoad :  OUT  STD_LOGIC;
		DMLoad :  OUT  STD_LOGIC;
		PCMuxSel :  OUT  STD_LOGIC;
		SOPLoad :  OUT  STD_LOGIC;
		DPCRLoad :  OUT  STD_LOGIC;
		ALU_Result :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		ALUOP :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		AM :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		conf_addr :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DMOut :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		DPCR :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		FSMState :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Func :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		IR_RX :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		IR_RZ :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		LED_ADDR :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		LED_ID :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 5);
		OP :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
		Op1Sel :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		Op2Sel :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		OP_1 :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		OP_2 :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		PC :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		PM_OUT :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		REG_RX :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		REG_RZ :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		RFInputSel :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		SIP_R :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		SOP :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END RecopTopLevel;

ARCHITECTURE bdf_type OF RecopTopLevel IS 

COMPONENT controlunit
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 ALU_Z_FLAG : IN STD_LOGIC;
		 AM : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 OP : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 PCMuxSel : OUT STD_LOGIC;
		 PCLoad : OUT STD_LOGIC;
		 IRHalfSel : OUT STD_LOGIC;
		 IRLoad : OUT STD_LOGIC;
		 RFLoad : OUT STD_LOGIC;
		 Op1Load : OUT STD_LOGIC;
		 Op2Load : OUT STD_LOGIC;
		 ALU_CLR_Z_FLAG : OUT STD_LOGIC;
		 DMLoad : OUT STD_LOGIC;
		 DPCRLoad : OUT STD_LOGIC;
		 SOPLoad : OUT STD_LOGIC;
		 ALUOP : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Op1Sel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Op2Sel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 RFInputSel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 state : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT datapath
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 IRHalfSel : IN STD_LOGIC;
		 IRLoad : IN STD_LOGIC;
		 PCLoad : IN STD_LOGIC;
		 PCMuxSel : IN STD_LOGIC;
		 DMLoad : IN STD_LOGIC;
		 ALIClrZFlag : IN STD_LOGIC;
		 RFLoad : IN STD_LOGIC;
		 OP1Load : IN STD_LOGIC;
		 DPCRLoad : IN STD_LOGIC;
		 OP2Load : IN STD_LOGIC;
		 SOPLoad : IN STD_LOGIC;
		 ALUOp : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 OP1MuxSel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 OP2MuxSel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 RFInputSelect : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 SIP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 ALUZFlag : OUT STD_LOGIC;
		 ALU_Result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Am : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 DMOut : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 DPCR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Func : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 OP : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 OP_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 OP_2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 PC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 PM_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 REG_RX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 REG_RZ : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 RX : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 RZ : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 SIP_R : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 SOP : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	ALUClrZFlag_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	ALUOP_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	ALUZFlag_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	AM_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	DMLoad_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	dpcr_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	DPCRLoad_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	IRHalfSel_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	IRLoad_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	Op1Load_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	Op1Sel_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	Op2Load_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	Op2Sel_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	OP_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	PCLoad_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	PCMuxSel_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	RFInputSel_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	RFLoad_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	SOPLoad_ALTERA_SYNTHESIZED :  STD_LOGIC;


BEGIN 
LED_ADDR <= SIP(3 DOWNTO 0);
LED_ID <= SIP(10 DOWNTO 6);



b2v_inst : controlunit
PORT MAP(clk => clk,
		 reset => reset,
		 ALU_Z_FLAG => ALUZFlag_ALTERA_SYNTHESIZED,
		 AM => AM_ALTERA_SYNTHESIZED,
		 OP => OP_ALTERA_SYNTHESIZED,
		 PCMuxSel => PCMuxSel_ALTERA_SYNTHESIZED,
		 PCLoad => PCLoad_ALTERA_SYNTHESIZED,
		 IRHalfSel => IRHalfSel_ALTERA_SYNTHESIZED,
		 IRLoad => IRLoad_ALTERA_SYNTHESIZED,
		 RFLoad => RFLoad_ALTERA_SYNTHESIZED,
		 Op1Load => Op1Load_ALTERA_SYNTHESIZED,
		 Op2Load => Op2Load_ALTERA_SYNTHESIZED,
		 ALU_CLR_Z_FLAG => ALUClrZFlag_ALTERA_SYNTHESIZED,
		 DMLoad => DMLoad_ALTERA_SYNTHESIZED,
		 DPCRLoad => DPCRLoad_ALTERA_SYNTHESIZED,
		 SOPLoad => SOPLoad_ALTERA_SYNTHESIZED,
		 ALUOP => ALUOP_ALTERA_SYNTHESIZED,
		 Op1Sel => Op1Sel_ALTERA_SYNTHESIZED,
		 Op2Sel => Op2Sel_ALTERA_SYNTHESIZED,
		 RFInputSel => RFInputSel_ALTERA_SYNTHESIZED,
		 state => FSMState);


b2v_inst_d : datapath
PORT MAP(clk => clk,
		 reset => reset,
		 IRHalfSel => IRHalfSel_ALTERA_SYNTHESIZED,
		 IRLoad => IRLoad_ALTERA_SYNTHESIZED,
		 PCLoad => PCLoad_ALTERA_SYNTHESIZED,
		 PCMuxSel => PCMuxSel_ALTERA_SYNTHESIZED,
		 DMLoad => DMLoad_ALTERA_SYNTHESIZED,
		 ALIClrZFlag => ALUClrZFlag_ALTERA_SYNTHESIZED,
		 RFLoad => RFLoad_ALTERA_SYNTHESIZED,
		 OP1Load => Op1Load_ALTERA_SYNTHESIZED,
		 DPCRLoad => DPCRLoad_ALTERA_SYNTHESIZED,
		 OP2Load => Op2Load_ALTERA_SYNTHESIZED,
		 SOPLoad => SOPLoad_ALTERA_SYNTHESIZED,
		 ALUOp => ALUOP_ALTERA_SYNTHESIZED,
		 OP1MuxSel => Op1Sel_ALTERA_SYNTHESIZED,
		 OP2MuxSel => Op2Sel_ALTERA_SYNTHESIZED,
		 RFInputSelect => RFInputSel_ALTERA_SYNTHESIZED,
		 SIP => SIP,
		 ALUZFlag => ALUZFlag_ALTERA_SYNTHESIZED,
		 ALU_Result => ALU_Result,
		 Am => AM_ALTERA_SYNTHESIZED,
		 DMOut => DMOut,
		 DPCR => dpcr_ALTERA_SYNTHESIZED,
		 Func => Func,
		 OP => OP_ALTERA_SYNTHESIZED,
		 OP_1 => OP_1,
		 OP_2 => OP_2,
		 PC => PC,
		 PM_OUT => PM_OUT,
		 REG_RX => REG_RX,
		 REG_RZ => REG_RZ,
		 RX => IR_RX,
		 RZ => IR_RZ,
		 SIP_R => SIP_R,
		 SOP => SOP);

ALUZFlag <= ALUZFlag_ALTERA_SYNTHESIZED;
PCLoad <= PCLoad_ALTERA_SYNTHESIZED;
IRHalfSel <= IRHalfSel_ALTERA_SYNTHESIZED;
IRLoad <= IRLoad_ALTERA_SYNTHESIZED;
ALUClrZFlag <= ALUClrZFlag_ALTERA_SYNTHESIZED;
Op1Load <= Op1Load_ALTERA_SYNTHESIZED;
Op2Load <= Op2Load_ALTERA_SYNTHESIZED;
RFLoad <= RFLoad_ALTERA_SYNTHESIZED;
DMLoad <= DMLoad_ALTERA_SYNTHESIZED;
PCMuxSel <= PCMuxSel_ALTERA_SYNTHESIZED;
SOPLoad <= SOPLoad_ALTERA_SYNTHESIZED;
DPCRLoad <= DPCRLoad_ALTERA_SYNTHESIZED;
ALUOP <= ALUOP_ALTERA_SYNTHESIZED;
AM <= AM_ALTERA_SYNTHESIZED;
conf_addr(3 DOWNTO 0) <= dpcr_ALTERA_SYNTHESIZED(22 DOWNTO 19);
DPCR <= dpcr_ALTERA_SYNTHESIZED;
OP <= OP_ALTERA_SYNTHESIZED;
Op1Sel <= Op1Sel_ALTERA_SYNTHESIZED;
Op2Sel <= Op2Sel_ALTERA_SYNTHESIZED;
RFInputSel <= RFInputSel_ALTERA_SYNTHESIZED;

END bdf_type;