    .file  "example.c"
    .intel_syntax noprefix
    .text
    .section .rodata
.LC0:
    .string "enter x: "
.LC1:
    .string "%d"
.LC2:
    .string "enter y: "
    .text
    .globl main
    .type  main, @function
main:
.LFB0:
    .cfi_startproc
    push rbp
    .cfi_def_cfa_offset 16
    .cfi_offset 6, -16
    mov rbp, rsp
    .cfi_def_cfa_register 6
    sub rsp, 32
    mov rax, QWORD PTR fs:40
    mov QWORD PTR -8[rbp], rax
    xor eax, eax
    mov DWORD PTR -16[rbp], 0
    lea rax, .LC0[rip]
    mov rdi, rax
    mov eax, 0
    call printf@PLT
    lea rax, -24[rbp]
    mov rsi, rax
    lea rax, .LC1[rip]
    mov rdi, rax
    mov eax, 0
    call __isoc99_scanf@PLT
    lea rax, .LC2[rip]
    mov rdi, rax
    mov eax, 0
    call printf@PLT
    lea rax, -20[rbp]
    mov rsi, rax
    lea rax, .LC1[rip]
    mov rdi, rax
    mov eax, 0
    call __isoc99_scanf@PLT
    mov DWORD PTR -12[rbp], 0
    jmp .L2
.L3:
    mov eax, DWORD PTR -20[rbp]
    add DWORD PTR -16[rbp], eax
    add DWORD PTR -12[rbp], 1

    leave
    .cfi_def_cfa 7, 8
    ret
    .cfi_endproc
.LFE0:
    .size    main, .-main
    .ident   "GCC: (GNU) 13.1.1 20230429"
    .section .note.GNU-stack,"",@progbits
