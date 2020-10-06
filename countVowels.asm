;;=============================================================
;;CS 2110 - Fall 2020
;;Homework 5 - Count the Vowels in a String
;;=============================================================
;;Name:Rachel Mills
;;=============================================================

;;Pseudocode (see PDF for explanation)
;;string = "TWENTY ONE TEN";
;;vcount = 0;
;;i = 0;
;;while(string[i] != ’\0’){
;;  if(string[i] == ’A’ || string[i] == ’E’ ||
;;    string[i] == ’I’ || string[i] == ’O’ ||
;;    string[i] == ’U’){
;;      vcount += 1;
;;  }
;;  i += 1;
;;}
;;ANSWER = vcount;

.orig x3000

;;PUT YOUR CODE HERE
AND	R0,	R0,	#0	;vcount = 0
LD R1, STRING ; x4000
AND R2, R2, #0	;i = 0 

COUNT	AND R3, R3, #0						
		ADD R3, R1, R2						;x4000 + i
		LDR R4, R3, #0 						;string[i]
		ADD R4, R4, #0						;set CC
		BRz ENDCOUNT

		AND R5, R5, #0						
		LD R6, A							;check if string[i] = 'A'
		NOT R6, R6
		ADD R6, R6, #1
		ADD R5, R4, R6
		BRz VOWEL

		AND R5, R5, #0
		LD R6, E							;check if string[i] = 'E'		
		NOT R6, R6
		ADD R6, R6, #1
		ADD R5, R4, R6
		BRz VOWEL

		AND R5, R5, #0
		LD R6, I							;check if string[i] = 'I'		
		NOT R6, R6
		ADD R6, R6, #1
		ADD R5, R4, R6
		BRz VOWEL

		AND R5, R5, #0
		LD R6, O							;;check if string[i] = 'O'	
		NOT R6, R6
		ADD R6, R6, #1
		ADD R5, R4, R6
		BRz VOWEL

		AND R5, R5, #0
		LD R6, U							;check if string[i] = 'U'	
		NOT R6, R6
		ADD R6, R6, #1
		ADD R5, R4, R6
		BRz VOWEL
		
		BR ENDIF

		VOWEL ADD R0, R0, #1	; vcount ++
		ENDIF ADD R2, R2, #1	; i++
		BR COUNT

ENDCOUNT ST	R0,	ANSWER			;store vcount in ANSWER


HALT

A .fill x41    ;; A in ASII
E .fill x45
I .fill x49
O .fill x4F
U .fill x55
S .fill x0	; 0 ASCII

;;NOTE: Make sure to fill in the ASCII values
;;for the rest of the vowels here!!

STRING .fill x4000
ANSWER .blkw 1
.end

.orig x4000
.stringz "TWENTY ONE TEN"
.end
