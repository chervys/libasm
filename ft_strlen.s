section .text                   ; Section declaration

; Declaration for the linker (ld)
global ft_strlen

; size_t ft_strlen(const char *s);

ft_strlen:
    xor rax, rax                ; rax = 0
    jmp .loop                   ; Jump to .loop
.loop:
    cmp byte [rdi + rax], 0     ; Check if byte is 0.
    je .end                     ; If byte is 0, jump to end
    inc rax                     ; Increment rax
    jmp .loop                   ; Jump to .loop
.end:
    ret                         ; Return rax
