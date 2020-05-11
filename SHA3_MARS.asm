
######################## SHA3-256 Function Test #######################

#original		63348	cycles	232	cycle/byte
#xor5     	only	61428  	cycles	225	cycle/byte
#rot64mem 	only	51540	cycles	189	cycle/byte
#chi      	only	56148  	cycles	206	cycle/byte
#rot64Reg 	only 	62388   cycles 	229 	cycle/byte
#all			41460   cycles	152 	cycle/byte
   

#explanation:
#this is the SHA3-256 function ((test)), it intiates Hash matrix A base address, message base address and message size in words as inputs for SHA3-256 function 
#the function itself  intializes  RC and r
#this function operates assuming that the input is padded and alligned


###################### inputs intialization (should be given by caller Function or user) ################
#$a0 Hash matrix A base address
#$a1 message base address
#$a2 message size in words


lui $a0, 0x1001			#intialize address of A =0x10010190
ori $a0,$a0, 0x0190


lui $a1, 0x1001				#intializing m base =0x10010320
ori $a1,$a1, 0x0320

# the following part should be changed by the application
addi $t0, $0, 0
addi $t1, $0, 1
addi $t2, $0, 2
addi $t3, $0, 3
addi $t4, $0, 4
addi $t5, $0, 5
addi $t6, $0, 6
addi $t7, $0, 7

sw $0, 0($a1)
sw $t0, 4($a1)
sw $0, 8($a1)
sw $t1, 12($a1)
sw $0, 16($a1)
sw $t2, 20($a1)
sw $0, 24($a1)
sw $t3, 28($a1)
sw $0, 32($a1)
sw $t4, 36($a1)
sw $0, 40($a1)
sw $t5, 44($a1)
sw $0, 48($a1)
sw $t6, 52($a1)
sw $0, 56($a1)
sw $t7, 60($a1)
sw $0, 64($a1)
sw $t0, 68($a1)
sw $0, 72($a1)
sw $t1, 76($a1)
sw $0, 80($a1)
sw $t2, 84($a1)
sw $0, 88($a1)
sw $t3, 92($a1)
sw $0, 96($a1)
sw $t4, 100($a1)
sw $0, 104($a1)
sw $t5, 108($a1)
sw $0, 112($a1)
sw $t6, 116($a1)
sw $0, 120($a1)
sw $t7, 124($a1)
sw $0, 128($a1)
sw $t0, 132($a1)
sw $0, 136($a1)
sw $t1, 140($a1)
sw $0, 144($a1)
sw $t2, 148($a1)
sw $0, 152($a1)
sw $t3, 156($a1)
sw $0, 160($a1)
sw $t4, 164($a1)
sw $0, 168($a1)
sw $t5, 172($a1)
sw $0, 176($a1)
sw $t6, 180($a1)
sw $0, 184($a1)
sw $t7, 188($a1)
sw $0, 192($a1)
sw $t0, 196($a1)
sw $0, 200($a1)
sw $t1, 204($a1)
sw $0, 208($a1)
sw $t2, 212($a1)
sw $0, 216($a1)
sw $t3, 220($a1)
sw $0, 224($a1)
sw $t4, 228($a1)
sw $0, 232($a1)
sw $t5, 236($a1)
sw $0, 240($a1)
sw $t6, 244($a1)
sw $0, 248($a1)
sw $t7, 252($a1)
sw $0, 256($a1)
sw $t0, 260($a1)
sw $0, 264($a1)
sw $t1, 268($a1)
sw $0, 272($a1)

addi $a2, $0, 68	#message size in words
jal SHA3_256		#call SHA#_256 function
j end_sponge_test	#placed at the end of the file but is a part of the test function not the SHA3 function




######################## SHA3-256 Function #######################

#explanation:
#this is the SHA3-256 ((function)), it takes Hash matrix A base address, message base address and message size in words as inputs
#the function itself  intializes  Rotation Constatnts RC and rotation values
#this function operates assuming that the input is padded and alligned


#inputs:                                    
#$a0 Hash matrix A base address
#$a1 message base address
#$a2 message size in words

SHA3_256: 
addi $sp, $sp, -4 			# make space on stack to store one register
sw $ra, 0($sp) 				# save $ra on stack	
	
	
initializations: 			#these initializations are  part of the function itself

add $s2, $a2, $0 			#save $a2 as we need $a2 in partionoing and need $a2 for RC 
add $s1, $a1, $0 			#save $a1 as we need $a1 in partioning and need $a1 as rotation value

