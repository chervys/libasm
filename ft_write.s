section .text
global ft_write 
extern __errno_location

; ssize_t ft_write(int fd, const void buf[.count], size_t count);

; syscall,  rax,    rdi,   rsi,   rdx,   r10,   r8,   r9
; write,    1,      fd,    buf,   count, 0,     0,    0

ft_write:
    test rsi, rsi                   ; test if buf is NULL
    jz .invalid_buffer              ; if buf is NULL jump to .error
    mov rax, 1                      ; rax = 1 (syscall number for write)
    syscall
    cmp rax, 0                      ; rax == 0
    jl .set_errno                   ; if rax < 0 jump to .set_errno 
    ret

.invalid_buffer:
    mov rax, -22                    ; rax = -22 (-EINVAL)
    jmp .set_errno

.set_errno:
    neg rax                         ; rax = -rax
    push rax                        ; save error code on the stack
    call __errno_location wrt ..plt ; get the address of errno and store it in rax
    pop QWORD [rax]                 ; store error code in errno
    mov rax, -1                     ; rax = -1
    ret
