	
	;source and destination blocks are overlapping
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
	LDR R0, =SRC ; loads address of src in r0
	ADD R0 , #36; offsetting the address by 36 bytes 
	LDR R1, =SRC ; loads address of src in r1
	ADD R1 , #48;  offsetting the address by 48 bytes
	MOV R2 , #10 ; initiate loop counter 
LOOP ; start the loop
	LDR R3 , [R0] , #-4; loads a word from memory at the address pointed to by R0 into register R3, then decrements R0 by 4.
	STR R3 , [R1] , #-4 ; stores a word in r3 and decrements by 4
	SUBS R2, R2, #1 ; decrements the loop counter by 1 and updates condition flags
	BNE LOOP  ;branches if r2=0

STOP 
	B STOP
SRC DCD 1,2,3,4,5,6,7,8,9,10,0,0,0
	END
