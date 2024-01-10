;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Assembly program to find minimum and maximum elements in a given array of   ;;
;;   size 10 each 8-bits starting from [SI] to [SI + 9]                          ;;
;;   Author : Muhammed Shoeib                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


CODE SEGMENT
    ORG 0000H
  
  
   
START: 



 
; Initiailize 10 elements in the memory from [SI] to [SI + 9]
MOV SI, 7080H           ; SI(Source Index Reg.)
MOV BP, SI              ; Save offset address of the start in BP(Base Pointer Reg.)
MOV [SI], 9
MOV [SI + 1], 0
MOV [SI + 2], 8
MOV [SI + 3], 1
MOV [SI + 4], 7
MOV [SI + 5], 2
MOV [SI + 6], 6
MOV [SI + 7], 3
MOV [SI + 8], 5
MOV [SI + 9], 4



 
 
CALL print
CALL newline
MOV SI, BP    
 



 
MOV AL, [SI]    ; store max element
MOV BL, [SI]    ; store min element
MOV CX, 10
again:
      CMP AL, [SI]
      JAE noexchange1
      MOV AL, [SI]
       
      noexchange1: 
      CMP BL, [SI]
      JBE noexchange2
      MOV BL, [SI]
      
      noexchange2:
      INC SI
      LOOP again
 
 
               


MOV DL, AL
ADD DL, 48
MOV AH, 02H
INT 21H


CALL newline


MOV DL, BL
ADD DL, 48
MOV AH, 02H
INT 21H






 
 

JMP exit 
 
 
; Subroutine to print the elements
print:
    MOV CX, 10
    label1:
        MOV DL, [SI]
        ADD DL, 48
        MOV AH, 02H
        INT 21H    
        INC SI
        
        MOV DL, ' '  
        MOV AH, 02H
        INT 21H
    
        Loop label1
     
    RET    
   




; Sub routine to print a new line
newline:
    MOV DL, 13 
    MOV AH, 02H
    INT 21H
    
    MOV DL, 10 
    MOV AH, 02H
    INT 21H
    RET

  

exit:    
    CODE ENDS
    END

      
     