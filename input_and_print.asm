.data #variable declaration follow this line

prompt: .asciiz "Enter the number: "
# .asciiz directive makes string null terminated

.text #instructions follow this line
main:

la $a0, prompt
li $v0, 4
syscall
la $v0, 5
syscall
move $a0, $v0
li $v0, 1
syscall
li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
syscall

#end of program