; data memory:

; SW CONFIG
; TOP HALF OF CONFIG MESSAGE
; BOTTOM  HALF OF CONFIG MESSAGE
; SW CONFIG
; TOP HALF OF CONFIG MESSAG
; EBOTTOM HALF OF CONFIG MESSAGE


start NOOP ;starting the program
initialise_dc           LDR R1 #0 ;data memory counter 
load_sw                 LSIP R2
                        LDR R3 R1 ; load data memory at dc
                        SUB R2 R3 ; compare physical switches to data memory switch case
                        SZ $10 ; jump to load_config_packet if match found
                        ADD R1 R1 #3 ; increment dc
                        SUB R1 #69 ; restart the process if we have covered all switch cases
                        SZ initialise_dc ; 
                        JMP load_sw  ; load the next switchc case using incremented dc
load_config_packet      ADD R4 R1 #1 ; get addrss od top and bottom half of config
                        ADD R5 R1 #2
                        LDR R4 R4 ; load top & bottom half of config from DM
                        LDR R5 R5
                        DATACALL R5 R4 ; Send Config to NOC
                        JMP initialise_dc ; restart the proccess

ENDPROG
END
