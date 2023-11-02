.include "m_step.asm"

.data
test1: .double 0
test2: .double 0.1
test3: .double -0.1
test4: .double 0.5
test5: .double 0.12345

.text
main:
li a0, 0
# Input x and checking for correct x
# Returns the correct number to work with
#jal input
fmv.d fs0, fa0

#_______________________
# For automatic test inputs remove "#" in the next few lines and comment the input line 
# You can change the number of the test
la a0, test2
fld fs0, (a0)
#_______________________

# Sum 
fmv.d fs1, fs0
# Current
fmv.d fs2, fs0
# Count
li a3, 1

fmul.d fs3, fs0, fs0

li t1, 0
# Cycle 
cycle_:
	# Adds the next element in line to the sum, which is the answer
	step fs2 a3 fs1 fs3 t1
	beqz t1, cycle_

# Output
fmv.d fa0, fs1 
jal output

# End of program
li a7, 10
ecall