lui $a1, 0x1001				#intializing rotation values base address =0x10010000

# intializing rotation values
addi $t0, $0, 0
sw $t0, 0($a1)

addi $t0, $0, 1
sw $t0, 4($a1)

addi $t0, $0, 62
sw $t0, 8($a1)

addi $t0, $0, 28
sw $t0, 12($a1)

addi $t0, $0, 27
sw $t0, 16($a1)

addi $t0, $0, 36
sw $t0, 20($a1)

addi $t0, $0, 44
sw $t0, 24($a1)

addi $t0, $0, 6
sw $t0, 28($a1)

addi $t0, $0, 55
sw $t0, 32($a1)

addi $t0, $0, 20
sw $t0, 36($a1)

addi $t0, $0, 3
sw $t0, 40($a1)

addi $t0, $0, 10
sw $t0, 44($a1)

addi $t0, $0, 43
sw $t0, 48($a1)

addi $t0, $0, 25
sw $t0, 52($a1)

addi $t0, $0, 39
sw $t0, 56($a1)

addi $t0, $0, 41
sw $t0, 60($a1)

addi $t0, $0, 45
sw $t0, 64($a1)

addi $t0, $0, 15
sw $t0, 68($a1)

addi $t0, $0, 21
sw $t0, 72($a1)

addi $t0, $0, 8
sw $t0, 76($a1)

addi $t0, $0, 18
sw $t0, 80($a1)

addi $t0, $0, 2
sw $t0, 84($a1)

addi $t0, $0, 61
sw $t0, 88($a1)

addi $t0, $0, 56
sw $t0, 92($a1)

addi $t0, $0, 14
sw $t0, 96($a1)


lui $a3, 0x1001 			#intializing scrambling positions base address =0x10010064
ori $a3,$a3, 0x0064

# intialize scrambling positions
addi $t0, $0, 0
sw $t0, 0($a3)

addi $t0, $0, 80
sw $t0, 4($a3)

addi $t0, $0, 160
sw $t0, 8($a3)

addi $t0, $0, 40
sw $t0, 12($a3)

addi $t0, $0, 120
sw $t0, 16($a3)

addi $t0, $0, 128
sw $t0, 20($a3)

addi $t0, $0, 8
sw $t0, 24($a3)

addi $t0, $0, 88
sw $t0, 28($a3)

addi $t0, $0, 168
sw $t0, 32($a3)

addi $t0, $0, 48
sw $t0, 36($a3)

addi $t0, $0, 56
sw $t0, 40($a3)

addi $t0, $0, 136
sw $t0, 44($a3)

addi $t0, $0, 16
sw $t0, 48($a3)

addi $t0, $0, 96
sw $t0, 52($a3)

addi $t0, $0, 176
sw $t0, 56($a3)

addi $t0, $0, 184
sw $t0, 60($a3)

addi $t0, $0, 64
sw $t0, 64($a3)

addi $t0, $0, 144
sw $t0, 68($a3)

addi $t0, $0, 24
sw $t0, 72($a3)

addi $t0, $0, 104
sw $t0, 76($a3)

addi $t0, $0, 112
sw $t0, 80($a3)

addi $t0, $0, 192
sw $t0, 84($a3)

addi $t0, $0, 72
sw $t0, 88($a3)

addi $t0, $0, 152
sw $t0, 92($a3)

addi $t0, $0, 32
sw $t0, 96($a3)


lui $a2, 0x1001				#intializing RC (Rotation Constants) base address =0x100100c8
ori $a2,$a2, 0x00c8			# $a2 now holds RC base address instead of message size which is now in $s2


#intialization of RC
lui $t0, 0x8000

sw $0, 0($a2)
ori $t1, $0, 0x1
sw $t1, 4($a2)

sw $0, 8($a2)
ori $t1, $0, 0x8082
sw $t1, 12($a2)

sw $t0, 16($a2)
ori $t1, $0, 0x808a
sw $t1, 20($a2)

sw $t0, 24($a2)
ori $t1, $t0, 0x8000
sw $t1, 28($a2)

sw $0, 32($a2)
ori $t1, $0, 0x808b
sw $t1, 36($a2)

sw $0, 40($a2)
ori $t1, $t0, 0x1
sw $t1, 44($a2)

sw $t0, 48($a2)
ori $t1, $t0, 0x8081
sw $t1, 52($a2)

sw $t0, 56($a2)
ori $t1, $0, 0x8009
sw $t1, 60($a2)

