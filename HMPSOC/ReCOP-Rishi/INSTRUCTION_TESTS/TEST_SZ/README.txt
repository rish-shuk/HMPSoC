This is a test for the SZ immediate instruction.

The assembly code is:

================
start			LDR R3 #15			; LOAD 51 INTO R3
			SUBV R3 R3 #14			; LOAD 15 - 14 (1) INTO R3
			SZ $0				; JUMP TO 0 IF Z FLAG IS SET (SHOULD NOT JUMP)
			SUBV R3 R3 #1			; LOAD 1 - 1 (0) INTO R3 (Z FLAG IS SET)
			SZ $0				; JUMP TO 0 IF Z FLAG IS SET (SHOULD JUMP)
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.