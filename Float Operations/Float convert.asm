.data
prompt1: .asciiz "\nEnter single precision floating point number: "
prompt2: .asciiz "\nEnter double precision floating point number: "
ans1: .asciiz "\nSingle to Double: "
ans2: .asciiz "\nDouble to Single: "
.text

main:
la $a0, prompt1
li $v0, 4
syscall

la $v0, 6
syscall
cvt.d.s $f6, $f0			#single precision float to double conversion

la $a0, prompt2
li $v0, 4
syscall

la $v0, 7
syscall
cvt.s.d $f4, $f0			#double precision to single precision float conversion

la $a0, ans1
li $v0, 4
syscall

mov.d $f12, $f6
li $v0, 3
syscall

la $a0, ans2
li $v0, 4
syscall

mov.s $f12, $f4
li $v0, 2
syscall

li $v0, 10
syscall