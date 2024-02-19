	; 2 DIGIT BCD TO HEX
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	
	LDR R0, =NUM
	LDR R1, [R0]
	AND R2, R1, #0X0F
	AND R3, R1, #0XF0
	LSR R3, #4
	MOV R4, #10
	MLA R5, R3, R4, R2
	LDR R6, =RESULT
	STR R5, [R6]
	
NUM DCD 0x91
	AREA data, DATA, READWRITE
RESULT DCD 0
	END
