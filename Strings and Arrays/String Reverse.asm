.data
str: .space 256
rev: .space 256
newLine: .byte '\n'
string: .asciiz "Enter string:  "
revstring: .asciiz "Reversed string:"

.text
main:
la $a0,string
li $v0,4       
syscall

la $a0,str
la $a1,6
li $v0,8
syscall

la $t3, str
li $t1,-1
lb $t4, newl

strloop:
add $t1,$t1,1
lb $t2, str+0($t1)		#not the best method imo, would be better to load address into a register and then use that, rather than add address to register each time
beq $t2,$t4,revstr
bne $t2,$0,strloop

revstr:
add $t1,$t1,-1
add $t0,$t0,1
blt $t1,0,end
lb $t2, str+0($t1)
sb $t2,rev+-1($t0)
j revstr

end:
xor $t4,$t4,$t4

la $a0,revstring
li $v0,4       
syscall

sb $t4,rev+0($t0)

la $a0,rev
li $v0,4
syscall

li $v0,10
syscall