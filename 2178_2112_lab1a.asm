.data 
 
string1: .asciiz "Number " 
string2: .asciiz " is not a power of two\n" 
string3: .asciiz " is a power of two\n" 
 
.text  
.globl main 
 
main: 
 
li $v0, 5 
syscall 
move $t4, $v0 
li $t0, 1 
#li $t1, 2 
 
beq $t4, 1, ispow 
 
loop: 
sll $t0, $t0, 1  
 
bgt $t0, $t4, isnotpow 
beq $t0, $t4, ispow  
bne $t0, $t4, loop 
  
ispow: 
la $a0, string1 
li $v0, 4 
syscall 
 
move $a0, $t4 
li $v0, 1 
syscall  
 
la $a0, string3 
li $v0, 4 
syscall 
 
li $v0, 17 
li $a0, 1 
syscall 
 
isnotpow: 
la $a0, string1 
li $v0, 4 
syscall 
 
move $a0, $t4 
li $v0, 1 
syscall  
 
la $a0, string2 
li $v0, 4 
syscall 
 
li $v0, 17 
li $a0, 0 
syscall