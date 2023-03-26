.data
input1: .space 50 @ allocate space for input1
input2: .space 50 @ allocate space for input2
yes: .ascii "YES\n"
not: .ascii "NO\n"

.text
.global _start
_start:
    @ read input1
    mov r7, #3        @ stdin
    mov r0, #0        @ keyboard
    ldr r1, =input1
    mov r2, #50
    swi 0

    @ read input2
    mov r7, #3        @ stdin
    mov r0, #0        @ keyboard
    ldr r1, =input2
    mov r2, #50
    swi 0

    @ check if input1 is in input2
    mov r3, #0        @ initialize index to 0
check:
    ldrb r4, [r1, r3] @ load a byte from input1
    cmp r4, #0        @ check if end of string
    beq end
    mov r5, #0        @ initialize flag to 0
    mov r6, #0        @ initialize index to 0
inner:
    ldrb r7, [r2, r6] @ load a byte from input2
    cmp r7, #0        @ check if end of string
    beq not_found
    cmp r4, r7        @ check if current bytes match
    bne next
    add r6, r6, #1    @ increment index for input2
    mov r5, #1        @ set flag to 1
    b inner
next:
    add r6, r6, #1    @ increment index for input2
    b inner
not_found:
    cmp r5, #0        @ check if a match was found
    beq no           @ if not, output "NO" and exit
    add r3, r3, #1    @ increment index for input1
    b check
end:
    @ output "YES" and exit
    mov r7, #4        @ stdout
    mov r0, #1        @ file descriptor
    ldr r1, =yes
    mov r2, #4
    swi 0
    b exit

no:
    @ output "NO" and exit
    mov r7, #4        @ stdout
    mov r0, #1        @ file descriptor
    ldr r1, =not
    mov r2, #3
    swi 0

exit:
    @ exit
    mov r7, #1        @ exit
    mov r0, #0
    swi 0
