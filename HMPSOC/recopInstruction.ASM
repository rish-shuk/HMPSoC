ldr R1 #0 ; 0-- load 0 into data counter
lsip R2; 1 ;  1 load switch and button value into register 2
ldr R3 R1 ; load switch case CONFIGURATION at DataMemory[DC]
sub R2 R3 ; CHECK if lsip matches  
SZ #9 ; if LSIP = Current switch got to load the dpcr
; if false increment data counter and get next switch
addr r1 #3
; compare against howmany switch cases we have, if exceed them all, then 
JMP 1

ADDR R4 R1 #1 ; increment data memory counter to get top half of the config
ADDR r5 r1 #2 ; incremant dta memory counter to get bottom of the config

ldr R4 R4 ;load the data memory with the top half of the config
ldr R5 R5 ;load the data memory with the bottom half of the config
datacall R5 R4; load the config packet into DPCR

ldr R1 #0 ;reset the data memory counter
jmp #1


data memory:

SW CONFIG
TOP HALF OF CONFIG MESSAGE
BOTTOM  HALF OF CONFIG MESSAGE
SW CONFIG
TOP HALF OF CONFIG MESSAG
EBOTTOM HALF OF CONFIG MESSAGE
