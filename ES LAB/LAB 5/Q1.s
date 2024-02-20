	
	; SELECTION SORT
	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
	DCD  0x10001000     ; stack pointer value when stack is empty
    DCD  Reset_Handler  ; reset vector
  
    ALIGN

	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0 , =ARR
	MOV R1, #0 ; R1 = OUTER LOOP COUNTER
OUTER
	CMP R1,#5
	BEQ DONE
	MOV R2, R1 
	ADD R2, R2, #1 ; R2 = INNER LOOP COUNTER
	MOV R3, R1 ; INDEX MARKER
INNER
	LDR R4, [R0, R3, LSL #2]
	LDR R5, [R0, R2 , LSL #2]
	CMP R4, R5
	CMPGT R4, R5
	MOVGT R3, R2
	ADD R2, R2 , #1
	CMP R2, #6
	BNE INNER
	
	LDR R4, [R0, R1, LSL #2]
	LDR R5, [R0, R3 , LSL #2]
	STR R5, [R0 , R1, LSL #2]
	STR R4, [R0 , R3, LSL #2]
	ADD R1, R1, #1
	B OUTER
DONE 
STOP 
	B STOP

	AREA mydata, DATA, READWRITE
ARR DCD 5,7,2,9,11,69		
	END 
