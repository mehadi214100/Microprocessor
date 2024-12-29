ORG 0100H
.DATA
A DW ?
B DW ?
C DW ?
AM DW 'VALUE OF A: $'
BM DW 'VALUE OF B: $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    ;A MSG
    MOV AH,9
    LEA DX,AM
    INT 21H
    ;A INPUT
    ;FAST BX=0
    XOR BX,BX
INPUT_LOOP:
    ;CHAR INPUT
    MOV AH,1
    INT 21H
    ;IF\N\R,STOP TAKING INPUT
    CMP AL,10
    JE END_INPUT_LOOP
    CMP AL,13
    JE END_INPUT_LOOP
    ;FAST CHAR TO DIGIT
    ;ALSO CLEARS AH
    AND AX,000FH
    ;SAVE AX
    MOV CX,AX
    ;BX=BX*10+AX
    MOV AX,10
    MUL BX
    ADD AX,CX
    MOV BX,AX
    JMP INPUT_LOOP    
END_INPUT_LOOP:
    MOV A,BX
    ;NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    ;B MSG
    MOV AH,9
    LEA DX,BM
    INT 21H
    ;B INPUT
   ;FAST BX=0
    XOR BX,BX
INPUT_LOOP2:
    ;CHAR INPUT
    MOV AH,1
    INT 21H
    ;IF\N\R,STOP TAKING INPUT
    CMP AL,10
    JE END_INPUT_LOOP2
    CMP AL,13
    JE END_INPUT_LOOP2
    ;FAST CHAR TO DIGIT
    ;ALSO CLEARS AH
    AND AX,000FH      
    ;SAVE AX
    MOV CX,AX
    ;BX=BX*10+AX
    MOV AX,10
    MUL BX
    ADD AX,CX
    MOV BX,AX
    JMP INPUT_LOOP2    
END_INPUT_LOOP2:
    MOV B,BX

    MOV AX,5
    MOV BX,A
    IMUL BX
    SUB AX,7
    MOV A,AX
    
    MOV AX,A
    SUB AX,B
    MOV BX,B
    SUB BX,10
    IMUL BX
    MOV B,AX
    
    MAIN ENDP
END MAIN
RET