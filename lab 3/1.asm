ORG 0100H
.DATA
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
      
    MOV AH,2  
    MOV DL,0
    MOV CL,100
PRINT:
    INT 21H 
    INC DL
    LOOP PRINT
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
RET