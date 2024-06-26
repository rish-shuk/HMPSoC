; data memory:

; SW CONFIG
; TOP HALF OF CONFIG MESSAGE
; BOTTOM  HALF OF CONFIG MESSAGE
; SW CONFIG
; TOP HALF OF CONFIG MESSAG
; EBOTTOM HALF OF CONFIG MESSAGE


start                   NOOP ; starting the program                                                     0
initialise_dc           LDR R1 #1 ; data memory counter                                                 1,2
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
                        LDR R1 #60000    ; ABJ  23,24
                        CLFZ            ; ABJ   25
delay_loop              SUBV R1 R1 #1   ; ABJ   26,27
                        DATACALL R4 R5 ; Send Config to NOC												22
                        SZ $20          ; ABJ   31, 32
                        JMP delay_loop  ; ABJ   33,34 ;AND R4 R4 #32767 ; AND R6 "0111111111111111"                                    23,24                              ;DATACALL R4 R5 ; Disables tdma_min port, but still shows params                 25
                        JMP initialise_dc ; restart the proccess										26

ENDPROG
END
