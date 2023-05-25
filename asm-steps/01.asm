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

    # TODO

    leave
    .cfi_def_cfa 7, 8
    ret
    .cfi_endproc
.LFE0:
    .size    main, .-main
    .ident   "GCC: (GNU) 13.1.1 20230429"
    .section .note.GNU-stack,"",@progbits
