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


bgt $t1, $t4, endif1
move $t1, $t3
bge $t2, $t4, endif2
move $t2, $t4
ble $t1, $t3, endif3
move $t1, $t3
j loop
endif3:
j loop
endif2:
j loop
endif1:

blt $t2, $t3, endif4
move $t2, $t4
ble $t1, $t3, endif5
move $t1, $t3
bge $t2, $t4, endif6
move $t2, $t4
j loop
endif6:
j loop
endif5:
j loop
endif4:


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