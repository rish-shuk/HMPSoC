This is a test for the AND immediate instruction.

The assembly code is:

================
start			NOOP 			; PROGRAM START
			LDR R3 #51		; LOAD 51 INTO R3
			AND R4 R3 #223	        ; AND 51 WITH 223 (SHOULD BE HEX 13)
			SSOP R4			; SSOP R4
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.