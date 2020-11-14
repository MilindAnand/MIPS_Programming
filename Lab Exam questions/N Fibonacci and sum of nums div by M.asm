#ID: 2018A7PS0202H
#Name: Milind Anand
#Phone Number: 6205133496
#email: f20180202@hyderabad.bits-pilani.ac.in

.data
prompt1: .asciiz "Enter the value for N:"
prompt2: .asciiz "Enter M: "
fibo: .asciiz "\nFirst N fibonacci numbers are: "
sump: .asciiz "\nSum of numbers divisible by M: "
space: .asciiz " "

.text
main:
la $a0, prompt1
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0

la $a0, prompt2
li $v0, 4
syscall

li $v0, 5
syscall
move $t1, $v0

li $t2, 1			#counter
move $t3, $zero		#store sum
move $t4, $zero		#store fiblo
li $t5, 1			#store fibhi

la $a0, fibo
li $v0, 4
syscall

ble $t0, $zero, end

move $a0, $t4
li $v0, 1
syscall

loop:
beq $t0, $t2, end
la $a0, space
li $v0, 4
syscall
move $a0, $t5
li $v0, 1
syscall
div $t5, $t1
mfhi $t7
bne $t7, $zero, proceed
add $t3, $t3, $t5
proceed:
addi $t2, $t2, 1
add $t6, $t4, $t5
move $t4, $t5
move $t5, $t6
j loop

end:
la $a0, sump
li $v0, 4
syscall

move $a0, $t3
li $v0, 1
syscall

li $v0, 10
syscall