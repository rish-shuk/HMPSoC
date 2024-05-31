library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.opcodes.all;
use work.various_constants.all;

entity ControlUnit is
	port(
		clk: in std_logic;
		reset: in std_logic;
		AM: in std_logic_vector(1 downto 0);
		OP: in std_logic_vector(5 downto 0);
		ALU_Z_FLAG: in std_logic; 
		PCMuxSel: out std_logic;
		PCLoad: out std_logic;
		IRHalfSel: out std_logic;
		IRLoad: out std_logic;
		RFInputSel: out std_logic_vector(2 downto 0);
		RFLoad: out std_logic;
		Op1Sel: out std_logic_vector(2 downto 0);
		Op2Sel: out std_logic_vector(2 downto 0);
		Op1Load: out std_logic;
		Op2Load: out std_logic;
		ALUOP: out std_logic_vector(2 downto 0);
		ALU_CLR_Z_FLAG: out std_logic;
		DMLoad: out std_logic;
		DPCRLoad: out std_logic;
		SOPLoad: out std_logic;
		state: out std_logic_vector(3 downto 0)
		);
end entity ControlUnit;

architecture ctrlunit of ControlUnit is
	type cuStates is (IDLE, FetchUpper, FetchLower, Decode, Execute, Writeback);
	signal currentState : cuStates := IDLE;
	signal nextState : cuStates;

