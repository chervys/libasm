section .text
global ft_strdup
extern ft_strlen
extern malloc

; char *ft_strdup(const char *s);

;               rax,    rdi,    rsi,    rdx,    rcx,    r8,     r9
; ft_strdup,    -,      s,      -,      -,      -,      -,      -

ft_strdup:
    push rbx                ; save rbx
    mov rbx, rdi            ; rbx = s
    call ft_strlen          ; rax = ft_strlen(s)
    add rax, 1              ; rax = rax + 1

    mov rdi, rax            ; rdi = sizeof(s) + 1
    call malloc wrt ..plt   ; rax = malloc(sizeof(s) + 1)
    cmp rax, 0
    je .error               ; if rax == 0 then jump to .alloc_fail

    mov rdi, rax            ; rdi = dst
    mov rsi, rbx            ; rsi = src
    push rax                ; save rax => rax = dst
    jmp .copy

.error:
    xor rax, rax        ; rax = 0 => rax = NULL
    pop rbx             ; restore rbx
    ret

.copy:
    mov dl, [rsi]       ; store current character of src in dl
    mov [rdi], dl       ; copy character of dl in dst
    cmp dl, 0
    je .end             ; if dl == 0 then jump to .end
    inc rdi             ; move to the next character in dst
    inc rsi             ; move to the next character in src
    jmp .copy

.end:
    pop rax             ; restore rax => rax = dst
    pop rbx             ; restore rbx
    ret
