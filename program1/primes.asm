; Compiled with https://www.nasm.us
; > nasm -f elf64 addup_linux.asm -o addup.o
%define ARRAY_SIZE 1001

    SECTION .data

primesArray: times ARRAY_SIZE dd 0

    SECTION .text
    
    global primes

; The arguments from primes are placed into registers edi, esi, edx.
; 
; The return value of the function is pulled from eax.
primes:
    mov edx, 0

fill:
    mov [primesArray + edx * 4], edx
    inc edx
    cmp edx, ARRAY_SIZE + 1
    jne fill

    mov eax, [primesArray + 1 * 4] ; move the result into the return register
    ret                            ; retrun the sum