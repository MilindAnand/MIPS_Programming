.data
prompt1: .asciiz "\nEnter first num: "
prompt2: .asciiz "\nEnter second num: "
mulp: .asciiz "\nProduct: "
divp: .asciiz "\nQuotient: "
remp: .asciiz "\nRemainder: "

.text

main:
la $a0, prompt1
li $v0, 4
syscall

la $v0, 5
syscall
move $t0, $v0

la $a0, prompt2
li $v0, 4
syscall

la $v0, 5
syscall
move $t1, $v0

la $a0, mulp
li $v0, 4
syscall

mul $a0, $t0, $t1
li $v0, 1
syscall

la $a0, divp
li $v0, 4
syscall

div $a0, $t0, $t1
move $t3, $a0
li $v0, 1
syscall

la $a0, remp
li $v0, 4
syscall

mul $t3, $t3, $t1
sub $a0, $t0, $t3
li $v0, 1
syscall

#note, I used a long route to find the remainder, due to lack of knowledge.
#Later on I learnt that the remainder was stored in the hi register, and hence could be retrieved using mfhi.
#Similarly the quotient could be retrieved using mflo from lo register.

li $v0, 10
syscall