	; LCM OF TWO 32 BIT NUMBERS (LCM = a*b/GCD(a,b) )
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
	LDR R6, [R0]
	LDR R7, [R1]
	LDR R2, [R0]
	LDR R3, [R1]
L1
	CMP R2, R3
	BEQ L2
	SUBHI R2, R2, R3
	SUBLO R3, R3, R2
	CMP R2, #0
	CMP R3, #0
	B L1
L2	MUL R4, R6, R7
	SDIV R5, R4, R2
	STR R5, [R8]

STOP
	B STOP
NUM1 DCD 0X0000000C
NUM2 DCD 0X00000009
	AREA mydata, DATA , READWRITE
RES DCD 0
	END
