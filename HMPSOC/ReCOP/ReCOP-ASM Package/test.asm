; data memory:

; SW CONFIG
; TOP HALF OF CONFIG MESSAGE
; BOTTOM  HALF OF CONFIG MESSAGE
; SW CONFIG
; TOP HALF OF CONFIG MESSAG
; EBOTTOM HALF OF CONFIG MESSAGE


start                   NOOP ; starting the program                                                     0
initialise_dc           LDR R1 #52 ; data memory counter                                                1,2
load_sw                 LSIP R2   ;                                                                     3                                                                              
                        LDR R3 R1 ; load data memory at dc                                              4
                        SUB R2 R3 ; compare physical switches to data memory switch case                5
                        SZ $10 ; jump to load_config_packet if match found (hex 16)                     6,7
                        ADD R1 R1 #3 ; increment dc                                                     8,9
                        SUB R1 #205 ; restart the process if we have covered all switch cases			10,11
                        SZ initialise_dc ; 																12,13
                        JMP load_sw  ; load the next switch case using incremented dc					14,15
load_config_packet      ADD R4 R1 #1 ; get address of top and bottom half of config						16,17
                        ADD R5 R1 #2 ;																	18,19
                        LDR R4 R4 ; load top & bottom half of config from DM							20
                        LDR R5 R5 ;																		21
                        DATACALL R4 R5 ; Send Config to NOC                                             22
                        LDR R6 #49152; check for avg or cor packet and with 11------ 					23,24
                        SUB R6 #16384; check for avg packet 01                                          25,26
                        SZ send_avg_ws; send to nios                                                    27,28
                        SUB R6 #32768; check for cor packet 10                                          29,30
                        SZ send_cor_ws; send to nios                                                    31,32
                        JMP initialise_dc ; restart the process										    33,34
send_avg_ws             LDR R7 #49152;  load 1100000000000000                                           35,36
                        DATACALL R7 R5; send params to NOC (addr 7)                                     37,38
                        JMP initialise_dc;                                                              39,40
send_cor_ws             LDR R7 #49216; load 1100000010000000                                            41,42
                        DATACALL R7 R5; send params to NOC (addr 7)                                     43,44
                        JMP initialise_dc;                                                              45,46
ENDPROG
END
