This is a test for the STR immediate and LDR direct instructions.

The assembly code is:

================
start			LDR R3 #15		; PROGRAM START : LOAD 151 INTO R3
			LDR R8 #5828		; LOAD 5828 INTO R8
			STR R8 #15		; STORE 15 INTO DM[5828]
			LDR R9 $16C4 		; LOAD DM[5828] (15, HEX F) INTO R9
			SSOP R9			; SSOP R9
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.