# Name: Shayna Stewart
# Due: 2/19/2018
# Class: CS 264-02
# Program 3
#
# Stewart_Program3.s
# Project Description: Asks for 10 integers and puts them into an array; brings up a menu to replace an element, remove the max, remove the min, 
# or computer the sum and product, print the array, then exit
#
#
#

        .data

		
str0:   .asciiz "Please enter 10 integer values: \n"
entry:  .asciiz "Please enter an integer value: \n"
choices:   .asciiz "Menu (enter an int as your choice): "
		.asciiz "1) Replace an element at a certain position"
		.asciiz "2) Remove the max element "
		.asciiz "3) Remove the min element "
		.asciiz "4) Compute values and exit "
		.asciiz "What would you like to do? "
str1:   .asciiz "What position from the array do you wish to replace? "
str2:   .asciiz "What value to you want to change it to? "
strSum1:.asciiz "The summation of all values in the array is: "
strSum2:.asciiz ", the product of all values in the array is: "
str3:   .asciiz "Your values are: "

newLine: .asciiz "\n"


list:   .space 100
size:   .word 100
listsize: .word 250
	.extern foobar 4



.text
main:
 la $a0,str0                    # Load the address of prompt
   li $v0,4                       # The string print service is specified
   syscall 
li $t0, 0 #sum starts at 0
li $t1, 10

 la $s0, list                       # Load the address of the array
   la $s5, size                     # Load the size of the array
   lw $s5, 0($s5)                       # Load the value in the address of the array
   add $a1, $s5, $0                   # Load the value of size($s5) into $a1

#loop 10 times, asking for an integer then adding it to the array
loop: #begin the loop



la $a0,entry                    # Load the address of prompt
   li $v0,4                       # The string print service is specified
   syscall                           # System call is made
  
   li $v0,5                       # The integer print service is specified
   syscall                           # System call is made
  
   sw $v0,0($s0)                       # Store the value at $v0 into $s0
   addi $s0,$s0,4                       # Increase the address of $s0 by 4 bytes
   addi $s5,$s5,-1                       # Decrease the $a1 value by 1
   add $t0, $t0, $v0 # adds to the sum


sub $t1, $t1, 1  # decrement loop counter, exit when 0
bnez $t1, loop #do the loop while $t1 doesnt = 0

   
curtaincall:
la $a0, strSum1                    # Load the address of prompt
   li $v0,4                       # The string print service is specified
   syscall                           # System call is made
  
   li $v0,1 #print the int
move $a0, $t0  #the int to print || the sum
syscall


#now print the product
divi $s0,$s0,4                       # # elements in array = $s0 divided by 4 bytes each
li $s3, $s3, 0
li $t8, 0 #sum starts at 0
li $t1, $s0 #load 10 into the counter, to go 5 times



   lw $s5, 0($s5)                       # Load the value in the address of the array
   add $a1, $s5, $0                   # Load the value of size($s5) into $a1

#loop however many times in array
loop2: #begin the loop



la $a0,entry                    # Load the address of prompt
   li $v0,4                       # The string print service is specified
   syscall                           # System call is made
  
   li $v0,5                       # The integer print service is specified
   syscall                           # System call is made
  
   sw $v0,0($s0)                       # Store the value at $v0 into $s0
   addi $s0,$s0,4                       # Increase the address of $s0 by 4 bytes
   addi $s5,$s5,-1                       # Decrease the $a1 value by 1
   add $t0, $t0, $v0 # adds to the sum


sub $t1, $t1, 1  # decrement loop counter, exit when 0
bnez $t1, loop2 #do the loop while $t1 doesnt = 0





#then print the array then exit

la $a0, str3
li $vo,4
syscall

li $t8, 0 #sum starts at 0
li $t1, 10 #load 10 into the counter, to go 5 times

 la $s0, list                       # Load the address of the array
   la $s5, size                     # Load the size of the array
   lw $s5, 0($s5)                       # Load the value in the address of the array
   add $a1, $s5, $0                   # Load the value of size($s5) into $a1

# loop through array and print what's inside
loop3: #begin the loop



la $a0,entry                    # Load the address of prompt
   li $v0,4                       # The string print service is specified
   syscall                           # System call is made
  
   li $v0,5                       # The integer print service is specified
   syscall                           # System call is made
  
   sw $v0,0($s0)                       # Store the value at $v0 into $s0
   addi $s0,$s0,4                       # Increase the address of $s0 by 4 bytes
   addi $s5,$s5,-1                       # Decrease the $a1 value by 1
   add $t0, $t0, $v0 # adds to the sum


sub $t1, $t1, 1  # decrement loop counter, exit when 0
bnez $t1, loop3 #do the loop while $t1 doesnt = 0


   
   
   
   li $v0, 10                       # System call for exit
   syscall                           # Exit!!!