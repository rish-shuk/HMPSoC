This is a test for the STR direct and LDR direct instructions.

The assembly code is:

================
start			LDR R3 #255		; LOAD 255 (HEX FF) INTO R3
			STR R3 $2		; STORE 255 INTO DM[2]
			LDR R4 $2		; LOAD DM[2] (2554, HEX FF) INTO R4
			SSOP R4 		; SSOP R4
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.