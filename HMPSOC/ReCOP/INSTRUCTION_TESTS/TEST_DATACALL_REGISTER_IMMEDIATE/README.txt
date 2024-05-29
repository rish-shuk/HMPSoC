This is a test for the DATACALL register and immediate instructions.

The assembly code is:

================
start			LDR R3 #255		    	; LOAD 51 (HEX FF) INTO R3
			LDR R4 #409			; LOAD 51 (HEX 199) INTO R4
			DATACALL R3 R4			; LOAD 00FF0199 INTO DATACALL
			DATACALL R4 #2763		; LOAD 01990ACB INTO DATACALL
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.