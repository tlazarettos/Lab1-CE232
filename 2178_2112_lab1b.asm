.data
string1: .asciiz "Please give N1: "
string2: .asciiz "Please give N2: "
string3: .asciiz "The max final union of ranges is ["
string4: .asciiz ","
string5: .asciiz "].\n"
 
.text 
.globl main

main:

li $v0, 4
la $a0, string1
syscall

li $v0, 5
syscall
bltz $v0, end

move $t1, $v0

li $v0, 4
la $a0, string2
syscall

li $v0, 5
syscall

move $t2, $v0
 
loop:
li $v0, 4
la $a0, string1
syscall

li $v0, 5
syscall
bltz $v0, end

move $t3, $v0

li $v0, 4
la $a0, string2
syscall

li $v0, 5
syscall

move $t4, $v0

bge $t4, $t1, endif5
j if1
endif5:
bge $t2, $t3, endif3
if1:
subu $t5, $t2, $t1
subu $t6, $t4, $t3
ble $t6, $t5, endif4
move $t1, $t3
move $t2, $t4
endif4:
j loop
endif3:

bge $t3, $t1, endif1
move $t1, $t3
endif1:
bge $t2, $t4, endif2
move $t2, $t4
endif2:
j loop

end:

li $v0, 4
la $a0, string3
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 4
la $a0, string4
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, string5
syscall

li $v0, 10
syscall