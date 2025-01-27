section .text               ; Section declaration

; Declaration for the linker (ld)
global ft_write 
extern __errno_location

; ssize_t ft_write(int fd, const void buf[.count], size_t count);

; syscall,  rax,    rdi,   rsi,   rdx,   r10,   r8,   r9
; write,    1,      fd,    buf,   count, 0,     0,    0

ft_write:
    mov rax, 1              ; rax = 1 (syscall number for write)
    syscall
    cmp rax, 0              ; rax == 0
    jge .end                ; if rax >= 0 jump to .end
    jmp .error              ; jump to .error
.error:
    neg rax                 ; rax = -rax
    push rax                ; save error code on the stack
    call __errno_location   ; get the address of errno and store it in rax
    pop QWORD [rax]         ; store error code in errno
    mov rax, -1             ; rax = -1
    ret
.end:
    ret                     ; Return rax
