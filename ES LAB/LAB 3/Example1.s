	; MULTIPLY TWO 32 BIT NUMBERS
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
	
	LDR R0 , =NUM1
	LDR R1, =NUM2
	LDR R2 , [R0]
	LDR R3, [R1]
	LDR R8  , =RES
	MUL R5, R0, R1
	STR R5 , [R8]
	
STOP 
	B STOP
NUM1 DCD 0x00000002
NUM2 DCD 0x00005000
	AREA mydata, DATA , READWRITE
RES DCD 0
	END
