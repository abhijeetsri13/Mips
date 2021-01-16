#Below code compiles and runs on QTSpim.

 

.data 

    command1:   .asciiz "Input String:"

    command2:   .asciiz "Input character:"

str3:     .asciiz "(Not Found)"

str4: .asciiz "Output"

    count:      .word 10

    sentence:   .space 100

    character:  .space 4

.text

.globl main

main:

    li $t0, 100 #end var for loop

    li $t1, 0   #start var for loop

    li $t2, 0   #number of occurences

 

    la $a0, command1    #print 'Input String:'

    li $v0, 4

    syscall

 

 

    la $a0, sentence    #input sentence

    li $a1, 100

    li $v0, 8

    syscall

 

    la $a0, command2    #print 'Input String:'

    li $v0, 4

    syscall

 

    la $a0, character   #input character

    li $a1, 2

    li $v0, 8

    syscall

 

    la $s0, character

    lb $s1, ($s0)

    la $t3, sentence

    lb $a2, ($t3) #gets first char of sentence

 

loop:

    beq $a2, $zero, end     #once reach end of char array, prints result

    beq $a2, $s1, something #if the char within sentence == comparing char

    addi $t3, $t3, 1

    lb $a2,($t3)        

    j loop

 

something:              

    addi $t2, $t2, 1        #increments number of occurences of char 

addi $t3, $t3, 1

lb $a2,($t3)  

j loop

end:

la $a0, str4    #print 'OUTPUT anyway we have to print it if found or not'

    li $v0, 4

    syscall

beq $t2, $zero, notfound

 

 

    #la $a0, $t2

    li $v0, 1

    move $a0, $t2

    syscall

 

 

li $v0, 10      # end program

    syscall

notfound:

la $a0, str3    #print 'Not Found'

    li $v0, 4

    syscall

li $v0, 10      # end program

    syscall