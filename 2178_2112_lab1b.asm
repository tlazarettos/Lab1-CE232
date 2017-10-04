#2178_2112_lab1b
.data #Strings for cosnole
string1: .asciiz "Please give N1: "
string2: .asciiz "Please give N2: "
string3: .asciiz "The max final union of ranges is ["
string4: .asciiz ","
string5: .asciiz "].\n"
 
.text 
.globl main 

main: #main function

li $v0, 4
la $a0, string1
syscall

li $v0, 5
syscall #N1 prompt
bltz $v0, end #if N1<0 -> terminate

move $t1, $v0 #$t1=N1

li $v0, 4
la $a0, string2
syscall

li $v0, 5
syscall #N2 prompt

move $t2, $v0 #$t2=N2
 
loop: #Repeat until N1<0
li $v0, 4
la $a0, string1
syscall

li $v0, 5
syscall #N1' prompt
bltz $v0, end #if N1'<0 -> terminate

move $t3, $v0 #$t3=N1'

li $v0, 4
la $a0, string2
syscall

li $v0, 5
syscall #N2' prompt

move $t4, $v0 #$t4=N2'

bge $t4, $t1, endif5 #if N2'<N1
j if1
endif5:
bge $t2, $t3, endif3 #if N2<N1'
if1:
subu $t5, $t2, $t1
subu $t6, $t4, $t3
ble $t6, $t5, endif4 #Compare N2-N1 with N2'-N1"
move $t1, $t3 #N2'-N1' is larger then replace the former interval (N1=N1')
move $t2, $t4 #N2'-N1' is larger then replace the former interval (N2=N2')
endif4:
j loop
endif3:

bge $t3, $t1, endif1 #if N1'<N1
move $t1, $t3 #N1=N1"
endif1:
bge $t2, $t4, endif2 #if N2<N2'
move $t2, $t4 #N2=N2'
endif2:
j loop

end: #Prints the final interval

li $v0, 4
la $a0, string3
syscall

li $v0, 1
move $a0, $t1
syscall #Print N1

li $v0, 4
la $a0, string4
syscall

li $v0, 1
move $a0, $t2
syscall #Print N2

li $v0, 4
la $a0, string5
syscall

li $v0, 10 #Exit
syscall