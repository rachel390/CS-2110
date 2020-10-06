;;=============================================================
;;CS 2110 - Fall 2020
;;Homework 5 - Bubble Sort
;;=============================================================
;;Name:Rachel Mills
;;=============================================================

;;Pseudocode (see PDF for explanation)
;;x = 0; 								//index of the array
;;len = LENGTH;
;;y = len - 1;							//last index of the array
;;while(y > 0) {
;;  x = 0;
;;  while(x < y) {
;;    if (array[x] > array[x+1]) {
;;      temp = ARRAY[x];
;;      ARRAY[x] = ARRAY[x+1];
;;      ARRAY[x+1] = temp;
;;    }
;;    x++;
;;  }
;;  y--;
;;}

.orig x3000

	;;PUT YOUR CODE HERE

AND	R1,	R1,	#0 ; x = 0
LD R3, LENGTH  	
ADD R3, R3, #-1 ; R3 = len - 1 = y
LD R2, ARRAY	; R2 = x4000

W1	ADD	R3,	R3,	#0 			; while y > 0
	BRnz ENDW1

	AND	R1,	R1,	#0 			; x = 0

	W2	AND R0, R0, #0		;while x < y
		NOT	R0,	R1
		ADD R0, R0, #1 		; 2's comp of x
		ADD R0, R3, R0		; y + x
		BRnz ENDW2

		;if (array[x] > array[x+1])

		AND R5, R5, #0
		AND R6, R6, #0
		AND R0, R0, #0
		ADD R5, R2, R1 ; gets x address
		ADD R6, R5, #1 ; gets x + 1 address
		LDR R4, R5, #0 ; arr[x]
		LDR R7, R6, #0 ; arr[x + 1]
		NOT R7, R7 
		ADD R7, R7, #1 ; 2's comp arr[x + 1] = -(arr[x+1])
		ADD R0, R4, R7 ; arr[x] - arr[x + 1]
		BRnz NOSWAP

		;swappy swap

		LDR R7, R6, #0 ;arr[x + 1]
		STR	R7,	R5,	#0	;arr[x] = arr[x + 1]
		STR R4, R6, #0	;arr[x + 1] = arr[x}

		NOSWAP ADD R1, R1, #1	; x = x + 1
		BR W2
		ENDW2 ADD R3, R3, #-1	; y = y - 1
		BR W1
		ENDW1


HALT

ARRAY .fill x4000
LENGTH .fill 7
.end

.orig x4000
.fill 4
.fill 9
.fill 0
.fill 2
.fill 9
.fill 3
.fill 10
.end