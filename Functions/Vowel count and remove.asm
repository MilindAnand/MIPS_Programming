.data
pmt: .asciiz "Enter string: "
str: .space 20					#declare 20 bytes of memory which would be accessible using str
ans: .space 20
vowels: .asciiz "aeiou"
newLine: .asciiz "\n"

.text
main:
la $a0, pmt
li $v0, 4
syscall

li $v0, 8
la $a0, str 	#makes a0 overlap with address of str, so when string is input then it is stored in str
li $a1, 20		
syscall
la $a1, vowels
la $a3, ans

jal countVow

add $a0, $a2, $zero
li $v0, 1
syscall

la $a0, newLine
li $v0, 4
syscall

move $a0, $a3
li $v0, 4
syscall

li $v0, 10
syscall


countVow:
addi $sp, $sp, -12				#increase sp by 12 to make space to store values of ra and other registers, as they might be overwritten
sw $a0,($sp)
sw $a1, 4($sp)
sw $ra, 8($sp)

add $t1, $zero, $zero
move $t2, $a0					#t2 to read given string
move $t0, $a3					#t0 will store final string, without vowels
lb $t7, newLine

loop:
lb $t3, ($t2)
sb $t3, ($t0)
move $t4, $a1
addi $t2, $t2, 1
addi $t0, $t0, 1
addi $t8, $zero, 1


vloop:
lb $t5, ($t4)
addi $t4, $t4, 1
beq $t5, $t3, inc           # inc count register when vowel match
postinc:
bne $t5, $zero, vloop

add $t8, $zero, $zero

inc:
addi $t1, $t1, 1			#t1 contains count of vowels
addi $t0, $t0, -1			#decrement t0, so that the vowel would be overwritten by the next character. if the vowel is at the end it would be overwritten by newLine or null
bne $t8, $zero, postinc

addi $t1, $t1, -1
addi $t0, $t0, 1
beq $t3, $t7, exit
bne $t3, $zero, loop

exit:
add $a2, $t1, $zero
lw $a0, ($sp)
lw $a1, 4($sp)
lw $ra, 8($sp)
addi $sp, $sp, 8
jr $ra
