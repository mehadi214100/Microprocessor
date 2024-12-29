ORG 0100H
.DATA 
C DB ?
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV C,AL
    
    CMP C,'Z'
    JLE CAPITAL
    
    SUB C,32
    JMP OUTPUT
    
CAPITAL:
    ADD C,32
    
OUTPUT:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,2
    MOV DL,C
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
RET