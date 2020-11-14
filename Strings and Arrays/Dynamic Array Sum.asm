.data
p1: .asciiz "Enter N: "
p2: .asciiz "Enter a number: "
res: .asciiz "Sum is: "

.text 
main:
la $a0, p1
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0
move $t2, $v0

addi $t7, $zero, 4
mul $a0, $v0, $t7
li $v0, 9
syscall

move $t1, $v0
move $t3, $v0

inpLoop:
beq $t0, $zero, endLoop
addi $t0, $t0, -1

la $a0, p2
li $v0, 4
syscall

li $v0, 5
syscall
sw $v0, ($t3)
addi $t3, $t3, 4
j inpLoop

move $t5, $zero
endLoop:
beq $t2, $zero, sum
addi $t2, $t2, -1

lw $t6, ($t1)
addi $t1, $t1, 4
add $t5, $t5, $t6
j endLoop

sum:
la $a0, res
li $v0, 4
syscall

move $a0, $t5
li $v0, 1
syscall

li $v0, 10
syscall