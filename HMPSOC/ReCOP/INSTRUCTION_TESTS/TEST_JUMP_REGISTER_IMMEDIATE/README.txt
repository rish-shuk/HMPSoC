This is a test for the JMP register and immediate instructions.

The assembly code is:

================
start			JMP TESTJ	; JUMP TO TESTJ (3)
			NOOP
TESTJ			NOOP
			JMP R3		; JUMP TO 0
			NOOP
ENDPROG
END
================

To run this test, copy the .mif file to the .\RECOP folder, and rename the .mif to "PROGRAM.mif". Then on the quartus project, if the project has already been compiled, update the MIF file for the PC_ROM by going to 'Processing > Update Memory Initialization File' in the toolbar. Then, open the TopLevel_Waveform.vwf and go to 'Simulation > Run Functional Simulation' in the toolbar to run the simulation.

The resulting output has already been provided in a .vwf file in this directory.