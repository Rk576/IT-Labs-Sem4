	; reversing a 32 bit number
	AREA RESET , DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000 ; STACK POINTER VALUE WHEN STACK IS EMPTY
	DCD Reset_Handler ; RESET VECTOR
	ALIGN ;aligns the next data on a word boundary, ensuring that the following data is aligned to a multiple of 4 bytes.
	AREA mycode , CODE , READONLY;defines a section named mycode which is readonly
	ENTRY 
	EXPORT Reset_Handler
Reset_Handler; start of reset handler code

	LDR R0 , =SRC
	ADD R0, #36
	LDR R1, =DST
	MOV R2, #10
LOOP
	LDR R3, [R0], #-4
	STR R3 ,[R1] ,#4
	SUBS R2, #1
	BNE LOOP
STOP
	B STOP

SRC DCD 1,2,3,4,5,6,7,8,9,10
	AREA mydata , DATA , READWRITE
DST DCD 0
	END
