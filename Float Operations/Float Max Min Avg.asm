.data
prompt: .asciiz "\nEnter 5 floating point numbers: "
mx: .asciiz "\nMax float: "
mn: .asciiz "\nMin float: "
av: .asciiz "\nAvg float: "
tot: .float 5.0
.text

main:
la $a0, prompt
li $v0, 4
syscall

la $v0, 6
syscall
mov.s $f1, $f0
mov.s $f2, $f0		#for max
mov.s $f4, $f0		#for min
mov.s $f6, $f0		#for sum

li $t0, 3
li $t1, 0

loop:
la $v0, 6
syscall
add.s $f6, $f6, $f0
c.lt.s $f2, $f0
bc1t maxupd
c.lt.s $f0, $f4
bc1t minupd
j jizz
maxupd:
mov.s $f2, $f0
j jizz
minupd:
mov.s $f4, $f0
j jizz
jizz:
beq $t0, $t1, exit
addi $t1, $t1, 1
j loop

exit:
la $a0, mx
li $v0, 4
syscall
mov.s $f12, $f2
li $v0, 2
syscall
la $a0, mn
li $v0, 4
syscall
mov.s $f12, $f4
li $v0, 2
syscall
la $a0, av
li $v0, 4
syscall
lwc1 $f8, tot
div.s $f12, $f6, $f8
#mov.s $f12, $f6
li $v0, 2
syscall

li $v0, 10
syscall