sw $0, 64($a2)
ori $t1, $0, 0x8a
sw $t1, 68($a2)

sw $0, 72($a2)
ori $t1, $0, 0x88
sw $t1, 76($a2)

sw $0, 80($a2)
ori $t1, $t0, 0x8009
sw $t1, 84($a2)

sw $0, 88($a2)
ori $t1, $t0, 0xa
sw $t1, 92($a2)

sw $0, 96($a2)
ori $t1, $t0, 0x808b
sw $t1, 100($a2)

sw $t0, 104($a2)
ori $t1, $0, 0x8b
sw $t1, 108($a2)

sw $t0, 112($a2)
ori $t1, $0, 0x8089
sw $t1, 116($a2)

sw $t0, 120($a2)
ori $t1, $0, 0x8003
sw $t1, 124($a2)

sw $t0, 128($a2)
ori $t1, $0, 0x8002
sw $t1, 132($a2)

sw $t0, 136($a2)
ori $t1, $0, 0x80
sw $t1, 140($a2)

sw $0, 144($a2)
ori $t1, $0, 0x800a
sw $t1, 148($a2)

sw $t0, 152($a2)
ori $t1, $t0, 0xa
sw $t1, 156($a2)

sw $t0, 160($a2)
ori $t1, $t0, 0x8081
sw $t1, 164($a2)

sw $t0, 168($a2)
ori $t1, $0, 0x8080
sw $t1, 172($a2)

sw $0, 176($a2)
ori $t1, $t0, 0x1
sw $t1, 180($a2)

sw $t0, 184($a2)
ori $t1, $t0, 0x8008
sw $t1, 188($a2)




partioning: 			#partitioning the message into blocks of the rate size (r) which = 1088 bits (34 words) for SHA3_256 
   																		
addi $t0,$0,34  		#words in r 															    										
and $s3,$0,$0 			# reset the counter  
num_r: 
	sub $s2,$s2,$t0 		
	addi $s3,$s3,1
bne $s2,$0,num_r
#now we have the number of r's in register $s3

main_loop:			#all the above are executed once. The upcoming loop is the main loop
addi $t0,$0,34  		#words in r 
add $t2, $a0, $0		#saving Hash matrix A base address for the next iteration as the register will changed
	mov_r:
		lw $s4, 0($s1) 	#the r words of the input message for this round
		lw $s5, 0($a0) 	#the output of the previous round ( for the first round we assume A is intially filled with zeros) 
		addi $t0,$t0,-1 #decrement loop counter
		xor $s6,$s4,$s5 #xor r words with the first r words of the previous round 
		sw $s6 ,0($a0) 	#save the output to $a0 to form the new Hash matrix A
		addi $a0,$a0,4	#increment the Hash matrix A word entry address
		addi $s1,$s1,4 	#increment the r counter to get another word of message next iteration
		bne $t0,$0,mov_r#iterations end after moving all the r words of the partition
	#now we moved the r words of the input message XORed with the r words of the old Hash matrix to the first 1088 bit of the new Hash matrix leaving last 512 bits as old
	#this new Hash matrix is the input for Keccak-f Function
		
	add $a0,$t2,$0		#retriving the Hash matrix address again after the register has been changed
	addi $s3,$s3,-1     	#repeat for r times (number of partioins we calculated before)

	addi $sp, $sp, -8 			# make space on stack to store two register
	sw $s3, 0($sp) 				# save $s3 on stack	
	sw $s1, 4($sp) 				# save $s1 on stack
	
	#CALL F
	jal keccak_f

	lw $s3, 0($sp) 				# load $s3 from stack
	lw $s1, 4($sp) 				# load $s1 from stack
	
	addi $sp, $sp, 8 			# retrive space for stack after loading two registers

	bne  $s3,$0,main_loop 			#iterations end when all message partions are taken


end_SHA3_256:
lw $ra, 0($sp) 				# load $ra from stack
addi $sp, $sp, 4 			# retrive space for stack after loading one registers
jr $ra






########################## KECCAK-F #######################
#Keccak-f

#explanation:
#this is the five keccak functions as one function rounded 24 times
#this function takes state matrix A base in $a0, rotation value r base in $a1 and round constant RC base in $a2 and changes A 


#inputs: 
#A base passed to $a0
#r base 			    passed to $a1
#RC base 			    passed to $a2
#scramble addresess     $a3



