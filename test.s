.data

.balign 4
print_pattern1: .asciz "%d + %d = %d\n"

.balign 4
print_pattern2: .asciz "%d - %d = %d\n"

.balign 4
print_pattern3: .asciz "%d * %d = %d\n"

.balign 4
print_pattern4: .asciz "%d / %d = %d\n"

.balign 4
input_form: .asciz "input two number : "

.balign 4
scan_pattern: .asciz "%d %d"

.balign 4
num1: .word 0

.balign 4
num2: .word 0

.balign 4
return: .word 0

.balign 4
return2: .word 0 

.text
add:
	ldr r4, address_of_return2				
	str lr, [r4]											
	
	add r3, r0, r1
	mov r2, r1
	mov r1, r0
	ldr r0, address_of_print1
	
	bl printf
	
	ldr lr, address_of_return2				
	ldr lr, [lr]
	bx lr
	
sub:
	ldr r4, address_of_return2				
	str lr, [r4]											
	
	sub r3, r0, r1
	mov r2, r1
	mov r1, r0
	ldr r0, address_of_print2
	
	bl printf
	
	ldr lr, address_of_return2				
	ldr lr, [lr]
	bx lr
	
mul:
	ldr r4, address_of_return2				
	str lr, [r4]											
	
	mul r3, r0, r1
	mov r2, r1
	mov r1, r0
	ldr r0, address_of_print3
	
	bl printf
	
	ldr lr, address_of_return2				
	ldr lr, [lr]
	bx lr

div:
	ldr r4, address_of_return2				
	str lr, [r4]											
	
	sdiv r3, r0, r1
	mov r2, r1
	mov r1, r0
	ldr r0, address_of_print4
	
	bl printf
	
	ldr lr, address_of_return2				
	ldr lr, [lr]
	bx lr

address_of_return2: .word return2

.global main
main:
	ldr r1, address_of_return					
	str lr, [r1]

	ldr r0, address_of_scan_pattern
	ldr r1, address_of_num1						
	ldr r2, address_of_num2
	bl scanf													
	
	cmp r0, #2
	bne end_wrong

	ldr r0, address_of_num1
	ldr r0, [r0]
	ldr r1, address_of_num2
	ldr r1, [r1]
	bl add
	
	ldr r0, address_of_num1
	ldr r0, [r0]
	ldr r1, address_of_num2
	ldr r1, [r1]
	bl sub
	
	ldr r0, address_of_num1
	ldr r0, [r0]
	ldr r1, address_of_num2
	ldr r1, [r1]
	bl mul

		
	ldr r0, address_of_num1
	ldr r0, [r0]
	ldr r1, address_of_num2
	ldr r1, [r1]
	
	cmp r1, #0
	beq end_wrong
	
	bl div				

end_success:
	ldr lr, address_of_return
	ldr lr, [lr]	
	mov r0, #0
	bx lr	

end_wrong:
	ldr lr, address_of_return
	ldr lr, [lr]	
	mvn r0, #-1
	add r0, r0, #1
	bx lr
	
address_of_print1: .word print_pattern1
address_of_print2: .word print_pattern2
address_of_print3: .word print_pattern3
address_of_print4: .word print_pattern4
address_of_scan_pattern: .word scan_pattern
address_of_num1: .word num1
address_of_num2: .word num2
address_of_return: .word return

/* External */
.global printf
.global scanf
