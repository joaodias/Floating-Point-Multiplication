			.start "CODE", 0x809800 ;Program will be stored here
			.sect "CODE"
			.entry SAMPLE; 	        ;Program running start point		
SAMPLE: 	ldp @stack				;Configure stack pointer
			ldi @stack, SP 			

			ldf @MPY1, R0			;Loads first operand from memory (float)
			ldf @MPY2, R1			;Load second operand from memory (float) 

			mpyf R0, R1				;Multiplication
			stf  R1, @MPYRES		;Sotore float result in R1

IDLE: 		b IDLE					;Infinite Loop to prevent runnaway

MPY1		.float 163455.37345 	;First operand in memory
MPY2		.float 48257.2345 		;Second operand in memory
MPYRES		.float 0   				;Result memory position

stack		.word $+1 				;Stack area starts here
			.end 	