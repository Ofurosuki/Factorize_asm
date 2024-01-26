;Factorize input number into prime factors
MOV D,57			; any integer(1 to 255)
MOV B,2
MOV C,0xE8              	; output address
CALL Loop
HLT
Print:					; print A
	CMP A,100
	JAE Print3digit		;if A>=100
	CMP A,10
	JAE Print2digit		;if A>=10
Print1digit:			; print 1 digit	
	ADD A,48         	; convert to char 
    MOV [C], A
    SUB A,48         	; convert to u-int again
    INC C 
    MOV [C],44        	; add "," to output
    INC C
    RET
Print3digit:
	PUSH D
	PUSH A
	DIV 100
	ADD A,48
	MOV [C],A
	SUB A,48
	INC C
	MUL 100
	POP D
	SUB D,A
	MOV A,D
	POP D
	JMP Print2digit
Print2digit:
	PUSH D
	PUSH A
	DIV 10
	ADD A,48
	MOV [C],A
	SUB A,48
	INC C
	MUL 10
	POP D
	SUB D,A
	MOV A,D
	POP D
	JMP Print1digit
Loop:
	
    MOV A,B	
   	MUL B         		;A=i*i		
	CMP A,D					
	JA If				;if i*i > n 
	MOV A,D			
	DIV B				;A=n//i
	MUL B
	CMP D,A      		;n vs i*(n//i) if same, n%i==0 
 
	JZ Divisible		;if n%i==0
	INC B				;if not divisible		
	JMP Both
Divisible:				;if n%i==0
	DIV B			
	MOV D,A				;n//=i
	MOV A,B
	CALL Print
Both:	
	JMP Loop	
If:	
	CMP D,1			
	MOV A,D			
	JA Print			;if n>1 print(n)
	RET


	


	
	
	
	
	


	
	

