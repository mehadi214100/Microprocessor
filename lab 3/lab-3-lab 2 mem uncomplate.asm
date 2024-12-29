org 100h

.DATA
a DW ?
b DW ?
c DW 1d
va DW "Enter a Character:$"
er DW "Enter wrong character!!$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DX, AX
    
    MOV CX, 5
    
    MOV AH, 9
    MOV DX, OFFSET va 
    INT 21H
    
    MOV AH, 1
    INT 21h
    MOV AH, 0
    MOV a, AX
    MOV b, AX
    
    MOV CX, 5 
MOV AH, 2 
MOV DL, 0DH 
INT 21h
MOV DL, 0AH 
INT 21h
    
    
    ;chack lower case or not
    CMP a, 'a'
    JL itsUpper
    CMP a, 'z'
    JG Eror
    SUB a, 32
    SUB b, 32
    JMP Display1stLine

itsUpper:
    ;chack uper case or not
    CMP a, 'A'
    JL Eror
    CMP a, 'Z'
    JG Eror
    ADD a, 32
    ADD b, 32
    JMP Display1stLine_lower

move_Z:
    MOV a, 'A'
    MOV c, 0d
    JMP Display1stLine     
Display1stLine:     ;loop for print increasing order upercase
    MOV DX, a
    ADD DX, c
    
    CMP DX, 'Z'
    JG move_Z 
    
    MOV AH, 2
    INT 21H  
    
    INC c
    DEC CX
    JNZ Display1stLine  
        
MOV CX, 5
MOV c, 1d
 
MOV AH, 2 
MOV DL, 0DH 
INT 21h
MOV DL, 0AH 
INT 21h
JMP Display2ndLine
move_A:
    MOV b, 'Z'
    MOV c, 0d
    JMP Display2ndLine ;loop for print decreasing order upercase    
Display2ndLine: 
    MOV DX, b
    SUB DX, c
    
    CMP DX, 'A'
    JL move_A 
    
    MOV AH, 2
    INT 21H  
    
    INC c
    DEC CX
    JNZ Display2ndLine
JMP endprogram
  
;for lower case 
move_zz:
    MOV a, 'a'
    MOV c, 0d
    JMP Display1stLine_lower     
Display1stLine_lower:      ;loop for print increasing order lowercase
    MOV DX, a
    ADD DX, c
    
    CMP DX, 'z'
    JG move_zz 
    
    MOV AH, 2
    INT 21H  
    
    INC c
    DEC CX
    JNZ Display1stLine_lower  
        
MOV CX, 5
MOV c, 1d
 
MOV AH, 2 
MOV DL, 0DH 
INT 21h
MOV DL, 0AH 
INT 21h
JMP Display2ndLine_lower
move_aa:
    MOV b, 'z'
    MOV c, 0d
    JMP Display2ndLine_lower     
Display2ndLine_lower:      ;loop for print decreasing order lowercase
    MOV DX, b
    SUB DX, c
    
    CMP DX, 'a'
    JL move_aa 
    
    MOV AH, 2
    INT 21H  
    
    INC c
    DEC CX
    JNZ Display2ndLine_lower
    JMP endprogram
Eror: 
    MOV AH, 9
    MOV DX, OFFSET er 
    INT 21H   
endprogram:
    MOV AX, 4C00h
    INT 21h
    
    MAIN ENDP
END MAIN




