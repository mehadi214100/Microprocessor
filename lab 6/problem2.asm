;214097
ORG 0100H
.DATA
SERIES DB 1,2,3,4,5,6
N DW 6 
RESULT DB 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV SI,0
    XOR AX,AX
    MOV CX,N
AGAIN:
    MOV AL,SERIES[SI]
    MUL AL
    ADD RESULT,AL
    INC SI
    LOOP AGAIN
    
    
RETURN:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
