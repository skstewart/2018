# Name: Shayna Stewart
# Due: 1/17/2018
# Class: CS 264-02
# Program 1
#
# Stewart_Program1.s
# Project Description: Prints five strings: "Hello World!", my name, my favorite game, favorite movie, and favorite song. 
#
#
#

        .data
str1:   .asciiz "Hello World!"
str2:   .asciiz "\nShayna Stewart"
str3:   .asciiz "\nVagrant Story"
str4:   .asciiz "\nPride & Prejudice"
str5:   .asciiz "\nRead My Mind - The Killers"
	.extern foobar 4

        .text
        .globl main
main:   li $v0, 4       # syscall 4 (print_str)
        la $a0, str1     # argument: string
        syscall         # print the string
        
        
		li $v0, 4       # syscall 4 (print_str)
        la $a0, str2     # argument: string
        syscall         # print the string
 
		
		
		li $v0, 4       # syscall 4 (print_str)
        la $a0, str3     # argument: string
        syscall         # print the string
       
		
		
		li $v0, 4       # syscall 4 (print_str)
        la $a0, str4     # argument: string
        syscall         # print the string
        
		
		li $v0, 4       # syscall 4 (print_str)
        la $a0, str5     # argument: string
        syscall         # print the string
        lw $t1, foobar
		
		
		
        jr $ra          # retrun to caller
