ORG 0100H                              
.DATA 
RESULT DB ?
N DB ?
SIGN DB ?
COPY DB ?
STR DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV N,AL
    SUB N,48
    
    MOV CL,N
    MOV SIGN,-1
    MOV COPY,-1
    MOV STR,1
    
TOP:
    MOV AL,STR
    MUL SIGN
    ADD RESULT,AL
    MOV AL,STR
    ADD AL,1
    MOV STR,AL
    MOV AL,SIGN
    MUL COPY
    MOV SIGN,AL
    LOOP TOP
    
    ;RETURN:
    MOV AX,4CH
    INT 21H 
    MAIN ENDP
END MAIN