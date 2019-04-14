    SECTION .text
    
    global binstring

; Main entrypoint to set up the stack and copy input string into fixed output string
binstring:
    push    rbp
    mov     rbp, rsp
    mov     QWORD [rbp-24], rdi
    mov     QWORD [rbp-32], rsi
    mov     rax, QWORD [rbp-32]
    mov     edx, 9
    sub     edx, eax
    mov     eax, edx
    mov     DWORD [rbp-16], eax
    mov     eax, DWORD [rbp-16]
    mov     DWORD [rbp-4], eax
    jmp     fillResultLoop

; This actually copy the loop pointer character
fillResultBody:
    mov     eax, DWORD [rbp-4]
    sub     eax, DWORD [rbp-16]
    movsx   rdx, eax
    mov     rax, QWORD [rbp-24]
    add     rax, rdx
    movzx   edx, BYTE [rax]
    mov     eax, DWORD [rbp-4]
    cdqe
    mov     BYTE res[rax], dl
    add     DWORD [rbp-4], 1

; This is the outer loop to move the character counter and use the instructions above
; Once completed it will check the 1 index and check if it is a "1".
; If not it will jump to return
; Otherwise it will start the subtraction of 1 from the result
fillResultLoop:
    cmp     DWORD [rbp-4], 8
    jle     fillResultBody
    movzx   eax, BYTE res[rip+1]
    cmp     al, 49
    jne     returnResult
    mov     BYTE res[rip], 45 ; Calling out this line since this is where we add "-" to the beginning if negative
    mov     DWORD [rbp-8], 8
    jmp     subtractOneLoop

setDigitOne:
    mov     eax, DWORD [rbp-8]
    cdqe
    movzx   eax, BYTE res[rax]
    cmp     al, 48
    jne     setDigitZero
    mov     eax, DWORD [rbp-8]
    cdqe
    mov     BYTE res[rax], 49
    jmp     subtractOneBody

setDigitZero:
    mov     eax, DWORD [rbp-8]
    cdqe
    mov     BYTE res[rax], 48
    jmp     flipLoop

; Main subtraction control labels for setting a 1 or 0 character
; with setDigitOne or setDigitZero control labels
subtractOneBody:
    sub     DWORD [rbp-8], 1

subtractOneLoop:
    cmp     DWORD [rbp-8], 0
    jg      setDigitOne

; The following 5 blocks iterate through the result and flips 1's to 0's and vice versa
flipLoop:
    mov     DWORD [rbp-12], 1
    jmp     flipLoopBody

flipDigit:
    mov     eax, DWORD [rbp-12]
    cdqe
    movzx   eax, BYTE res[rax]
    cmp     al, 48
    jne     flipDigitZero
    mov     edx, 49
    jmp     flipDigitOne

flipDigitZero:
    mov     edx, 48

flipDigitOne:
    mov     eax, DWORD [rbp-12]
    cdqe
    mov     BYTE res[rax], dl
    add     DWORD [rbp-12], 1

flipLoopBody:
    cmp     DWORD [rbp-12], 8
    jle     flipDigit

; Set the result to eax, restore the pointer and return
returnResult:
    mov     eax, OFFSET FLAT:res
    pop     rbp
    ret