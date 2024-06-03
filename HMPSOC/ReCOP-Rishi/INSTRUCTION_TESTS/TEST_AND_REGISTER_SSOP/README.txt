This is a test for the AND register instruction.

The assembly code is:

================
start			NOOP 			; PROGRAM START
			LDR R3 #151		; LOAD 151 INTO R3
			LDR R8 #5828		; LOAD 5828 INTO R8
			AND R8 R8 R3		; AND 151 WITH 5828 INTO R8 (SHOULD BE HEX 84)
			SSOP R8			; SSOP R8
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.