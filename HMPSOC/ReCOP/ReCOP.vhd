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
-- CREATED		"Fri May 31 13:12:19 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ReCOP IS 
	PORT
	(
		CLOCK_50 :  IN  STD_LOGIC;
		KEY :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		SW :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		conf_addr :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		LEDR :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END ReCOP;

ARCHITECTURE bdf_type OF ReCOP IS 

COMPONENT toplevel
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 SIP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 PCMuxSel : OUT STD_LOGIC;
		 PCLoad : OUT STD_LOGIC;
		 IRHalfSel : OUT STD_LOGIC;
		 IRLoad : OUT STD_LOGIC;
		 RFLoad : OUT STD_LOGIC;
		 ALUZFlag : OUT STD_LOGIC;
		 Op1Load : OUT STD_LOGIC;
		 Op2Load : OUT STD_LOGIC;
		 ALUClrZFlag : OUT STD_LOGIC;
		 DMLoad : OUT STD_LOGIC;
		 DPCRLoad : OUT STD_LOGIC;
		 SOPLoad : OUT STD_LOGIC;
		 ALU_Result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 ALUOP : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 AM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 DMOut : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 DPCR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 FSMState : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Func : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 IR_RX : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 IR_RZ : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 OP : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 Op1Sel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Op2Sel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 OP_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 OP_2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 PC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 PM_OUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 REG_RX : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 REG_RZ : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 RFInputSel : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 SIP_R : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 SOP : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	dpcr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SIP :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= NOT(KEY(0));






b2v_ReCOP : toplevel
PORT MAP(clk => CLOCK_50,
		 reset => SYNTHESIZED_WIRE_0,
		 SIP => SIP,
		 DPCR => dpcr);

conf_addr(3 DOWNTO 0) <= dpcr(22 DOWNTO 19);
LEDR(9 DOWNTO 0) <= dpcr(31 DOWNTO 22);

SIP(12 DOWNTO 10) <= KEY(3 DOWNTO 1);
SIP(9 DOWNTO 0) <= SW;
SIP(13) <= '0';
SIP(15) <= '0';
SIP(14) <= '0';
END bdf_type;