org 100h      ; Starting address for .COMorg 100h
.data
va db "1st Number: $"
vb DB "2nd Number: $"
vc DB "3nd Number: $" 
res DB 'Largest number is: $'

.code
MAIN PROC
    MOV AX, @DATA
    MOV DX, AX 
    
    ;1st input
    MOV AH, 9
    MOV DX, OFFSET va
    INT 21h
    MOV AH, 1
    INT 21h
    MOV BX, AX
    
    ;print newline
    MOV AH, 2 
    MOV DL, 0DH 
    INT 21h
    MOV DL, 0AH 
    INT 21h

    
    ;2nd input
    MOV AH, 9
    MOV DX, OFFSET vb
    INT 21h
    MOV AH, 1
    INT 21h
    MOV CX, AX
    
    ;print newline
    MOV AH, 2 
    MOV DL, 0DH 
    INT 21h
    MOV DL, 0AH 
    INT 21h
    
    ;Compare 1st and 2nd Input
    CMP CX, BX
    JG Below
    MOV CX, BX
    
Below: 
    ;3rd input
    MOV AH, 9
    MOV DX, OFFSET vc
    INT 21h
    MOV AH, 1 
    INT 21h
    
    ;Comnpare 3rd Input
    CMP CX, AX
    JG largest 
    MOV CX, AX
    
largest:
    ;print newline
    MOV AH, 2 
    MOV DL, 0DH 
    INT 21h
    MOV DL, 0AH 
    INT 21h
    
    ;Output Results
    MOV AH, 9
    MOV DX, OFFSET res
    INT 21h
    
    MOV AH, 2 
    MOV DX, CX
    INT 21h
    
    mov AX, 4C00h        
    int 21h


MAIN ENDP

END MAIN
