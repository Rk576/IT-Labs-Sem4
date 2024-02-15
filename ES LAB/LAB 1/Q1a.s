	
	;source and destination blocks are non overlapping
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
	LDR R0 , =SRC ; loads address of src into r0
	LDR R1 , =DST;loads address of dst in r1
	MOV R2 , #10;initiate r2 as loop counter
LOOP ; starting of loop
	LDR R3 , [R0] , #4; loads a word from memory at the address pointed to by R0 into register R3, then increments R0 by 4.
	STR R3 , [R1] , #4; stores the word in r3 and increments r1 by 4
	SUBS R2, R2 , #1; decrements loop register by 1 and updates the condition flags
	BNE LOOP; branch the loop when r2 is 0
	STR R3 , [R1] , #4; store the last word of the array 

STOP 
	B STOP
SRC DCD 1,2,3,4,5,6,7,8,9,10
	AREA mydata , DATA , READWRITE
DST DCD 0,0,0,0,0,0,0,0,0,0
	END
