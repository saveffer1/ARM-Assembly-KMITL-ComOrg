.global _start
_start:
    mov r0, #77

_exit:
    MOV r7, #1
    SWI 0
