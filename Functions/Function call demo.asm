.data
line: ​.asciiz "\n"
print_str: ​.asciiz "value of $s0: "

.text
main:
li $a0, 10
la $a1, print_str
la $a2, line

jal ​increase_the_value ​ 	#function to increase the value of $s0 by 10 and print

jal ​print_value				​#function to print value stored in $a0

li $v0,10
syscall

increase_the_value:
addi $sp,$sp,-8			     ​#​4 bytes for each value
sw $a0,($sp)				 ​#call by value
sw $ra,4($sp)				 ​#​since we are having nested procedure, which will overwrite the current value of$ra 
​addi $a0,$a0,10

jal ​print_value				 ​#print_value is a nested procedure
lw $a0,($sp)				 ​#restore the value ​of $a0, main function should get old value of$a0 
​lw $ra,4($sp)				 ​#restore the value of $ra
addi $sp,$sp,8
jr $ra

print_value:
addi $sp,$sp,-4				 ​#Since $a0 will be used to print the string, its original value would belost ​
sw $a0,($sp) 				 #saving the original value of $a0(as received by this procedure)#since we are not 										 #calling any other procedure in this procedure value of $ra wouldnt change, henceno need 								 #to store it in stack
move $a0,$a1
li $v0,4
syscall
lw $a0,($sp)
li $v0,1
syscall
move $a0,$a2
li $v0,4
syscall
lw $a0,($sp)
addi $sp,$sp,4
jr $ra