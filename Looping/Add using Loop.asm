.data
prompt: .asciiz "\nEnter the number: "
ans: .asciiz "\nAnswer: "

.text
main:
la $a0, prompt
li $v0, 4
syscall

la $v0, 5
syscall
move $t0, $v0

li $t1, 1
li $t2, 0

loop: 
add $t2, $t2, $t1
beq $t0, $t1, exit
addi $t1, $t1, 1
j loop

exit:
la $a0, ans
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall

li $v0, 10
syscall