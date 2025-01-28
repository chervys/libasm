section .text
global ft_read
extern __errno_location

; ssize_t ft_read(int fd, void *buf, size_t count);

; syscall,  rax,    rdi,    rsi,    rdx,    r10,    r8,     r9
; read,     0,      fd,     buf,    count,  0,      0,      0

ft_read:
    mov rax, 0              ; rax = 0 (syscall number for read)
    syscall
    cmp rax, 0              ; rax == 0
    jl .error               ; if rax < 0 jump to .error
    ret

.error:
    neg rax                 ; rax = -rax
    push rax                ; save error code on the stack
    call __errno_location wrt ..plt   ; get the address of errno and store it in rax
    pop QWORD [rax]         ; store error code directly in errno
    mov rax, -1             ; rax = -1
    ret
