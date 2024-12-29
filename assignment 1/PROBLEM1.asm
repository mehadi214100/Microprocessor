ORG 0100H
.DATA 
A DB ?
B DB ?
C DB ? 
TEMP DB ?
SAME DB 'All the numbers are equal$'
COMMA DB ',$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    ;INPUT
    MOV AH,1
    INT 21H
    MOV A,AL
    
    MOV AH,9
    LEA DX,COMMA
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV B,AL 
    
    MOV AH,9 
    LEA DX,COMMA
    INT 21H
    
    MOV AH,1        
    INT 21H
    MOV C,AL
    
    ;NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
            
    ;SORTING(DEC)
    MOV AL,A
    MOV BL,B
    MOV CL,C
    
    CMP AL,BL
    JL SWAP1
JAMP1:
    CMP AL,CL
    JL SWAP2
JAMP2:
    CMP BL,CL
    JL SWAP3
    JMP TERMINATE
SWAP1:
    MOV TEMP,AL
    MOV AL,BL
    MOV BL,TEMP
    JMP JAMP1 
SWAP2:
    MOV TEMP,AL
    MOV AL,CL
    MOV CL,TEMP
    JMP JAMP2
SWAP3:
    MOV TEMP,BL
    MOV BL,CL
    MOV CL,TEMP
    ;OVERWRITE
    MOV A,AL
    MOV B,BL
    MOV C,CL
TERMINATE:    
    ;CHECKING
    CMP AL,BL
    JZ EQUAL
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP RETURN       
EQUAL:  
    CMP AL,CL
    JZ OUT_MSG
    MOV AH,2
    MOV DL,CL
    INT 21H
    JMP RETURN
OUT_MSG:  
    MOV AH,9
    LEA DX,SAME
    INT 21H
    
RETURN:
    MOV AX,4CH
    INT 21H 
    MAIN ENDP
END MAIN