begin
	SWITCH_STATES : process(clk, reset) is
	begin
		if (reset = '1') then
			currentState <= IDLE;
		elsif rising_edge(clk) then
			currentState <= nextState;
		end if;
	end process;

	OUTPUTS : process(currentState, AM, OP, ALU_Z_FLAG) is
	begin
		case(currentState) is
			when IDLE =>
				-- FETCH SIGNALS
				PCMuxSel <= '0';
				PCLoad <= '0';
				IRLoad <= '0';
				IRHalfSel <= '0';

				-- DECODE SIGNALS
				Op1Load <= '0';
				Op2Load <= '0';
				Op1Sel <= alu_no_val;
				Op2Sel <= alu_no_val;
				ALU_CLR_Z_FLAG <= '0';

				-- EXECUTE SIGNALS
				ALUOP <= alu_idle;
				DMLoad <= '0';

				-- WRITE BACK SIGNALS
				RFLoad <= '0';
				RFInputSel <= rf_zero;
				SOPLoad <= '0';
				DPCRLoad <= '0';
		
				nextState <= FetchUpper;

			when FetchUpper =>
				-- FETCH SIGNALS
				PCMuxSel <= '0';
				PCLoad <= '1';
				IRLoad <= '1';
				IRHalfSel <= '1';

				-- DECODE SIGNALS
				Op1Load <= '0';
				Op2Load <= '0';
				Op1Sel <= alu_no_val;
				Op2Sel <= alu_no_val;
				ALU_CLR_Z_FLAG <= '0';

				-- EXECUTE SIGNALS
				ALUOP <= alu_idle;
				DMLoad <= '0';

				-- WRITE BACK SIGNALS
				RFLoad <= '0';
				RFInputSel <= rf_zero;
				SOPLoad <= '0';
				DPCRLoad <= '0';

				nextState <= FetchLower;

			when FetchLower =>
				-- FETCH SIGNALS
				PCMuxSel <= '0';
				case(AM) is	
					when am_immediate =>
						PCLoad <= '1';
						IRLoad <= '1';
					when am_direct =>
						PCLoad <= '1';
						IRLoad <= '1';
					-- register, inherent, sotp loading of next instruction
					when others =>
						PCLoad <= '0';
						IRLoad <= '0';
				end case;
				IRHalfSel <= '0';

				-- DECODE SIGNALS
				Op1Load <= '0';
				Op2Load <= '0';
				Op1Sel <= alu_no_val;
				Op2Sel <= alu_no_val;
				ALU_CLR_Z_FLAG <= '0';

				-- EXECUTE SIGNALS
				ALUOP <= alu_idle;
				DMLoad <= '0';

				-- WRITE BACK SIGNALS
				RFLoad <= '0';
				RFInputSel <= rf_zero;
				SOPLoad <= '0';
				DPCRLoad <= '0';
				
				nextState <= Decode;
				
			when Decode =>
				-- FETCH SIGNALS
				PCMuxSel <= '0';
				PCLoad <= '0';
				IRLoad <= '0';
				IRHalfSel <= '0';
				
				-- DECODE SIGNALS
				-- Load op regs ot be ready to be exevuted in execute state (maybe do conditionally)
				Op1Load <= '1';
				Op2Load <= '1';
				Op1Sel <= alu_no_val;
				Op2Sel <= alu_no_val;
				ALU_CLR_Z_FLAG <= '0';

				-- EXECUTE SIGNALS
				ALUOP <= alu_idle;
				DMLoad <= '0';

				-- WRITE BACK SIGNALS
				RFLoad <= '0';
				RFInputSel <= rf_zero;
				SOPLoad <= '0';
				DPCRLoad <= '0';

				-- ### !!!!! TODO: set RFINPUT !!!!! ###

				case(OP) is
					when andr =>
						case(AM) is
							when (am_immediate) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_func;
							when (am_register) =>
								Op1Sel <= alu_rz;
								Op2Sel <= alu_rx;
							when others =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_no_val;
						end case;
					when orr =>
						case(AM) is
							when (am_immediate) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_func;
							when (am_register) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_rz;
							when others =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_no_val;
						end case;
					when addr =>
						case(AM) is
							when (am_immediate) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_func;
							when (am_register) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_rz;
							when others =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_no_val;
						end case;
					when subvr =>			
							Op1Sel <= alu_func;
							Op2Sel <= alu_rx;
					when subr =>
						case(AM) is
							when (am_immediate) =>
								Op1Sel <= alu_func;
								Op2Sel <= alu_rz;
							when (am_register) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_rz;
							when others =>
								Op1Sel <= alu_func;
								Op2Sel <= alu_rz;
						end case;
					when ldr =>
					-- Sort out ldr and sw in ALU, i.e no operation should be performed, vlaue should jsut go through alu
						case(AM) is
							-- Direct instructions: Rz <- immideate
							when (am_immediate) =>
								Op1Sel <= alu_func;
								Op2Sel <= alu_no_val;
							-- Direct instructions: Rz <- DM[Immediate]
							when (am_direct) =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_func;
							-- Direct instructions: Rz <- DM[Rx] 
							when (am_register) =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_rx;
							when others =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_no_val;
						end case;
					when str =>
						case(AM) is
							when (am_immediate) =>
								Op1Sel <= alu_func;
								Op2Sel <= alu_rz;
							when (am_direct) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_func;
							when (am_register) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_rz;
							when others =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_no_val;
						end case;
					when jmp =>
						case(AM) is
							when (am_immediate) =>
								Op1Sel <= alu_func;
								Op2Sel <= alu_no_val;
							when (am_register) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_no_val;
							when others =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_no_val;
						end case;
					-- Branch isntruction
					when present =>
						Op1Sel <= alu_func;
						Op2Sel <= alu_rz;
					when datacall =>
						-- Data will go straight from regfile tor registers
						case(AM) is
							when (am_immediate) =>
								Op1Sel <= alu_rx;
								Op2Sel <= alu_func;
							when (am_register) =>
								Op1Sel <= alu_rz;
								Op2Sel <= alu_rx;
							when others =>
								Op1Sel <= alu_no_val;
								Op2Sel <= alu_no_val;
						end case;
					when sz =>
						Op1Sel <= alu_func;		
						-- DM[operand] <- PC;
					when strpc =>
						Op1Sel <= alu_pc;
						Op2Sel <= alu_func;
					when clfz =>
						ALU_CLR_Z_FLAG <= '1';
					when lsip =>
						Op1Sel <= alu_no_val;
						Op2Sel <= alu_no_val;
					when ssop =>
						Op1Sel <= alu_rx;
						Op2Sel <= alu_no_val;
					when noop =>
						Op1Load <= '0';
						Op2Load <= '0';
					when others =>
						-- do nothing
				end case;

				nextState <= Execute;

			when Execute =>
				-- FETCH SIGNALS
				PCMuxSel <= '0';
				PCLoad <= '0';
				IRLoad <= '0';
				IRHalfSel <= '0';

				-- DECODE SIGNALS
				Op1Load <= '0';
				Op2Load <= '0';
				Op1Sel <= alu_no_val;
				Op2Sel <= alu_no_val;
				ALU_CLR_Z_FLAG <= '0';
				
				-- EXECUTE SIGNALS
				ALUOP <= alu_idle;
				DMLoad <= '0';

				-- WRITE BACK SIGNALS
				RFLoad <= '0';
				RFInputSel <= rf_zero;
				SOPLoad <= '0';
				DPCRLoad <= '0';

				case(OP) is
					when andr =>
						ALUOP <= alu_and;
					when orr =>
						ALUOP <= alu_or;
					when addr =>
						ALUOP <= alu_add;
					when subvr =>
						ALUOP <= alu_sub;
					when subr =>
						ALUOP <= alu_sub;
					when ldr =>
						DMLoad <= '0';
					when str =>
						DMLoad <= '1';	
					when jmp =>
						PCMuxSel <= pc_op1;
						PCLoad <= '1';
					-- If a value you give Rz is 0 branch
					when present =>
						ALUOP <= ALU_pass_op2;						
					when datacall =>
					when strpc =>
						DMLoad <= '1';		
					when sz =>
					-- TODO: IMPLEMENT after registers
					when clfz =>
					when lsip =>
					when ssop =>
					-- TODO: IMPLEMENT after registers
					when noop =>
					when others =>
				end case;

				nextState <= WriteBack;
			
			When WriteBack =>
				-- FETCH SIGNALS
				PCMuxSel <= '0';
				PCLoad <= '0';
				IRLoad <= '0';
				IRHalfSel <= '0';
				
				-- DECODE SIGNALS
				Op1Load <= '0';
				Op2Load <= '0';
				Op1Sel <= alu_no_val;
				Op2Sel <= alu_no_val;
				ALU_CLR_Z_FLAG <= '0';

				-- EXECUTE SIGNALS
				ALUOP <= alu_idle;
				DMLoad <= '0';

				-- WRITE BACK SIGNALS
				RFLoad <= '0';
				RFInputSel <= rf_zero;
				SOPLoad <= '0';
				DPCRLoad <= '0';

				case(OP) is
					when andr =>
						RFInputSel <= rf_alu_out;
						RFLoad <= '1';
					when orr =>
						RFInputSel <= rf_alu_out;
						RFLoad <= '1';
					when addr =>
						RFInputSel <= rf_alu_out;
						RFLoad <= '1';
					when subvr =>
						RFInputSel <= rf_alu_out;
						RFLoad <= '1';
					when subr =>
						RFInputSel <= rf_alu_out;
						RFLoad <= '1';
					when ldr =>
						RFLoad <= '1';
						case(AM) is
							-- Direct instructions: Rz <- immideate
							when (am_immediate) =>
								RFInputSel <= rf_func;
							-- Direct instructions: Rz <- DM[Immediate]
							when (am_direct) =>
								RFInputSel <= rf_dm_out;
							-- Direct instructions: Rz <- DM[Rx] 
							when (am_register) =>
								RFInputSel <= rf_dm_out;	
							when others =>
								RFInputSel <= rf_zero;
								RFLoad <= '0';
						end case;
					when str =>
						-- No WB stage			
					when jmp =>
						-- TODO: IMPLEMENT after
					when present =>
						if (ALU_Z_FLAG = '1') then
							PCMuxSel <= pc_op1;
							PCLoad <= '1';
						end if;
						-- TODO: DETERMINE IF THIS SHOULD BE CLEARED OR NOT
						ALU_CLR_Z_FLAG <= '1';
					when datacall =>
						DPCRLoad <= '1';
					when strpc =>
						-- No WB stage	
					-- USer calls SZ operation when they need to branch after conditional	
					when sz =>
						if (ALU_Z_FLAG = '1') then
							PCMuxSel <= pc_op1;
							PCLoad <= '1';
						end if;
					when clfz =>
						-- TODO: IMPLEMENT after
					when lsip =>
						RFInputSel <= rf_sip_hold;
						RFLoad <= '1';
					when ssop =>
						SOPLoad <= '1';
					when noop =>
						RFLoad <= '0';
						RFInputSel <= rf_zero;
					when others =>
						RFLoad <= '0';
						RFInputSel <= rf_zero;
				end case;
			
				nextState <= FetchUpper;				
			
				-- REMOVE WHEN ALL STATES ARE DEFINED
			When others =>
				-- FETCH SIGNALS
				PCMuxSel <= '0';
				PCLoad <= '0';
				IRLoad <= '0';
				IRHalfSel <= '0';
				
				-- DECODE SIGNALS
				Op1Load <= '0';
				Op2Load <= '0';
				Op1Sel <= alu_no_val;
				Op2Sel <= alu_no_val;
				ALU_CLR_Z_FLAG <= '0';

				-- EXECUTE SIGNALS
				ALUOP <= alu_idle;
				DMLoad <= '0';

				-- WRITE BACK SIGNALS
				RFLoad <= '0';
				RFInputSel <= rf_zero;
				SOPLoad <= '0';
				DPCRLoad <= '0';
				
				nextState <= IDLE;

		end case;
	end process;

	with currentState select state <=
		x"0" when IDLE,
		x"1" when FetchUpper,
		x"2" when FetchLower,
		x"3" when Decode,
		x"4" when Execute,
		x"5" when Writeback;

end architecture;