

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   Assembly program to perform Bubble Sort algorithm (ascending & descending)  ;;
;;   on a given array of size 10 each 8-bits starting from [SI] to [SI + 9]      ;;
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


CALL print             ; Call a Subroutine to print the array elements 
CALL newline           ; Call a Subroutine to print a new line






    

; Bubble Sort Ascending
MOV SI, BP                  ; return SI value
MOV CL, 0                   ; counter for inner loop
MOV CH, 0                   ; counter for outer loop
InnerLoop:
          MOV AL, [SI]
          MOV BL, [SI + 1]
          CMP AL, BL
          JBE nochange 
    
          MOV [SI], BL
          MOV [SI + 1], AL 
           
          nochange:
                INC SI
                INC CL
                CMP CL, 9
                JNZ InnerLoop
                JZ OuterLoop  
                
OuterLoop:
    INC CH
    MOV SI, BP 
    MOV CL, 0
    CMP CH, 10
    JNZ InnerLoop
          
          


MOV SI, BP
CALL print          
CALL newline      
  



 
 



; Bubble Sort Descending
MOV SI, BP               
MOV CL, 0                
MOV CH, 0               

InnerLoop2:
          MOV AL, [SI]
          MOV BL, [SI + 1]
          CMP AL, BL
          JAE nochange2       
          
          MOV [SI], BL                    
          MOV [SI + 1], AL 
           
          nochange2:    
                INC SI
                INC CL
                CMP CL, 9 
                JNZ InnerLoop2
                JZ OuterLoop2    
OuterLoop2:
    INC CH
    MOV SI, BP 
    MOV CL, 0 
    CMP CH, 10
    JNZ InnerLoop2
          
          


MOV SI, BP
CALL print          
CALL newline 


 
 
 
 
 

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

      


      