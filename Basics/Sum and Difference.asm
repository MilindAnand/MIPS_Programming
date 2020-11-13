.data
first: .asciiz "\nEnter the first integer please:"
second: .asciiz "\nEnter the second integer please:"
Sum: .asciiz "\nThe sum is ="
Difference: .asciiz "\nThe difference is ="

.text

main:
#first number
la $a0, first
li $v0, 4
syscall
li $v0, 5 
syscall
move $t0, $v0
li $v0, 4
la $a0, second
syscall
li $v0,5        
syscall
move $t1,$v0
add $t2, $t1, $t0
la $a0, Sum
li $v0, 4
syscall
move $a0, $t2
li $v0,1
syscall
sub $t2, $t0, $t1
la $a0, Difference
li $v0, 4
syscall
move $a0, $t2
li $v0,1
syscall
li $v0, 10
syscall
