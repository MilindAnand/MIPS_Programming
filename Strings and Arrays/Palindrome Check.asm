.data
str: .space 10
prompt: .asciiz "Enter string: "
pal: .asciiz "\nGiven string is a palindrome."
notpal: .asciiz "\nGiven string is not a palindrome."
newLine: .asciiz "\n"

.text
main:
la $a0, prompt
li $v0, 4
syscall

li $v0, 8
la $a0, str 	#makes a0 overlap with address of str, so when string is input then it is stored in str
li $a1, 10		
syscall
move $t2, $a0	#store address of a0 in t0

lb $t4, newLine
strlenfind: # loop label to find the last char
lb $t3, ($t2) 					# load current byte
addi $t2, $t2, 1 				# increment for next iteration
beq $t3, $t4, next 				# if current byte is '\n'
bne $t3, $zero, strlenfind 		# if current byte isn't '\0', repeat

next:
add $t1, $a0, $zero
addi $t2, $t2, -2		#currently t2 is at char after newline or null, so need to go back by 2 places

palin_test:
bge $t1, $t2, isPal		#if t1>=t2 then it is a palindrome as we checked all letters
lb $t3, 0($t1)
lb $t4, 0($t2)
bne $t3, $t4, noPal
addi $t1, $t1, 1
addi $t2, $t2, -1
j palin_test

isPal:
la $a0, pal
li $v0, 4
syscall
j end

noPal:
la $a0, notpal
li $v0, 4
syscall

end:
li $v0, 10
syscall