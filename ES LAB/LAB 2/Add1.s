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
	LDR R6 , =RES
	LDR R2 ,[R0] 
	LDR R3, [R1]
	SUBS R4, R1 , R0
	STR R4, [R6]
STOP 
	B STOP
NUM1 DCD 0x123456
NUM2 DCD 0x654321
	AREA mydata, DATA , READWRITE
RES DCD 0
	END
