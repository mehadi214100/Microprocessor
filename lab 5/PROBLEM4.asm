ORG 0100H
.DATA
M DW 'AL = $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;MSG
    MOV AH,9
    LEA DX,M
    INT 21H
    
    MOV CL,8
    MOV AL,55H
    MOV BL,AL
AGAIN:     
    ROL BL,1
    JC ONE
    MOV DL,'0'
    JMP DISPLAY
ONE:
    MOV DL,'1' 
DISPLAY:
    MOV AH,2
    INT 21H
    DEC CL
    JNZ AGAIN
    
    MAIN ENDP
END MAIN
RET