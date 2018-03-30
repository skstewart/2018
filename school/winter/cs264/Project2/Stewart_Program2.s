# Name: Shayna Stewart
# Due: 1/29/2018
# Class: CS 264-02
# Program 2
#
# Stewart_Program2.s
# Project Description: Takes in five integer values from the user, adds them,
# divides by five to find the average, then outputs the value to the user.
#
#
# 
 
 
.data
avg: .asciiz "The average is: "
entry_prompt: .asciiz "Please enter an integer: " 

.text
.globl main

main:
li $t0, 0 #sum starts at 0
li $t1, 5 #load 5 into the counter, to go 5 times

#loop 5 times, asking for an integer then adding it to the sum
loop: #begin the loop

li $v0, 4
la $a0, entry_prompt #ask for an integer
syscall

li $v0, 5 #take in the input from the user
syscall

add $t0, $t0, $v0 # adds to the sum
sub $t1, $t1, 1  # decrement loop counter, exit when 0
bnez $t1, loop #do the loop while $t1 doesnt = 0
#bnez, rs, offset <-- when rs doesnt = 0, branch to offset (in above case, the loop, so it keeps going til $t1 isnt 0)

div $t0, $t0, 5 #divide the sum by 5

li $v0, 4
la $a0, avg #output the string to give the average, then output the average on that line 
syscall

li $v0,1 #print the int
move $a0, $t0  #the int to print || output the average finally!
syscall

li $v0,10 #exit the program
syscall
