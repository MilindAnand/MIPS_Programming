.data
array: .word 3 4 1 5 2
min: .asciiz "\n min no. is: "
max: .asciiz "\n max no. is: "

.text

main:
la $t0, array
li $t1,20
li $t2,0x7fffffff #to store min
li $t3,0x80000000 #to store max
l:
addi $t1,$t1,-4
bltz $t1,exit
lw $s0, array+0($t1)

bge $s0,$t2,c2
addi $t2,$s0,0

c2:
ble $s0,$t3,end
addi $t3,$s0,0

end:
j l
exit:
la $a0,min
	li $v0,4
	syscall
li $v0,1
addi $a0,$t2,0
syscall
la $a0,max
	li $v0,4
	syscall
li $v0,1
addi $a0,$t3,0
syscall

li $v0,10
syscall