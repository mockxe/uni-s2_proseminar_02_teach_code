    .file  "example.c"
    .intel_syntax noprefix
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

    leave
    .cfi_def_cfa 7, 8
    ret
    .cfi_endproc
.LFE0:
    .size    main, .-main
    .ident   "GCC: (GNU) 13.1.1 20230429"
    .section .note.GNU-stack,"",@progbits
