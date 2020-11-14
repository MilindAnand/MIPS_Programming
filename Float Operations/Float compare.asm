.data
prompt1: .asciiz "Enter first float: "
prompt2: .asciiz "Enter second float: "

.text
main:
la $a0, prompt1
li $v0, 4
syscall

li $v0, 7
syscall
mov.d $f2, $f0

la $a0, prompt2
li $v0, 4
syscall

la $v0, 7
syscall
mov.d $f4, $f0

li.d $f6, 0.01
loop:
c.le.d $f2, $f6
bc1t end
div.d $f2, $f2, $f4
j loop

end:
mov.d $f12, $f2
li $v0, 3
syscall

li $v0, 10
syscall