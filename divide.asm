;;=============================================================
;;CS 2110 - Fall 2020
;;Homework 5 - Iterative Division
;;=============================================================
;;Name: Rachel Mills
;;=============================================================

;;Pseudocode (see PDF for explanation)
;;a = (argument 1);
;;b = (argument 2);
;;ANSWER = 0;
;;while (a > 0) {
;;  a = a - b;
;;  ANSWER = ANSWER + 1;
;; }
;;note: when the while-loop ends, the value stored at ANSWER is a divided by b.


.orig x3000

	LD R1, A
	LD R2, B 
	NOT	R2,	R2
	ADD	R2,	R2,	#1		; 2's comp b
	AND R4, R4, #0
	ST R4, ANSWER

	W1	ADD	 R1, R1, #0		;set cc
		BRnz EndW1
		ADD	R1,	R1, R2		;a = a - b
		ADD	R4,	R4,	#1		;ANSWER++
		BRnzp W1	

	;;PUT YOUR CODE HERE


EndW1 ST R4, ANSWER
HALT

A   .fill 24
B   .fill 4

ANSWER .blkw 1

.end