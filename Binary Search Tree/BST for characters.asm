# Write a program on making a Binary Search tree
# create a structure that stores two pointers to the nodes, and a value
# insert each element in order using DFS (ah hell)
# perform inorder traversal

.data
space: .asciiz " "
print: .asciiz "test"

.text
main:
li $s0, 0 #$s0 always points to the root node of binary tree, initially NULL

get_input: #infinite loop for getting number to be inserted in tree, 0 terminates the loop
li $v0,12 #value of node to insert, enter 0 for exiting
syscall

beq $v0, 48, break_of_loop

move $a0, $v0 #$a0 = number to be inserted
move $a1, $s0 #$a1 = ptr to the root (holds address of root node), initially NULL
jal insert_in_tree
move $s0, $v0 #v0 adress to the root, storing it in $s0
j get_input

break_of_loop: #exit from loop above for entry value as 0
move $a0, $s0
jal inorder_traversal #inorder traversal, $a0 is argument, holds address of the root

li $v0, 10 #exit from main
syscall

insert_in_tree:
bne $a1, $zero, not_base_case #Check if ptr == nullptr

move $t0, $a0 #avoid stack pointer for base case, use temp regs

#DMA
li $a0, 12 #1 for character + 3 for padding, 4 for ptr1, 4 for ptr2
li $v0, 9
syscall

#store the values you have
sb $t0, 0($v0)
#trash the garbage bits
sw $zero, 4($v0) #currently, a leaf node
sw $zero, 8($v0) #currently, a leaf node
jr $ra

not_base_case:
#Taking hint from returnNonBase label, 
#store the required values in stack
addi $sp, $sp, -12 #create a stack frame
sw $ra,0($sp)
sw $a1,4($sp) #ptr to root
sw $s0,8($sp) 

lb $t1, ($a1)
ble $t1, $a0, right

left:
addi $a1,$a1,4 #left node pointer at 1($a1)
move $s0, $a1 
lw $a1, ($a1) # now we have the pointer value – may be null
jal insert_in_tree #retval in $v0, which holds addr of new child (left or right acc to value of s0)
j returnNonBase

right:
#complete
addi $a1, $a1, 8 #right node pointer at 5($a1)
move $s0, $a1
lw $a1, ($a1)
jal insert_in_tree
j returnNonBase

returnNonBase:
sw $v0, ($s0) #NOTE- null value is being updated with the address returned
lw $ra, ($sp)
lw $a1, 4($sp)
lw $s0,8($sp) 

addi $sp,$sp,12 #restore stack frame
move $v0,$a1 #NOTE: a1 is the root node ptr, so restore and keep it in $v0
jr $ra

inorder_traversal:
# arity: 1
# $a0, stores the pointer to current node
beq $a0, $zero, return_inorder

addi $sp,$sp,-8
sw $ra, ($sp)
sw $a0, 4($sp)
#traverse left, then print then right
#E A S Y

addi $a0, $a0, 4 #a0 still is ptr to current node
lw $a0, ($a0)	 #a0 is now ptr to left child
jal inorder_traversal

li $v0, 11
lw $a0, 4($sp) #re-load the value of node
lb $a0, ($a0) #load value
syscall

li $v0, 4
la $a0, space
syscall	

lw $a0, 4($sp) #re-load $a0, and find right child
addi $a0, $a0, 8
lw $a0, ($a0) 
jal inorder_traversal

#restore 
lw $a0, 4($sp)
lw $ra, ($sp)
addi $sp, $sp, 8

return_inorder:
jr $ra #nothing doing