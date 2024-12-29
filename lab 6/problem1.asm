;214097
ORG 0100H
.DATA
input_string DB 'WE aRE DUET STuDeNTs',0Dh,0Ah,'$'
MSG DB 'No small letters$'
firstletter DB 0
lastletter DB 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9H 
    LEA DX,input_string
    INT 21H
           
    MOV SI,0
    MOV CX,0
    MOV AL,'$'
    
FIND_FIRST:
    MOV AL,input_string[SI] 
    CMP AL,'$'
    JE CHECK_LAST
    
    CMP AL,'a'
    JL SKIP_FIRST
    CMP AL,'z'
    JG SKIP_FIRST
    MOV firstletter,AL
    JMP FIND_LAST
    
SKIP_FIRST:
    INC SI
    JMP FIND_FIRST
    
FIND_LAST:
    MOV AL,input_string[SI]
    CMP AL,'$'
    JE DISPLAY_RESULT
    CMP AL,'a'
    JL SKIP_LAST
    CMP AL,'z'
    JG SKIP_LAST
    MOV lastletter,AL
    
SKIP_LAST:
    INC SI
    JMP FIND_LAST     
CHECK_LAST:
    CMP firstletter,0
    JE NO_SMALL 
    
DISPLAY_RESULT: 
    MOV AH,02H
    MOV DL,firstletter
    INT 21H
    
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV DL,lastletter
    INT 21H
    
    JMP RETURN
    
NO_SMALL:
    MOV AH,09H
    LEA DX,MSG
    INT 21H
RETURN:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
