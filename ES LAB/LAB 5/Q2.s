	
	
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
	
	LDR R0, =NUM
	LDR R0, [R0]
	BL FACTORIAL
STOP
	B STOP
FACTORIAL
	PUSH {R1, LR}
	MOV R1, R0
	CMP R0 , #0
	BNE LOOP
	MOV R0, #1
	B LAST 
	
LOOP
	SUB R0, R0, #1
	BL FACTORIAL
	MOV R2, R1
	MUL R0 , R0 , R2
	
LAST 
	POP{R1, LR}
	BX LR
	
NUM DCD 5	
	END 
