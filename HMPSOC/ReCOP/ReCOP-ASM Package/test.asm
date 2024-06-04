; data memory:

; SW CONFIG
; TOP HALF OF CONFIG MESSAGE
; BOTTOM  HALF OF CONFIG MESSAGE
; SW CONFIG
; TOP HALF OF CONFIG MESSAG
; EBOTTOM HALF OF CONFIG MESSAGE


start                   NOOP ; starting the program                                                     0
initialise_dc           LDR R1 #142 ; data memory counter                                               1,2
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
                        AND R6 R2 #768; check for avg or cor SW CONFIG and with 0000011000000000 	    23,24
                        SUB R6 #768; if peak detector sw (bit 9 = 1, bit 8 = 1)                         25,26
                        SZ initialise_dc; go back to beginning if found pd sw                           27,28
                        SUB R6 #256; check for avg packet 0000001000000000                              29,30
                        SZ send_avg_ws; send to nios                                                    31,32
                        SUB R6 #512; check for cor packet 0000010000000000                              33,34
                        SZ send_cor_ws; send to nios                                                    35.36
                        JMP initialise_dc ; restart the process										    37,38
send_avg_ws             LDR R7 #49152;  load 1100000000000000                                           39,40
                        DATACALL R7 R5; send params to NOC (addr 7)                                     41,42
                        JMP initialise_dc;                                                              43,44
send_cor_ws             LDR R7 #49280; load 1100000010000000                                            45,46
                        DATACALL R7 R5; send params to NOC (addr 7)                                     47,48
                        JMP initialise_dc;                                                              49,50
ENDPROG
END
