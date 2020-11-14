.data
welcomeMsg: .asciiz "Enter a string: "
userString: .space 256
newline: .asciiz "\n"
yes: .asciiz "IS PALINDROME"
no: .asciiz "NOT PALINDROME"

.text

main:
la $a0, welcomeMsg
li $v0, 4
syscall

la $a0, userString
li $a1, 256
li $v0, 8
syscall

lb $t5, newline

# store address of last element of userString in $a1
add $t1, $a0, $zero 

lengthZero:
lb $t3, ($t1)
addi $t1, $t1, 1
beq $t3, $t5, done # this step is required as MIPS reads newline after string	
bne $t3, $zero, lengthZero

done: 
addi $t1, $t1, -2
# check if palindrome
add $t0, $a0, $zero

check_letter:
lb $t2, ($t0)
lb $t3, ($t1)
bne $t2, $t3, notPalindrome
addi $t0, $t0, 1
addi $t1, $t1, -1
blt $t0, $t1, check_letter

la $a0, yes
li $v0, 4
syscall

j endProgram

notPalindrome:
la $a0, no
li $v0, 4
syscall

endProgram:
li $v0, 10
syscall