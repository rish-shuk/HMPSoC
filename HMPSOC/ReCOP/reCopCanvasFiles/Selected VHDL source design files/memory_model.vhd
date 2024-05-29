-- Zoran Salcic

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.recop_types.all;
use work.various_constants.all;
use work.opcodes.all;

entity memory_model is
	port (
		clk: in bit_1 := '0';
		--pm_rd: in bit_1 := '0';
		pm_address: in bit_16 := X"0000";
		pm_outdata: out bit_16 := X"0000";
		
		--dm_rd: in bit_1 := '0';
		dm_address: in bit_16 := X"0000";
		dm_outdata: out bit_16 := X"0000";
		
		dm_wr: in bit_1 := '0';
		dm_indata: in bit_16 := X"0000"
		
		);
end memory_model;

architecture beh of memory_model is
	type memory_array is array (31 downto 0) of bit_16;
	signal memory: memory_array:=(X"abcd",
	X"0000",
	X"0000",
	X"0000",
	X"0000",
	X"0000",
	X"0000",
	X"0000",
	X"0000",
	X"0000",
	--X"0000",
	--X"0002",
	--am_immediate&present&X"d"&X"d",
	--X"0000",
	--am_immediate&andr&X"d"&X"d",
	--X"0002",
	--am_immediate&present&X"d"&X"d",
	--am_register&ldr&X"0"&X"9",
	--X"0006",
	--am_direct&str&X"c"&X"3",
	--am_register&ldr&X"0"&X"c",
	--am_register&str&X"c"&X"c",
	--am_register&ldr&X"0"&X"7",
	--X"aaaa",
	--am_immediate&str&X"7"&X"7",
	-- X"0002",
	-- am_immediate&sz&X"0"&X"0",
	-- am_inherent&clfz&X"0"&X"0",
	-- X"0000",
	-- am_immediate&andr&X"d"&X"d",
	-- X"0002",
	-- am_immediate&sz&X"b"&X"b",
	-- am_register&datacall&X"b"&X"b",
	-- X"1234",
	-- am_immediate&datacall&X"b"&X"b",	
	-- X"001f",
	--am_direct&ldr&X"6"&X"7",
	--X"0015",
	--am_direct&ldr&X"0"&X"0",
	--X"0015",
	--am_direct&strpc&X"0"&X"0",
	--X"0001",
	--am_immediate&max&X"c"&X"c",
	--am_register&ssop&X"4"&X"4",
	--am_register&lsip&X"4"&X"4",
	--am_register&ssvop&X"3"&X"3",
	--am_inherent&cer&X"0"&X"0",
	--am_inherent&ceot&X"0"&X"0",
	--am_inherent&seot&X"0"&X"0",
	--am_register&ler&X"3"&X"3",
	X"0008",
	am_immediate&ldr&X"e"&X"e",
	--X"400a",							    -- (AM)01  -- (OP)000100  -- (RZ)0001  -- (RX)1000  -- (FUNC)400A
	--am_immediate&subr&X"1"&X"8",		
	--am_register&orr&X"2"&X"a",			-- (AM)11  -- (OP)001100  -- (RZ)0010  -- (RX)1010  -- (FUNC)N/A
	--am_register&addr&X"5"&X"2",	    	-- (AM)11  -- (OP)111000  -- (RZ)0101  -- (RX)0010  -- (FUNC)N/A
	--X"000b",                    			-- (AM)01  -- (OP)001000  -- (RZ)0000  -- (RX)0000  -- (FUNC)000B
	--am_immediate&andr&X"0"&X"0"
	--X"0007",
	-- JUMP TO VALUE IN REG[2] (6)
	--am_register&jmp&X"0"&X"2",
	--am_register&addr&X"2"&X"2",
	
	-- SUB REG[4] (1) with 0 (0), NO STORE
	--X"0000",
	--am_immediate&subr&X"4"&X"0",

	-- CLEAR ZERO FLAG
	--am_inherent&clfz&X"0"&X"0",

	-- SUB REG[4] (1) with 1 (0), NO STORE
	X"0001",
	am_immediate&subr&X"4"&X"0",
		
	-- SUB REG[1] (2) with 1, STORE (1) INTO REG[4]
	--X"0001",
	--am_immediate&subvr&X"4"&X"1",
	
	-- AND REG[2] (3{0011}) with 2{0010}, STORE (2{0010}) INTO REG[3]
	X"0002",
	am_immediate&andr&X"3"&X"2",
	
	-- ADD REG[2] with REG[2] STORE (6) INTO REG[3]
	--am_register&addr&X"2"&X"2",
	
	-- ADD 1 with REG[1] STORE (3) INTO REG[2]
	X"0001",							-- (AM)01  -- (OP)111000  -- (RZ)0010  -- (RX)0001  -- (FUNC)0000
	am_immediate&addr&X"2"&X"1",

	--AND REG[2] (0008) with REG[1] (000A), STORE (1000) into REG[1]
	--am_register&andr&X"1"&X"2",
	
	-- OR REG[2] (000E) with 0003, STORE (B) INTO REG[5]
	--X"0003",
	--am_immediate&orr&X"5"&X"2",

	-- OR REG[2] (0005) with 0F08, STORE (0F0D) INTO REG[5]
	X"0F08",
	am_immediate&orr&X"5"&X"2",

	-- OR REG[2] (0006) with REG[1] (000A), STORE (E) into REG[2]
	--am_register&orr&X"2"&X"1",

	-- ADD REG[2] (0006) with REG[F] (001F), STORE (25) into REG[2]
	--am_register&addr&X"2"&X"F",

	-- OR REG[2] (6) with REG[3] (A), STORE (E) into REG[2]
	--am_register&orr&X"2"&X"3",

	-- OR REG[5] (6) with 3, STORE (7) INTO REG[2]
	--X"0003",
	--am_immediate&orr&X"2"&X"5",

	-- OR REG[5] (3) with 5, STORE (7) INTO REG[2]
	--X"0005",
	--am_immediate&orr&X"2"&X"5",

	-- LOAD DM[3] (6) into REG[5]
	--X"0003",
	--am_direct&ldr&X"5"&X"0",

	-- LOAD DM[3] (3) into REG[5]
	--X"0003",
	--am_direct&ldr&X"5"&X"0",
	
	-- STORE REG[1] (6) into DM[REG[2] (3)]
	--am_register&str&X"2"&X"1",

	-- STORE REG[2] (3) into DM[3]
	--X"0003",
	--am_direct&str&X"0"&X"2",

	-- LOAD REG[2] with 0003
	--X"0003",
	--am_immediate&ldr&X"2"&X"0",

	-- OR REG[5] (0) with 5, STORE (5) INTO REG[2]
	X"0005",
	am_immediate&orr&X"2"&X"5",

	-- JUMP TO pc = 2
	X"0009",
	am_immediate&jmp&X"0"&X"0",

	-- IF REG[1] is = 0, jump to pc = 8
	--X"0008",
	--am_immediate&present&X"1"&X"0",

	-- IF ZERO FLAG IS SET, JUMP TO pc = 8
	--X"0008",
	--am_immediate&sz&X"0"&X"0",
	
	-- SUBTRACT REG[1] (2) - 1, STORE (1 INTO REG [1])
	--X"0001",
	--am_immediate&subvr&X"1"&X"1",

	--X"FAFB",
	--am_immediate&datacall&X"0"&X"C",

	-- LOAD REG[C] with CD10
	--X"CD10",
	--am_immediate&ldr&X"C"&X"0",

	-- LOAD REG[A] with 89AB
	--X"89AB",
	--am_immediate&ldr&X"A"&X"0"

	-- LOAD REG[1] with 0002
	--X"0002",
	--am_immediate&ldr&X"1"&X"0"

	-- LOAD DM[31] (000A) into REG[1]
	--am_register&ldr&X"1"&X"F",			-- (AM)11  -- (OP)000000  -- (RZ)0001  -- (RX)1111  -- (FUNC)N/A
	
	-- LOAD DM[31] (A) into REG[3]
	--X"001F",
	--am_direct&ldr&X"3"&X"0",

	-- LOAD A INTO DM[31]
	--X"000A",                    		-- (AM)01  -- (OP)000010  -- (RZ)1111  -- (RX)0000  -- (FUNC)000A
	--am_immediate&str&X"F"&X"0",
	
	-- LOAD REG[F] WITH 31
	--X"001F",							-- (AM)01  -- (OP)000000  -- (RZ)1111  -- (RX)0000  -- (FUNC)001F
	--am_immediate&ldr&X"F"&X"0"
	--am_register&ssop&X"0"&X"9",
	--am_register&lsip&X"9"&X"0",
	--am_inherent&noop&X"0"&X"0"
	X"FA04",
	X"001F",
	X"8040",
	X"0029",
	X"4210",
	X"001F",
	X"4010",
	X"3400"
	);

begin
	-- process (clk)
	-- begin
		-- if rising_edge(clk) then
			-- if pm_rd = '1' then
				-- pm_data <= memory(to_integer(unsigned(pm_address)));
			-- end if;
			-- if dm_rd = '1' then
				-- dm_data <= memory(to_integer(unsigned(dm_address)));
			-- end if;
		-- end if;
	-- end process;
	process (clk)
	begin
		if falling_edge(clk) then
			if dm_wr = '1' then
				memory(to_integer(unsigned(dm_address)))<= dm_indata;
			end if;
		end if;
	end process;
	
	process (clk)
	begin
		if falling_edge(clk) then
			pm_outdata <= memory(to_integer(unsigned(pm_address)));
			dm_outdata <= memory(to_integer(unsigned(dm_address)));
		end if;
	end process;

	
end beh;
