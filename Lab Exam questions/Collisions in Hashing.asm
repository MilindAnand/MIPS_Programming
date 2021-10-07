#ID: 2018A7PS0202H
#Name: Milind Anand
#email: f20180202@hyderabad.bits-pilani.ac.in

.data
newL: .asciiz "\n"
space: .asciiz " "
p1: .asciiz "Enter the elements(press enter after each character): "
coln: .asciiz "\nNumber of collisions: "
colc: .asciiz "\nColliding characters: "
nc: .asciiz "No collisions"
inp: .space 4
overf: .space 9

.text
main:
la $a0, p1
li $v0, 4
syscall

li $t0, 8
li $t1, 4
move $t2, $0
move $t3, $0
move $t4, $0
move $t5, $0
move $t6, $0

loop:
beq $t0, $0, exitloop
addi $t0, $t0, -1
#la $a0, as
#li $v0, 4
#syscall
la $a0, inp
li $v0, 8
syscall
lb $a0, inp
#li $v0, 1
#syscall
move $s0, $a0
addi $s0, $s0, 3
div $s0, $t1
mfhi $s1
beq $s1, $0, zero
beq $s1, 1, one
beq $s1, 2, two
beq $s1, 3, three
j loop

exitloop:

la $a0, coln
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall

la $a0, colc
li $v0, 4
syscall

la $a1, overf

ploop:
beq $t2, $0, endploop
addi $t2, $t2, -1
lb $a0, ($a1)
li $v0, 11
syscall
la $a0, space
li $v0, 4
syscall
addi $a1, $a1, 1
j ploop

endploop:

li $v0, 10
syscall

zero:
addi $s0, $s0, -3
bne $t3, $0, sk0
addi $t3, $t3, 1
j loop
sk0:
la $s2, overf
add $s2, $s2, $t2 
addi $t2, $t2, 1
sb $s0, ($s2)
j loop

one:
addi $s0, $s0, -3
bne $t4, $0, sk1
addi $t4, $t4, 1
j loop
sk1:
la $s2, overf
add $s2, $s2, $t2 
addi $t2, $t2, 1
sb $s0, ($s2)
j loop

two:
addi $s0, $s0, -3
bne $t5, $0, sk2
addi $t5, $t5, 1
j loop
sk2:
la $s2, overf
add $s2, $s2, $t2 
addi $t2, $t2, 1
sb $s0, ($s2)
j loop

three:
addi $s0, $s0, -3
bne $t6, $0, sk3
addi $t6, $t6, 1
j loop
sk3:
la $s2, overf
add $s2, $s2, $t2 
addi $t2, $t2, 1
sb $s0, ($s2)
j loop
