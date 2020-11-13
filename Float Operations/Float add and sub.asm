.data
prompt1: .asciiz "\nEnter first num: "
prompt2: .asciiz "\nEnter second num: "
resadd: .asciiz "\nSum: "
ressub: .asciiz "\nDiff: "
resneg: .asciiz "\nDiff using neg.s: "

.text

main:
la $a0, prompt1
li $v0, 4
syscall

la $v0, 6
syscall
mov.s $f2, $f0				#moving so that next input wont overwrite

la $a0, prompt2
li $v0, 4
syscall

la $v0, 6
syscall
mov.s $f3, $f0

la $a0, resadd
li $v0, 4
syscall

add.s $f12, $f2, $f3
li $v0, 2
syscall

la $a0, ressub
li $v0, 4
syscall

sub.s $f12, $f2, $f3
li $v0, 2
syscall

la $a0, resneg
li $v0, 4
syscall

neg.s $f4, $f3
add.s $f12, $f2, $f4
li $v0, 2
syscall

li $v0, 10
syscall