keccak_f:
add $s7, $0, $0
addi $sp, $sp, -4			# make space on stack to store one register
#may need nop
sw $ra, 0($sp) 				# save $ra on stack

Round_Loop:

#theta
jal theta

#rho_pi
addi $sp, $sp, -4 			# make space on stack to store one register
sw $a2, 0($sp) 				# save $a2 on stack

lui $a2, 0x1001				#intializing  B base =0x10010258
ori $a2,$a2, 0x0258

jal Pi_Rho

#Chi

lw $a2, 0($sp) 				# restore $a2 from stack
sw $a1, 0($sp) 				# save $a1 on stack

lui $a1, 0x1001				#intializing  B base =0x10010258
ori $a1, $a1, 0x0258

jal ChiFunc



#Iota


lw $s0, 0($sp) 				# restore $a1 from stack
addi $sp, $sp, 4 			# deallocate stack space by 1 register

add $a1, $s7, $0 			#a1 = round index
jal Iota

addi $s7, $s7, 8 			#round index ++
addi $s1, $0, 192 			#end of round index array
add $a1, $s0, $0 			#a1 = r base
bne $s7, $s1, Round_Loop


end_rounds:
lw $ra, 0($sp) 				# restore $ra from stack
addi $sp, $sp, 4 			# deallocate stack space by one register
jr $ra           



########################## THETA ##########################
#theta step

#explanation:
#we start the program having a state matrix already drieved from string from previous stages 
#we have a matrix of 1600 bits in 5*5*64 organized in memorey as first 64 bits (lane) then 2nd lane until 5 lanes (plane) then another plane until 5 planes
#so we have 25 * (64 bits), each 64 bits are stored in memrey as 2 * 32 bit (word) 
#so we have 50 words in memorey representing the state, and all funtions are operated on theses words as every 2 words represents 1 lane
#so fir9*st lane spans 8 addresses in memorey and in order to reach 2nd lane i have to add 8 to the address.


#inputs: 
#(state matrix address) passed to $a0


#static registers through the function:
# $a0 base of A 
# $s0 base of C 
# $s1 base of D


theta:

# no need to push any saved registers in stack

lui $s0, 0x1001				#intializing C (and B later) base =0x10010258
ori $s0,$s0, 0x0258

#computing C (Xoring planes):

add $t9, $a0, $0 			#changable address for A
add $t8, $s0, $0 			#changable adress for C
addi $t7, $s0, 40  			#last address for C + 1 (end of iterations)


C_loop:
#note this sequence is scrambled in order to prevent stalls check main code before optmization
lw $t0, 0($t9) 				#loading a half of a lane of 1st plane
lw $t1, 40($t9) 			#loading a half of a lane of 2nd plane (the above half lane)
lw $s2, 80($t9) 			#loading above half lanes
xor $t0, $t0, $t1  			#Xoring above half lanes
lw $t1, 120($t9) 			#loading above half lanes
xor $t0, $t0, $s2  			#Xoring above half lanes
lw $s2, 160($t9) 			#loading above half lanes
xor $t0, $t0, $t1  			#Xoring above half lanes
xor $t0, $t0, $s2 			#Xoring above half lanes
sw $t0, 0($t8)  			#store the final xored half lane in half lane of C
addi $t8, $t8, 4 			#increase C address
addi $t9, $t9, 4 			#increase A address
bne $t8, $t7, C_loop 			#when we reach the 5th lane of C we stop





#computing A dash (rotation + Xoring)

#rotation:

addi $t9, $0, 0 			#changable base of C for lanes
addi $t8, $0, 0   			#changable base of Crot for lanes
addi $t7, $0, 0   			#changable base of D for lanes
addi $t6, $0, 40 			#last base for D + 1 (end of iterations)
addi $t5, $0, 32 			#base of last lane of D	

A_loop:

beq $t7, $0, roll_left 			#if index of D is zero then go to roll_left to compute C base and Crot Base	
beq $t7, $t5, roll_right 		#if index of D is 32 (base of last lane of D) then go to roll_right to compute C base and Crot Base	

addi $t8, $t7, 8 			#if non of above cconditions Crot_base = D_base + 8
addi $t9, $t7, -8 			#C_base = D_base - 8
j rot

roll_left:
addi $t8, $t7, 8 			#Crot_base = D_base + 8
addi $t9, $0, 32 			#C_base = 32
j rot

roll_right:
addi $t8, $0, 0 			#Crot_base = 0
addi $t9, $t7, -8 			#C_base = D_base - 8
j rot







