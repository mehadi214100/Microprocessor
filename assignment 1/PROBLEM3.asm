ORG 0100H                              
.DATA 
N DW ?
AA DW 'A+$'
A DW 'A$'
B DW 'B$'
C DW 'C$'
D DW 'D$'
F DW 'F$'
MSG DW 'GRADE: $' 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
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
    MOV N,BX
    
    ;NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    ;OUTPUT 
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    ;COMPARE
    CMP BX,90
    JL GA
    LEA DX,AA
    JMP RETURN
GA:
    CMP BX,80
    JL GB
    LEA DX,A
    JMP RETURN
GB:
    CMP BX,70
    JL GC
    LEA DX,B
    JMP RETURN
GC:
    CMP BX,60
    JL GD
    LEA DX,C
    JMP RETURN
GD:
    CMP BX,50
    JL GF
    LEA DX,D
    JMP RETURN
GF:
    LEA DX,F
    
RETURN:
    MOV AH,9
    INT 21H
    MOV AX,4CH
    INT 21H 
    MAIN ENDP
END MAIN