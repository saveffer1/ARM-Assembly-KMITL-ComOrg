.data
input_string: .space 2 @ 2 bytes
output_string: .ascii ""

.text
.global _start
_start:
    mov r7, #3 @ read
    mov r0, #0 @ stdin (จาก keyboard)
    ldr r1, =input_string @ buffer ที่จะเก็บค่าที่อ่าน
    mov r2, #2 @ จำนวน byte ที่จะอ่าน
    swi 0  

    ldr r2, =output_string @ buffer ที่จะเก็บค่าที่อ่าน
    mov r8, #0 @ ตัวนับ

loop:
    cmp r8, #7
    bgt print
    sub r1, r1, '0'
    mov r3, r1
    lsr r3, r1, r8
    and r3, r3, #1
    b setbit

setbit:
    add r8, r8, #1
    str r3, [r2, r8]
    b loop

print: @monitor print
    mov r7, #4 @ write
    mov r0, #1 @ stdout (จาก keyboard)
    ldr r1, =output_string
    mov r2, #8
    swi 0

_exit: @ exit
    mov r7, #1
    swi 0