;214097
ORG 0100H
.DATA
SERIES DB 5 DUP(?)
INMSG DW 'Enter your inputs:$'   
OUTMSG DW 'The sorted list is:$'  
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;IN MSG 
    MOV AH,9
    LEA DX,INMSG
    INT 21H 
    
    MOV CX,5
    MOV BX, OFFSET SERIES
    MOV AH,1
    
INPUT:
    INT 21H
    MOV [BX],AL
    INC BX
    LOOP INPUT
    
    MOV CX,5
    DEC CX     
OUTERLOOP:
    MOV BX,CX
    MOV SI,0
    
COMPLOOP:
    MOV AL,SERIES[SI]
    MOV DL,SERIES[SI+1]
    CMP AL,DL
    
    JC NO
    
    MOV SERIES[SI],DL
    MOV SERIES[SI+1],AL
    
NO:
    INC SI
    DEC BX
    
    JNZ COMPLOOP
    LOOP OUTERLOOP      
    
    ;NEWLINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    ;OUT MSG 
    MOV AH,9
    LEA DX,OUTMSG
    INT 21H
    
    MOV CX,5
    MOV BX,OFFSET SERIES
DISPLAY:
    MOV DL,[BX]
    MOV AH,2
    INT 21H
    
    INC BX
    LOOP DISPLAY
    
    
    MAIN ENDP
END MAIN
