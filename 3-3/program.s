.global _start
_start:
    mov r1, #50
    mov r2, #60
    adds r0, r1, r2
    mov r7, #1
    swi 0

