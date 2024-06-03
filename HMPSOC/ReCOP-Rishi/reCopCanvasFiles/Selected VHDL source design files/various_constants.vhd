-- Zoran Salcic

library ieee;
use ieee.std_logic_1164.all;
use work.recop_types.all;

package various_constants is
	-- ALU operation selection alu_sel
	constant alu_add: bit_3 := "000";
	constant alu_sub: bit_3 := "001";
	constant alu_and: bit_3 := "010";
	constant alu_or: bit_3 := "011";
	constant alu_pass_op1: bit_3 := "100";
	constant alu_pass_op2: bit_3 := "101";
	constant alu_idle: bit_3 := "110";
	-- NOT USED
	-- constant alu_max: bit_3 := "111";

	-- OPReg operand selection
	constant alu_no_val : bit_3 := "000";
	constant alu_rx : bit_3 := "001";
	constant alu_rz : bit_3 := "010";
	constant alu_func : bit_3 := "011";
	constant alu_pc : bit_3 := "100";

	-- regFile rz selection
	constant rf_func : bit_3 := "000";
	constant rf_dprr : bit_3 := "001";
	constant rf_alu_out : bit_3 := "011";
	constant rf_rz_max : bit_3 := "100";
	constant rf_sip_hold : bit_3 := "101";
	constant rf_er_temp : bit_3 := "110";
	constant rf_dm_out : bit_3 := "111";
	constant rf_zero : bit_3 := "010";

	-- pc mux
	constant pc_p1 : bit_1 := '0';
	constant pc_op1 : bit_1 := '1';
end various_constants;	
