                                                                   ORG 0100H
.DATA 
N DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,1
    INT 21H
             
    MOV N,AL
    SUB N,48
    MOV CL,N
    
    JCXZ SKIP
    MOV BX,1
    MOV DX,0
    
TOP:
    MOV AL,BL
    MUL BL
    ADD DL,AL
    INC BL
    LOOP TOP
    
    
SKIP:
    MOV AX,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
