ORG 0100H
.DATA 
X DB ?
Y DB ?
Z1 DB ?
Z2 DB ?
O1 DW 'Z=X+Y IS: $'
O2 DW 'Z=X-Y+1 IS: $'
O3 DW 'INPUT X: $'
O4 DW 'INPUT Y: $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX, O3
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV X,AL
    SUB X,'0'
            
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H        
            
    MOV AH,9
    LEA DX,O4
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV Y,AL
    SUB Y,'0'
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV AH,9
    LEA DX, O1
    INT 21H 
            
    XOR AL,AL 
    ADD AL,X 
    ADD AL,Y        
    MOV Z1,AL
    
    MOV AH,2
    MOV DL,Z1
    ADD DL,'0'
    INT 21H    
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV AH,9
    LEA DX, O2
    INT 21H 
    
    MOV AL,X
    SUB AL,Y
    INC AL
    MOV Z2,AL
    ADD Z2,'0'
    
    MOV AH,2
    MOV DL,Z2
    INT 21H
        
    MAIN ENDP
END MAIN
RET