rot: 						#should be generalized for rho step
add $t0, $s0, $t8 			#Crot address = C static address + Crot Base

lw $t1, 0($t0) 				#load 1st half of lane from Crot 
lw $t3, 4($t0)  			#load 2d half of lane from Crot 

srl $t2, $t1, 31 			#shift right by 31 to get last bit alone
sll $t1, $t1, 1 			#shift left by one 

srl $t4, $t3, 31 			#shift right by 31 to get last bit alone
sll $t3, $t3, 1 			#shift left by one

or $t1, $t1, $t4  			#concatinaation
or $t3, $t3, $t2 			#concatinaation 



#Xoring:
#note this sequence is scrambled in order to prevent stalls check main code before optmization
add $t0, $s0, $t9 			#C address = C static address + C Base
lw $t4, 0($t0) 				#load 1st half of lane from C
#put here to prevent stall
add $s4, $a0, $t7
xor $t1, $t1, $t4 			#Xor C with Crot
lw $s3, 0($s4) 				#load half lane of 1st plane
lw $s5, 40($s4) 			#load half lane of 2nd plane
xor $s3, $s3, $t1 			#Xor A half lane with coressponding D half lane 
sw $s3, 0($s4)  			#store the final xored lane in A
lw $s3, 80($s4)
xor $s5, $s5, $t1 			#Xor A half lane with coressponding D half lane 
sw $s5, 40($s4)  			#store the final xored lane in A
lw $s5, 120($s4)
xor $s3, $s3, $t1
sw $s3, 80($s4)  	
lw $s3, 160($s4)
xor $s5, $s5, $t1
sw $s5, 120($s4)  	
xor $s3, $s3, $t1
sw $s3, 160($s4)  	

#put here to prevent stall
addi $t7, $t7, 8 			#increase D array index

lw $t4, 4($t0) 				#load 2nd half of lane from C
#put here to prevent stall
addi $s4, $s4, 4
xor $t3, $t3, $t4  			#Xor C with Crot
lw $s3, 0($s4) 				#load half lane of 1st plane
lw $s5, 40($s4) 			#load half lane of 2nd plane
xor $s3, $s3, $t3 			#Xor A half lane with coressponding D half lane 
sw $s3, 0($s4)  			#store the final xored lane in A
lw $s3, 80($s4)
xor $s5, $s5, $t3 			#Xor A half lane with coressponding D half lane 
sw $s5, 40($s4)  			#store the final xored lane in A
lw $s5, 120($s4)
xor $s3, $s3, $t3
sw $s3, 80($s4)  	
lw $s3, 160($s4)
xor $s5, $s5, $t3
sw $s5, 120($s4)  	
xor $s3, $s3, $t3
sw $s3, 160($s4)  	




bne $t7, $t6, A_loop 		#when we reach the 5th lane of D we stop


jr $ra



########################## PI & RHO ##########################


#Pi & Rho function Pure

#explanation:
#this function takes state matrix A base in $a0 , rotation array r base in $a1 and  B base in $a2
#function apply rotation by r for each lane then scramble theses lanes 

#inputs: 
#A base passed to $a0
#r base $a1
#B base $a2
#scramble $a3


#static registers through the function:
#$s0  $a0
#$s1  $a1
#$s2  $a2
#$s3 8
#$s4 40
#$s5 2
#$t4 3
#$t5 5
#$t6 4


Pi_Rho:

#I should push $s0 $s1 $s2 $s3 $s4 $s5 $ra in the stack

addi $sp, $sp, -4 			# make space on stack to store one register
sw $a3, 0($sp) 				# save $ra3on stack


# save first lane with no changes
lw $t0, 0($a0)
lw $t1, 4($a0)
sw $t0, 0($a2)
sw $t1, 4($a2)

addi $s0, $a0, 8 			#use s0 equalls $a0 + 8 to skip first lane 
addi $s1, $a1, 4 			#use s1 instead of a1 because a1 will be used in rot function
addi $s2, $a2, 0 			#use s2 instead of a2 because a2 will be used in rot function
addi $a3, $a3, 4
addi $s3, $0, 24 			# last index of last lane in state matrix
addi $t2, $0, 32 


loop_PI_Rho:
lw $t3, 0($s0) 				#load most 32 bits
lw $t4, 4($s0) 				#load least 32 bits
lw $t5, 0($s1) 				#lod rotation value
lw $t0, 0($a3) 				#load index of scrambeled address

Rot:
			
