; SUM OF N NUMBERS USING MLA
	AREA RESET , DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN 
	AREA mycode, CODE, READONLY
	ENTRY 
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =SRC
	LDR R1, [R0]
	MOV R2, #1
LOOP
	MLA R4, R2, R1, R4
	SUBS R1,R1,#1
	BNE LOOP

STOP
	B STOP
SRC DCD 10
	END
