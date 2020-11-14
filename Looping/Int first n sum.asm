.data
prompt: .asciiz "Enter the number: "
msg: .asciiz "The sum of all natural numbers till the given number is: "

.text
main:
la $a0, prompt
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0
move $t1, $zero
move $t4, $zero

loopchk: 
slt $t2, $t1, $t0
beq $t2, $zero, loopexit
add $t4, $t4, $t1
addi $t1, 1
j loopchk

loopexit: 
add $t4, $t4, $t0
la $a0, msg
li $v0, 4
syscall

move $a0, $t4
li $v0, 1
syscall

li $v0, 10
syscall