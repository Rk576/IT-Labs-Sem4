; 2 DIGIT HEX TO BCD
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
	
	LDR R0 , =NUM
	LDR R0, [R0]
	MOV R1, #10
	MOV R2, #8
LOOP
	UDIV R3, R0,R1
	MLS R4, R1, R3, R0
	ADD R5, R4
	ROR R5, #4
	MOV R0 , R3
	SUBS R2, #01
	BNE LOOP
	LDR R8, =RESULT
	STR R5, [R8]
STOP
	B STOP
NUM DCD 0X112
	AREA data, DATA, READWRITE
RESULT DCD 0
	END
