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
                        DATACALL R4 R5 ; Send Config to NOC												22
                        AND R7 R2 #768; pass windowsize to nios- check sel for avg/ cor 1100x"000"      23
                        SUB R7 #256 ; CHECK FOR AVG CONFIG                                              24
                        SZ send_avg_windowsize; jump to send windowsize                                 25
                        SUB R7 #512 ; CHECK FOR COR CONFIG                                              26,27
                        SZ send_cor_windowsize; jump to send cor windowsize                             28
send_disable_packet     AND R4 R4 #32767 ; AND R6 "0111111111111111"                                    29,30                              
                        DATACALL R4 R5 ; Disables tdma_min port, but still shows params                 31
                        JMP initialise_dc ; restart the process										    32,33
send_avg_windowsize     LDR R8 #49184 ; top half of dpcr is id 1100000000100000  avg ws- check bit 23   34,35
                        DATACALL R8 R5 ; send COR params to nios                                        36
                        JMP send_disable_packet                                                         37,38
send_cor_windowsize     LDR R8 #49312 ; top half of dpcr is id 1100000010100000  cor ws- check bit 23   39,40
                        DATACALL R8 R5; send avg params to nios                                         41
                        JMP send_disable_packet                                                         42,43

ENDPROG
END
