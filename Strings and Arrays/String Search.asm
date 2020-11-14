.data
char: .byte 'e'
strr: .asciiz "aeiou"
fail: .asciiz " the char was not found in "
success: .asciiz " the char was found in "

.text
main:
lb $t0, char
lb $t7, char

la $s0, strr
lb $s1, ($s0)

srch:
beq $s1,$zero, uns
beq $s1,$t0,suc
add $s0,$s0,1
lb $s1,($s0)
j srch


suc:
la $a0, success
li $v0, 4 
syscall

j exit

uns:
la $a0, fail
li $v0, 4 
syscall

exit:
la $a0, strr
li $v0, 4 
syscall

li $v0,10
syscall
