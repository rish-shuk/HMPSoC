This is a test for the PRESENT immediate instruction.

The assembly code is:

================
start			LDR R3 #255		; LOAD 255 (HEX FF) INTO R3
testp			PRESENT R3 testp	; R3 IS NOT 0, SHOULD NOT JUMP TO testp (2)	
			PRESENT R4 start	; R4 IS 0, SHOULD JUMP TO start (0)	
			NOOP
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.