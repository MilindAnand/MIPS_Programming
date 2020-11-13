.data
prompt: .asciiz "\nEnter a number: "
ans: .asciiz "\nYou entered: "

.text
main:
la $a0, prompt
li $v0, 4
syscall

la $v0, 6			#float input
syscall
mov.s $f12, $f0

la $a0, ans
li $v0, 4
syscall

li $v0, 2			#float output
syscall

li $v0, 10
syscall