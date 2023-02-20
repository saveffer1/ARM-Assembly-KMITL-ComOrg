.global _start
_start:
    mov r7, #3        @ stdin
    mov r0, #0        @ keyboard
    ldr r1, =input_string
    mov r2, #1        @ อ่าน 1 ตัวอักษร
    swi 0

    ldrb r2, [r1]     @ อ่านตัวอักษรแรกที่อยู่ใน input_string มาเก็บไว้ที่ r2
    cmp r2, #'0' 
    blt _exit         @ ถ้า r2 มีค่าน้อยกว่า '0' ให้ออก
    cmp r2, #'9'
    bgt _exit         @ ถ้า r2 มีค่ามากกว่า '9' ให้ออก

    sub r2, r2, #'0'  @ เปลี่ยน ascii เป็น int

    ldr r3, =numbers   @ โหลด address ของตัวแปร numbers ไปเก็บไว้ที่ r3
    ldr r1, [r3, r2, lsl #2] @ เทียบ r2 กับตัวแปร numbers ที่อยู่ใน r3 แล้วโหลดอันที่ตรงกันมาเก็บไว้ที่ r1

    mov r7, #4        @ stdout
    mov r0, #1        @ monitor
    ldr r2, =6        @ แสดงแค่ 5 ตัวอักษร
    swi 0

_exit:
    mov r7, #1        @ ออก
    swi 0

.data
input_string: .space 1
numbers:
    .word zero, one, two, three, four, five, six, seven, eight, nine
zero: .ascii "Zero \n"
one: .ascii "One  \n"
two: .ascii "Two  \n"
three: .ascii "Three\n"
four: .ascii "Four \n"
five: .ascii "Five \n"
six: .ascii "Six  \n"
seven: .ascii "Seven\n"
eight: .ascii "Eight\n"
nine: .ascii "Nine \n"    
