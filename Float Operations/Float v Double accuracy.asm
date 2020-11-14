.data
prompt1: .asciiz "\nEnter a large integer: "
prompt2: .asciiz "Enter another large integer: "
intpro: .asciiz "\nInteger product: "
fltpro: .asciiz "\nSingle precision float product: "
dubpro: .asciiz "\nDouble precision float product: "
diff1: .asciiz "\nDiff b/w integer and single precision float product: "
diff2: .asciiz "\nDiff b/w integer and double precision float product: "

.text
main:
la $a0, prompt1
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0

la $a0, prompt2
li $v0, 4
syscall

li $v0, 5
syscall
move $t1, $v0

la $a0, intpro
li $v0, 4
syscall

mul $t2, $t0, $t1
move $a0, $t2
li $v0, 1
syscall

la $a0, fltpro
li $v0, 4
syscall

mtc1 $t0, $f0
cvt.s.w $f0, $f0
mtc1 $t1, $f1
cvt.s.w $f1, $f1

mul.s $f2, $f0, $f1
mov.s $f12, $f2
li $v0, 2
syscall

la $a0, dubpro
li $v0, 4
syscall

mtc1.d $t0, $f4
cvt.d.w $f4, $f4
mtc1.d $t1, $f6
cvt.d.w $f6, $f6

mul.d $f8, $f4, $f6
mov.d $f12, $f8
li $v0, 3
syscall

la $a0, diff1
li $v0, 4
syscall

cvt.w.s $f2, $f2
mfc1 $t4, $f2
sub $a0, $t2, $t4
li $v0, 1
syscall

la $a0, diff2
li $v0, 4
syscall

cvt.w.d $f8, $f8
mfc1 $t6, $f8
sub $a0, $t2, $t6
li $v0, 1
syscall

li $v0, 10
syscall