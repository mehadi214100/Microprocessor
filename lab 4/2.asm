ORG 0100H
.DATA
N DW ?
RESULT DW 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H 
    XOR AH,AH
    MOV N,AX
    SUB N,'0'
   
    MOV CX,N
SUM:
    MOV AX,CX
    MUL CX
    ADD RESULT,AX
    LOOP SUM
    
RETURN:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
RET