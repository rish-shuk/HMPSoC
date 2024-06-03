-- Zoran Salcic

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;
use work.various_constants.all;


entity alu is
	port (
		clk				: in bit_1;
		reset 			: in bit_1;
		-- flag control signal
		clr_z_flag		: in bit_1;
		-- operands
		OP1				: in bit_16;
		OP2				: in bit_16;
		-- ALU operation selection
		alu_operation	: in bit_3;
		alu_carry		: in bit_1;  --WARNING: carry in currently is not used
		alu_result		: out bit_16 := X"0000";
		z_flag			: out bit_1
	);
end alu;

architecture combined of alu is
	signal result		: bit_16;
	signal prev_result : bit_16;
begin
	-- perform ALU operation
	alu: process (alu_operation, OP1, OP2, prev_result)
	begin
		case alu_operation is
			when alu_add =>
				result <= OP2 + OP1;
			when alu_sub =>
				result <= OP2 - OP1;
			when alu_and =>
				result <= OP2 and OP1;
			when alu_or =>
				result <= OP2 or OP1;
			when alu_pass_op1 =>
				result <= OP1;
			when alu_pass_op2 =>
				result <= OP2;
			when alu_idle =>
				result <= prev_result;
			when others =>
				result <= X"0000";
		end case;
	end process alu;
	alu_result <= result;

	-- zero flag
	z1gen: process (clk, reset)
	begin
		if reset = '1' then
			z_flag <= '0';
		elsif rising_edge(clk) then
			prev_result <= result;
			if clr_z_flag = '1' then
				z_flag <= '0';
			-- if alu is working (operation is valid)
			elsif alu_operation /= alu_idle then
				if result = X"0000" then
					z_flag <= '1';
				else
					z_flag <= '0';
				end if;
			end if;
		end if;
	end process z1gen;

end combined;
