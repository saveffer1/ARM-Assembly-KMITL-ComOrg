.global _start
.data
            .balign 4
msg_input:  .asciz "Enter year(AD): "
            .balign 4
msg_leap:   .asciz "Leap year. \n"
            .balign 4
msg_nleap:  .asciz "Not leap year. \n"
            .balign 4
msg_error:  .asciz "Input error! \n"
            .balign 4
input:      .asciz "%d"
            .balign 4
number:     .word 0
            .balign 4
return:     .word 0

.text
.global main
.global printf
.global scanf

main:
    LDR r1, =return
    STR lr, [r1]
    LDR r0, =msg_input
    BL printf

    LDR r0, =input
    LDR r1, =number
    BL scanf
    LDR r2,=number
    LDR r2,[r2]

    MOV r3,#100
    MOV r5, #400

    CMP r2,#1
    BLT error

divide_100:
    SDIV r4,r2,r3
    MUL  r6,r4,r3
    CMP  r2,r6
    BNE  divide_4

divide_400:
    SDIV r4,r2,r5
    MUL  r6,r4,r5
    CMP  r2,r6
    BEQ  _leapyear
    BNE  _notleapyear

divide_4:
    MOV r4, r2, LSR #2
    MOV r6, r4, LSL #2
    CMP r2, r6
    BNE  _notleapyear

_leapyear:
    LDR r0, =msg_leap
    BL printf
    LDR lr, =return
    LDR lr, [lr]
    BX lr
    B exit

_notleapyear:
    LDR r0, =msg_nleap
    BL printf
    LDR lr, =return
    LDR lr, [lr]
    BX lr
    B exit

error:
    LDR r0, =msg_error
    BL printf
    LDR lr, =return
    LDR lr, [lr]
    BX lr

exit:
    MOV r7, #1
    SWI 0
