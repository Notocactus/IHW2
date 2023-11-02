.data 
prompt: .asciz "Please enter a double (-1; 1) \n"

.text
.global input, output
input: 
	addi sp, sp, -4
	sw ra, (sp)
	
	start:
	la a0, prompt
	li a7, 4
	ecall
	li a7, 7
	ecall
	
	li a3, 1
	jal checker
	
	beqz a3, start

	lw ra, (sp)
	addi sp, sp, 4
	ret 

checker: 
	li t1, -1
	li t2, 1
	fcvt.d.w fa1, t1, dyn
	fcvt.d.w fa2, t2, dyn
	
	flt.d t0, fa0, fa2
	beqz t0, incorrect
	flt.d t0, fa1, fa0
	beqz t0, incorrect
	correct: 
	ret
	incorrect: 
	li a3, 0
	ret

output: 
	li a7, 3
	ecall
	ret