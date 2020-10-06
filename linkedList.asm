;;=============================================================
;;CS 2110 - Fall 2020
;;Homework 5 - Linked List
;;=============================================================
;;Name:Rachel Mills
;;=============================================================

;;Pseudocode (see PDF for explanation)
;;targetData = DATA
;;newData = NEWDATA
;;curr = LL.head //HINT: What can an LDI instruction be used for?
;;while (curr != null) {
;;   if (curr.value == targetData) {
;;     curr.value = newData;
;;     break;
;;   } else {
;;     curr = curr.next
;;   }
;;}

.orig x3000
	LD R0, DATA
	LD R1, NEWDATA
	LDI R2, LL		;curr
	AND R3, R3, 0	;R3 = pointer

	W1	ADD	R2,	R2,	0
		BRz ENDW1
		ADD	R2,	R2,	#1	;get to data 
		ADD R2, R3, R2	;current mem location 
		LDR R5, R2, #0		;load what is in mem[R3]
		NOT	R5,	R5			
		ADD R5, R5, #1		;2's comp of data in curr
		ADD R4, R5, R0	;get result of datas added
		BRnp NOSWAP
		STR	R1,	R2,	#0		;store Newdata in curr
		NOSWAP	ADD R2, R2, #-1	;next pointer
				LDR	R2,	R2,	#0	;get next node
				BR W1
	ENDW1




	;;PUT YOUR CODE HERE


HALT


DATA .fill 10
NEWDATA .fill 15
LL .fill x6000
.end

.orig x4000
.fill x4008
.fill 5
.fill x400A
.fill 2
.fill x4002
.fill 9
.fill x0000 
.fill 3
.fill x4004
.fill 10
.fill x4006
.fill 7
.end

.orig x6000
.fill x4000
.end