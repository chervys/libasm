section .text
global ft_strlen

; size_t ft_strlen(const char *s);

;               rax,    rdi,    rsi,    rdx,    rcx,    r8,     r9
; ft_strlen,    -,      s,      -,      -,      -,      -,      -

ft_strlen:
    xor rax, rax                ; rax = 0
.loop:
    cmp byte [rdi + rax], 0     ; Check if byte is 0.
    je .end                     ; If byte is 0, jump to end
    inc rax                     ; Increment rax
    jmp .loop                   ; Jump to .loop
.end:
    ret                         ; Return rax
