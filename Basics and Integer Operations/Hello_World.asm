.data #variable declaration follow this line

myMsg: .asciiz "Hello World." # string declaration
prompt: .asciiz "Enter the number: "
# .asciiz directive makes string null terminated

.text #instructions follow this line
main:
# I took an integer input as a trial
la $a0, prompt
li $v0, 4
syscall

#the actual printing happens here
la $a0, myMsg
li $v0, 4 
syscall
li $v0,10 #System call - Exit - QTSPIM to properly terminate the run
syscall

#end of program