sub $t9, $t2, $t5 			#$t9 = 32 - N
slti $t6, $t5, 32 			#is rotation < 32

sllv $t8, $t3, $t5 			#shift left Most by N
srlv $t7, $t4, $t9 			#shift right least by (32 - N)
or $v0, $t8, $t7 			#or both and save in $v0

sllv $t8, $t4, $t5  		#shift left least by N
srlv $t7, $t3, $t9 			#shift right most by (32 - N)
or $v1, $t8, $t7  			#or both and save in $v1

bgtz $t6,end_rot 				#skip next 3 lines if rotation < 32

add $t9, $v0, $0 			#swappping $v0 and $v1 
add $v0, $v1, $0
add $v1, $t9, $0

end_rot:


add $t1, $t0, $s2 			#calculate scarmbled address
sw $v0, 0($t1) 				#store rotated lane in B
sw $v1, 4($t1) 				#store rotated lane in B
addi $s3, $s3, -1
addi $s0, $s0, 8
addi $s1, $s1, 4
addi $a3, $a3, 4

bne $s3, $0, loop_PI_Rho 




lw $a3, 0($sp) 				# save $ra on stack
addi $sp, $sp, 4 			# make space on stack to store one register
jr $ra

########################## CHI ##########################

#Chi function Pure

#explanation:
#this function takes state matrix B base in $a1 and  A base in $a0
#function Xors first lane with (Not 2nd lane AND 3d lane)

#inputs: 
#B base  $a1
#A base $a0



#static registers through the function:
#$a1 					#base of B
#$a0 					#base of A
#$s0 					#8
#$s1 					#s1 is somtimes 40 and sometimes 3 to reuse registers
#$s2 					#4




ChiFunc:
add $s0, $a0, $0
add $s1, $a1, $0
addi $s3, $0, 5

Outer_Loop:
addi $s2, $0, 2





Inner_Loop:	

lw $t0, 0($s1)
lw $t1, 8($s1)
lw $t2, 16($s1)
lw $t3, 24($s1)
lw $t4, 32($s1)

nor $t5, $t1, $0 			#NOT 2nd lane
and $t5, $t5, $t2 			#3rd lane AND (NOT 2nd lane) 
xor $t5, $t5, $t0 			#1st lane XOR previous
sw $t5, 0($s0)

nor $t5, $t2, $0 			#NOT 2nd lane
and $t5, $t5, $t3 			#3rd lane AND (NOT 2nd lane) 
xor $t5, $t5, $t1 			#1st lane XOR previous
sw $t5, 8($s0)

nor $t5, $t3, $0 			#NOT 2nd lane
and $t5, $t5, $t4 			#3rd lane AND (NOT 2nd lane) 
xor $t5, $t5, $t2 			#1st lane XOR previous
sw $t5, 16($s0)

nor $t5, $t4, $0 			#NOT 2nd lane
and $t5, $t5, $t0 			#3rd lane AND (NOT 2nd lane) 
xor $t5, $t5, $t3 			#1st lane XOR previous
sw $t5, 24($s0)

nor $t5, $t0, $0 			#NOT 2nd lane
and $t5, $t5, $t1 			#3rd lane AND (NOT 2nd lane) 
xor $t5, $t5, $t4 			#1st lane XOR previous
sw $t5, 32($s0)

addi $s2, $s2, -1
addi $s1, $s1, 4
addi $s0, $s0, 4

bne $s2, $0, Inner_Loop


addi $s3, $s3, -1
addi $s1, $s1, 32
addi $s0, $s0, 32

bne $0, $s3, Outer_Loop



jr $ra


########################## IOTA ##########################


#Iota function

#explanation:
#this function takes state matrix A base in $a0,  RC base in $a2 and round index ri in $a1
#function Xors A(0,0) with RC(ri))

#inputs: 
#A base  $a0
#RC base $a2
#ri  $a1


#static registers through the function:
#$a0 					#base of A
#$a2 					#base of RC
#$a1  					#round index



Iota:

add $t0, $a1, $a2 			#address = ri + base of RC
lw $t1, 0($a0) 				#load first half of first lane
lw $t2, 0($t0) 				#load first half of RC
lw $t3, 4($a0) 				#load second half of first lane
lw $t4, 4($t0) 				#load second half of RC
xor $t1, $t1, $t2
xor $t3, $t3, $t4
sw $t1, 0($a0)
sw $t3, 4($a0)
jr $ra 







########################## END of Test ##########################
end_sponge_test:
nop
nop





