ORG 0100H
.DATA 
N DB ?
RESULT DB ?
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
    ADD DL,BL
    INC BL
    LOOP TOP
    
    
SKIP:
    MOV RESULT,DL
    MOV AX,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
