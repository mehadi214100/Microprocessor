ORG 0100H
.DATA
C DB ?
I DB ?
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
    JMP SKIP
CAPITAL:
    ADD C,32
SKIP:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AL,C
    MOV I,AL
    MOV CX,5
INC5:
    CMP I,'Z'
    JZ RESIZE
    CMP I,'z'
    JZ RESIZE
GOBACK:
    INC I
    MOV DL,I
    INT 21H
    LOOP INC5
    JMP SKIP2
RESIZE:
    SUB I,26
    JMP GOBACK
SKIP2:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AL,C
    MOV I,AL
    MOV CX,5
DEC5:
    CMP I,'A'
    JZ RESIZE2
    CMP I,'a'
    JZ RESIZE2
GOBACK2:
    DEC I
    MOV DL,I
    INT 21H
    LOOP DEC5
    JMP RETURN
RESIZE2:
    ADD I,26
    JMP GOBACK2    
    
RETURN:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
RET