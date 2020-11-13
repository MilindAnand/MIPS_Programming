.data #variable declaration follow this line

myMsg: .asciiz "Hello World." # string declaration
prompt: .asciiz "Enter the number: "
# .asciiz directive makes string null terminated

.text #instructions follow this line
main:

la $a0, prompt
li $v0, 4
la $a0, myMsg
li $v0, 4 
syscall
li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
syscall

#end of program
