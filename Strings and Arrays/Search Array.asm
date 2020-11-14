.data
prompt1: .asciiz "Enter a string: "
prompt2: .asciiz "Enter search char: "
str: .space 20
char: .space 2
newLine: .asciiz "\n"
found: .asciiz "\nFound"
nfound: .asciiz "\nNot found"

.text
main:
la $a0, prompt1
li $v0, 4
syscall

li $v0, 8
la $a0, str 	#makes a0 overlap with address of str, so when string is input then it is stored in str
li $a1, 20		
syscall
move $t2, $a0	#store address of a0 in t0

la $a0, prompt2
li $v0, 4
syscall

li $v0, 8
la $a0, char
li $a1, 2
syscall
move $t3, $a0

lb $t4, newLine
lb $t6, ($t3)

loop:
lb $t5, ($t2)
addi $t2, $t2, 1
beq $t5, $t6, fnd
beq $t5, $t4, notf
bne $t5, $zero, loop

fnd:
la $a0, found
li $v0, 4
syscall
j fin

notf:
la $a0, nfound
li $v0, 4
syscall
j fin

fin:
li $v0, 10
syscall