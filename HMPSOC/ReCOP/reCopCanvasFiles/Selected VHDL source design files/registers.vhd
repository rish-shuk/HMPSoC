-- Zoran Salcic

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

-- various registers of recop
entity registers is
    port (
		clk : in bit_1;
		reset : in bit_1;
		dpcr: out bit_32;
		OP1 : in bit_16;
		OP2 : in bit_16;
		ir_operand : in bit_16;
		dpcr_lsb_sel : in bit_1;
		dpcr_wr : in bit_1;
		-- environment ready and set and clear signals
		er: out bit_1;
		er_wr : in bit_1;
		er_clr : in bit_1;
		-- end of thread and set and clear signals
		eot: out bit_1;
		eot_wr : in bit_1;
		eot_clr : in bit_1;
		-- svop and write enable signal
		svop : out bit_16;
		svop_wr : in bit_1;
		-- sip souce and registered outputs
		sip_r : out bit_16;
		sip : in bit_16;
		-- sop and write enable signal
		sop : out bit_16;
		sop_wr : in bit_1;
		-- dprr, irq (dprr(1)) set and clear signals and result source and write enable signal
		dprr :out bit_2;
		irq_wr:in bit_1;
		irq_clr:in bit_1;
		result_wen: in bit_1;
		result :in bit_1
		);
end registers;

architecture beh of registers is

  begin
	-- dpcr
	process (clk, reset)
	begin
		if reset = '1' then
			dpcr <= X"00000000";
		elsif rising_edge(clk) then 
			if dpcr_wr = '1' then
				dpcr <= OP1 & OP2;
			end if;
		end if;
	end process;
	
	-- er
	process (clk, reset)
	begin
		if reset = '1' then
			er <= '0';
		elsif rising_edge(clk) then 
			-- set or clear er
			if er_wr = '1' then
				er <= '1';
			elsif er_clr = '1' then
				er <= '0';
			end if;
		end if;
	end process;
	
	-- eot
	process (clk, reset)
	begin
		if reset = '1' then
			eot <= '0';
		elsif rising_edge(clk) then 
			-- set or clear eot
			if eot_wr = '1' then
				eot <= '1';
			elsif eot_clr = '1' then
				eot <= '0';
			end if;
		end if;
	end process;
	
	-- svop
	process (clk, reset)
	begin
		if reset = '1' then
			svop <= X"0000";
		elsif rising_edge(clk) then 
			if svop_wr = '1' then
				-- write Rx into SVOP upon write signal 
				svop <= OP1;
			end if;
		end if;
	end process;
	
	-- sip
	process (clk, reset)
	begin
		if reset = '1' then
			sip_r <= X"0000";
		elsif rising_edge(clk) then 
		-- register the sip signal with the system's clock
			sip_r <= sip;
		end if;
	end process;
	
	-- sop
	process (clk, reset)
	begin
		if reset = '1' then
			sop <= X"0000";
		elsif rising_edge(clk) then 
			if sop_wr = '1' then
				-- write Rx into SOP upon write signal 
				sop <= OP1;
			end if;
		end if;
	end process;
	
	-- dprr: result
	process (clk, reset)
	begin
		if reset = '1' then
			dprr(0) <= '0';
		elsif rising_edge(clk) then 
			if result_wen = '1' then
				-- write result upon write signal 
				dprr(0) <= result;
			end if;
		end if;
	end process;
	-- dprr: irq
	process (clk, reset)
	begin
		if reset = '1' then
			dprr(1) <= '1';
		elsif rising_edge(clk) then 
			-- set or clear irq according to control signal
			if irq_wr = '1' then
				dprr(1) <= '1';
			elsif irq_clr ='1' then
				dprr(1) <= '0';
			end if;
		end if;
	end process;	
end beh;
