section .text

; Déclaration pour le lien (ld)
global ft_strcpy

; char *ft_strcpy(char *dst, const char *src);
; Copies the string src to dst (including the '\0'), and returns dst.

;               rax,    rdi,    rsi,    rdx,    rcx,    r8,     r9
; ft_strcpy,    -,      dst,    src,    0,      0,      0,      0

ft_strcpy:
    mov rax, rdi    ; rax = dst
    jmp .cpy

.cpy:
    mov al, [rsi]   ; store current character of src in al
    mov [rdi], al   ; copy character of al to dst
    cmp al, 0
    je .end         ; if al == 0 then jump to .end
    inc rsi         ; move to the next character in src
    inc rdi         ; move to the next character in dst
    jmp .cpy

.end:
    ret
