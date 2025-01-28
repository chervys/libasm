section .text
global ft_strcmp

; int ft_strcmp(const char *s1, const char *s2);

;              rax,    rdi,    rsi,    rdx,    rcx,    r8,     r9
; ft_strcmp,   -,      s1,     s2,     -,      -,      -,      -

ft_strcmp:
    jmp .cmp

.cmp:
    mov al, [rdi]   ; copy current character of s1 in al
    mov dl, [rsi]   ; copy current character of s2 in dl
    cmp al, dl
    jne .diff       ; if al != dl then jump to .diff
    cmp al, 0
    je .equal       ; if al == 0 then jump to .equal
    inc rdi         ; move to the next character in s1
    inc rsi         ; move to the next character in s2
    jmp .cmp

.diff:
    movzx eax, al   ; eax = al, movzx ==> move with zero extension
    movzx edx, dl   ; edx = dl
    sub eax, edx    ; eax = eax - edx => (unsigned char)s1[i] - (unsigned char)s2[i]
    ret

.equal:
    xor eax, eax       ; 1 == s2 ==> eax = 0 => rax = 0
    ret
