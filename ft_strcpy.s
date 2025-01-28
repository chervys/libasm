section .text
global ft_strcpy

; char *ft_strcpy(char *dst, const char *src);

;               rax,    rdi,    rsi,    rdx,    rcx,    r8,     r9
; ft_strcpy,    -,      dst,    src,    -,      -,      -,      -

ft_strcpy:
    push rdx        ; save rdx
    mov rax, rdi    ; rax = dst
    jmp .cpy

.cpy:
    mov dl, [rsi]   ; store current character of src in al
    mov [rdi], dl   ; copy character of al in dst
    cmp dl, 0
    je .end         ; if al == 0 then jump to .end
    inc rsi         ; move to the next character in src
    inc rdi         ; move to the next character in dst
    jmp .cpy

.end:
    pop rdx         ; restore rdx
    ret
