.data
prompt1: .asciiz "Enter first float: "
prompt2: .asciiz "Enter second float: "
min1: .asciiz "\nMin is: "
max1: .asciiz "\nMax is: "

.text
main:
la $a0, prompt1
li $v0, 4
syscall

li $v0, 6
syscall
mov.s $f2, $f0

la $a0, prompt2
li $v0, 4
syscall

la $v0, 6
syscall
mov.s $f3, $f0

c.lt.s $f2, $f3
bc1t firstmin

la $a0, min1
li $v0, 4
syscall

mov.s $f12, $f3
li $v0, 2
syscall

la $a0, max1
li $v0, 4
syscall

mov.s $f12, $f2
li $v0, 2
syscall

li $v0, 10
syscall

firstmin:
la $a0, min1
li $v0, 4
syscall

mov.s $f12, $f2
li $v0, 2
syscall

la $a0, max1
li $v0, 4
syscall

mov.s $f12, $f3
li $v0, 2
syscall

li $v0, 10
syscall
