org 100h
.data
vax db 'Value of AX: $'
vbx DB 'Value of BX: $'
res DB 'Largest number is or CX: $'
.code
MAIN    PROC
    MOV AX, @DATA
    MOV DX, AX
    MOV AH, 9
    MOV DX, OFFSET vbx 
    INT 21h
    
    MOV AH, 1       ;1st input
    INT 21h
    MOV BX, AX
    
    MOV AH, 2 
    MOV DL, 0DH 
    INT 21h
    MOV DL, 0AH 
    INT 21h
            
    MOV AH, 9
    MOV DX, OFFSET vax 
    INT 21h
    
    MOV AH, 1       ;2nd input
    INT 21h
    MOV CX, AX
    
    CMP CX, BX      ;compare two below
    JG Below 
    MOV CX, BX
    
Below:
    MOV AH, 2 
    MOV DL, 0DH 
    INT 21h
    MOV DL, 0AH 
    INT 21h

    MOV AH, 9
    MOV DX, OFFSET res 
    INT 21h
    
    
    MOV AH, 2
    MOV DX, CX
    INT 21h
    
    
MAIN ENDP
    END MAIN