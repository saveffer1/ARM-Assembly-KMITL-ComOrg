.data
input_string: .space 5 @ 5 bytes
output_string: .space 10 @ 10 bytes

.text
.global _start
_start:
    mov r7, #3 @ read
    mov r0, #0 @ stdin (จาก keyboard)
    ldr r1, =input_string @ buffer ที่จะเก็บค่าที่อ่าน
    mov r2, #5 @ จำนวน byte ที่จะอ่าน
    swi 0  

    ldr r2, =output_string @ buffer ที่จะเก็บค่าที่อ่าน
    mov r8, #0 @ ตัวนับ

loop:
    ldr r5, [r1, r8] @ อ่านค่าจาก input_string มาเก็บใน r5
    add r5, r5, #5 @ บวก 5 กับค่าที่อ่านมา
    strb r5, [r2, r8] @ บันทึกค่าที่ได้ลง output_string

    add r8, r8, #1 @ บวก 1 ให้ r8 เพื่อเปลี่ยน index ของ buffer
    ldr r6, =10 @  โหลด /n ไปที่ r6
    strb r6, [r2, r8] @ บันทึกค่า /n ลง output_string
    add r2, r2, #1 @ บวก 1 ให้ r2 เพื่อเปลี่ยน index ของ buffer

    cmp r8, #5 @ ตรวจสอบว่า r8 มีค่าเท่ากับ 5 หรือไม่
    beq print @ ถ้าเท่ากับ 5 ให้ข้ามไปที่ print
    b loop @ ถ้าไม่เท่ากับ 5 ให้ loop ต่อ

print:
    mov r7, #4 @ write
    mov r0, #1 @ stdout (จาก keyboard)
    mov r2, #10 @ จำนวน byte ที่จะเขียน
    ldr r1, =output_string @ buffer ที่จะเก็บค่าที่อ่าน
    swi 0  

_exit:
    mov r7, #1
    swi 0
