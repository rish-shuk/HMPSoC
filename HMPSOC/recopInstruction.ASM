ldr R1 #0 ; 0-- load 0 into data counter
lsip R2; 1 ; 1 load switch and button value into register 2
ldr R3 R1 ; load switch case configuration at DataMemory[DC]
sub R2 R3 ; CHECK if lsip matches  
SZ #9 ; if LSIP = Current switch got to load the dpcr JMP IF MATCH FOUND
; if false increment data counter and get next switch
addr r1 #3
sub R1 #68; compare against how many switch cases we have, if exceed them all, note 68 cases all together
SZ #0
JMP #1

ADDR R4 R1 #1 ; increment data memory counter to get top half of the config JMP HERE
ADDR r5 r1 #2 ; incremant dta memory counter to get bottom of the config

ldr R4 R4 ;load the data memory with the top half of the config
ldr R5 R5 ;load the data memory with the bottom half of the config
datacall R5 R4; load the config packet into DPCR

jmp #0 -- will also reset the data memory counter


LDR R1 #0
LSIP R2
LDR R3 R1
SUB R2 R3
SZ #9
ADDR R1 #3
SUB R1 #69
SZ #0
JMP #1
ADDR R4 R1 #1
ADDR R5 R1 #2
LDR R4 R4
LDR R5 R5
DATACALL R5 R4
JMP #0


data memory:

SW CONFIG
TOP HALF OF CONFIG MESSAGE
BOTTOM  HALF OF CONFIG MESSAGE
SW CONFIG
TOP HALF OF CONFIG MESSAG
EBOTTOM HALF OF CONFIG MESSAGE
