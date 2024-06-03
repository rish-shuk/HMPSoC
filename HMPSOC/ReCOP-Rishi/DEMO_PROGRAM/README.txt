This is a simple demo program that will use the SIP ports of the ReCOP to read the switches and then use the SOP ports to output the status onto the corresponding LEDs.

The assembly code is:

================
start			LSIP R3
			SSOP R3
ENDPROG
END
================

The board (DE1-SOC) can be programmed with the .sof file in this directory.