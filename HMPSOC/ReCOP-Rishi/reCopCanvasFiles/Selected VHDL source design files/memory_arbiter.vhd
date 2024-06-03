-- Zoran Salcic

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;


entity memory_arbiter is
	port (
		--Signals from master
		master_address : in bit_16;	--Master address to read/write
		master_data :	in bit_16;		--Master data to write
		master_we : in bit_1;			--Master write enable bit
		master_en : in bit_1;			--Master enable bit, used by the master to control the memory
		
		--Signals from recop
		recop_address : in bit_16;		--Recop address
		recop_data : in bit_16;			--Recop data
		recop_we : in bit_1;				--Recop write enable
		recop_grant : out bit_1;		--Recop grant signal, indicates the recop has access to the memory
		
		--Signals to memory
		memory_address : out bit_16;	--Memory address to read/write
		memory_data : out bit_16;		--Memory data to write
		memory_we : out bit_1;			--Memory write enable bit
	
		clk	: in bit_1;					--Clock input
		reset : in bit_1					--Reset input (doesn't do much as this is largely combinational logic)
	);
end memory_arbiter;

architecture behaviour of memory_arbiter is

begin

	update: process(clk,reset)
	begin
	
		if(reset='1') then		--To reset, set WE low so no data is written, set the address and data to 0
	
			memory_we <= '0';		--TODO: check that we is active high
			memory_address <= "0000000000000000";
			memory_data <= "0000000000000000";
			recop_grant <= '0';
	
		elsif( RISING_EDGE(clk)) then
		
			if( master_en = '1' ) then	--If the master wishes to use it, pass through the master signals
				memory_we <= master_we;
				memory_address <= master_address;
				memory_data <= master_data;
				recop_grant <= '0';			--Indicate to the Recop that it doesn't have control
			else
				memory_we <= recop_we;		--Else, pass the recop signals to the memory
				memory_address <= recop_address;
				memory_data <= recop_data;
				recop_grant <= '1';			--And let it know
			end if;
		
		end if;
		
	end process update;
	
	

end behaviour;
