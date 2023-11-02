.macro step %curr %count %sum %square %flag
.text 
# double zero
fcvt.d.w fa3, zero, dyn
# negative curr
fsub.d fa1, fa3, %curr

addi %count, %count, 2
fcvt.d.w fa2, %count, dyn
fmul.d %curr, fa1, %square 
fdiv.d %curr, %curr, fa2
fadd.d %sum, %sum, %curr

# Checking with EPS
fmv.d fa4, %curr
flt.d t2, fa4, fa3
beqz t2, check_
fsub.d fa4, fa3, fa4
check_:
checker fa4 %flag
.end_macro



.macro checker %c %t
.data
EPS: 	.double 0.00005
.text
fld ft10, EPS, t0
flt.d %t, %c, ft10
.end_macro
