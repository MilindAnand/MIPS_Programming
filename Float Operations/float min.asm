.data
prompt1: .asciiz "\nEnter first num: "
prompt2: .asciiz "\nEnter second num: "
minp: .asciiz "\nMin is: "
eq: .asciiz "\nNums are equal: "

.text
main:
la $a0, prompt1
li $v0, 4
syscall

la $v0, 6
syscall
mov.s $f2, $f0

la $a0, prompt2
li $v0, 4
syscall

la $v0, 6
syscall
mov.s $f3, $f0

c.lt.s $f2, $f3
bc1t pr1
c.lt.s $f3, $f2
bc1t pr2

la $a0, eq
li $v0, 4
syscall
mov.s $f12, $f2
j endpr

pr1: 
la $a0, minp
li $v0, 4
syscall
mov.s $f12, $f2
j endpr

pr2:
la $a0, minp
li $v0, 4
syscall
mov.s $f12, $f2
j endpr

endpr:
li $v0, 2
syscall

li $v0, 10
syscall
