ORG 0100H
.DATA 
MS DW "ENTER A HEX DIGIT: $"
MSS DW "IN DECIMAL IS IT $" 
MMS DW "DO YOU WANT TO DO IT AGAIN? $"
MMSS DW "ILLEGAL CHARACTER - ENTER 0 .. 9 OR A .. F: $"
X DB ?
A DW "10$"
B DW "11$"
C DW "12$"
D DW "13$"
E DW "14$"
F DW "15$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
AGAIN:    
    MOV AH,9
    LEA DX,MS
    INT 21H
    JMP INPUT
INVALID:
    MOV AH,9
    LEA DX,MMSS
    INT 21H
INPUT:
    MOV AH,1
    INT 21H
    
    MOV X,AL
    ;NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    
    ;COMPARE
    CMP X,'9'
    JG ALPHA
    CMP X,'0'
    JL INVALID
    
    MOV AH,9
    LEA DX,MSS
    INT 21H
    

    ;OUTPUT
    MOV AH,2
    MOV DL,X
    INT 21H
    JMP TERMINAL
ALPHA:
    CMP X,'A'
    JL INVALID
    CMP X,'F'
    JG INVALID
    
    MOV AH,9
    LEA DX,MSS
    INT 21H 
LETTER:
    CMP X,'A'
    JZ AA
    CMP X,'B'
    JZ BB
    CMP X,'C'
    JZ CC
    CMP X,'D'
    JZ DD
    CMP X,'E'
    JZ EE
    CMP X,'F'
    JZ FF
AA:
    MOV AH,9
    LEA DX,A
    INT 21H
    JMP TERMINAL
BB:
    MOV AH,9
    LEA DX,B
    INT 21H
    JMP TERMINAL
CC:
    MOV AH,9
    LEA DX,C
    INT 21H
    JMP TERMINAL
DD:
    MOV AH,9
    LEA DX,D
    INT 21H
    JMP TERMINAL
EE:
    MOV AH,9
    LEA DX,E
    INT 21H
    JMP TERMINAL
FF:
    MOV AH,9
    LEA DX,F
    INT 21H    
TERMINAL:
    ;NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
        
    MOV AH,9
    LEA DX,MMS
    INT 21H
    
    MOV AH,1
    INT 21H
    
    
    MOV X,AL
    
    ;NEW LINE
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
            
    CMP X,'Y'
    JZ AGAIN
    CMP X,'y'
    JZ AGAIN        
    
    
SKIP:
    MOV AX,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
