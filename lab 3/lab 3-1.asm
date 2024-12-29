TITLE PGM6_1:
.MODEL
.STACK
.CODE
MAIN    PROC
    MOV AH, 2
    MOV CX, 256
    MOV DL, 0
PRINT_LOOP:
    INT 21h
    INC DL 
    DEC CX
    JNZ PRINT_LOOP
    MOV AH, 4CH
    INT 21h
    
    
MAIN ENDP
    END MAIN