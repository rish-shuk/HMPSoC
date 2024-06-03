This is a test for the SUB immediate instruction.

The assembly code is:

================
start			NOOP 			; PROGRAM START
			LDR R3 #51		; LOAD 51 INTO R3
			SUB R3 #51		; SUB 51 WITH 51 (ZERO FLAG SET)
			SSOP R4			; SSOP R4
			CLFZ			; CLEAR ZERO FLAG
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.