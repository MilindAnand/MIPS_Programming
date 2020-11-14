.data
prompt1: .asciiz "Enter first integer: "
prompt2: .asciiz "Enter second integer: "
min1: .asciiz "\nMin is: "
max1: .asciiz "\nMax is: "

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

la $v0, 5
syscall
move $t1, $v0

blt $t0, $t1, firstmin

la $a0, min1
li $v0, 4
syscall

move $a0, $t1
li $v0, 1
syscall

la $a0, max1
li $v0, 4
syscall

move $a0, $t0
li $v0, 1
syscall

li $v0, 10
syscall

firstmin:
la $a0, min1
li $v0, 4
syscall

move $a0, $t0
li $v0, 1
syscall

la $a0, max1
li $v0, 4
syscall

move $a0, $t1
li $v0, 1
syscall

li $v0, 10
syscall