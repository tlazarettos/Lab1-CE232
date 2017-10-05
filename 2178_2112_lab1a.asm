.data 
 
string1: .asciiz "Number " 
string2: .asciiz " is not a power of two\n" 
string3: .asciiz " is a power of two\n" 
 
.text  
.globl main 
 
main: 
 
li $v0, 5 
syscall                                   # Read integer and    
move $t4, $v0                       # put it in $t4.
li $t0, 1                                # Set the max $t0 1.
 
beq $t4, 1, ispow                 # If the integer is 1, is power of 2.
 
loop: 
sll $t0, $t0, 1                       # Multiply max x 2, until max is greater or equal to $t4.
 
bgt $t0, $t4, isnotpow          # If max is greater than $t4, $t4 is not power of 2.
beq $t0, $t4, ispow             # If max is equal to $t4, $t4 is power of 2.
bne $t0, $t4, loop               # If max is not equal to $t4, go to loop.
  
ispow: 
la $a0, string1                    # Print string.
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
syscall                                # Exit and return 1.
 
isnotpow: 
la $a0, string1                   # Print string.
li $v0, 4 
syscall 
 
move $a0, $t4 
li $v0, 1 
syscall  
 
la $a0, string2 
li $v0, 4 
syscall 
 
li $v0, 17                          # Exit and return 0.
li $a0, 0 
syscall
