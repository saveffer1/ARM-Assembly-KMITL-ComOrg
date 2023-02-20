.global _start
_start:
_read:
    mov r7, #3
    mov r0, #0
    mov r2, #5
    ldr r1, =string
    swi 0

_write:
    mov r7, #4
    mov r0, #1
    mov r2, #19
    ldr r1, =string
    swi 0

_exit:
    mov r7, #1
    swi 0

    .data
string: .ascii "Hello World String\n"
