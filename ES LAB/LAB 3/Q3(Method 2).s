	
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

	LDR R0, =NUM1
	LDR R1, =NUM2
	LDR R8, =RES
	LDR R0,[R0]
	LDR R1, [R1]
	MOV R2, #1
LOOP
	MUL R3, R0, R2
	B MOD
MOD
	CMP R3, R1
	BLO LESS
	SUB R3, R3, R1
	B MOD 
LESS
	MOV R4, R3
	B COMPARE
COMPARE
	CMP R4, #0
	BEQ DONE
	BNE INCREMENT
INCREMENT
	ADD R2, R2, #1
	B LOOP
DONE
	MUL R5, R0, R2
	STR R5, [R8]

STOP
	B STOP
NUM1 DCD 0X0000000C
NUM2 DCD 0X00000009
	AREA mydata, DATA , READWRITE
RES DCD 0
	END
