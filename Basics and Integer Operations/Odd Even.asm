.data
prompt: .asciiz "Enter the number: "
oddmsg: .asciiz "The given number is odd."
evemsg: .asciiz "The given number is even."

.text
main:
la $a0, prompt
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0

andi $t0, $t0, 1
beqz $t0, even

la $a0, oddmsg
li $v0, 4
syscall

li $v0, 10
syscall

even:
la $a0, evemsg
li $v0, 4
syscall

li $v0, 10
syscall