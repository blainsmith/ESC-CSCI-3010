; Compiled with https://www.nasm.us
; > nasm -f elf64 addup_linux.asm -o addup.o

%define ARRAY_MAX_SIZE 1000

    SECTION .data

primesArray: times ARRAY_MAX_SIZE dd 1

    SECTION .text
    
    global primes

; The arguments from primes are placed into registers edi, esi, edx.
; 
; The return value of the function is pulled from eax.
primes:
    ; Read the argument from the C program and error if it is greater than 1000
    mov edi, [esp+4]
    cmp edi, ARRAY_MAX_SIZE
    jg error

    ; Set the counter to zero
    mov ecx, 0
fill:
    mov [primesArray + edx * 4], edx
    inc edx
    cmp edx, ARRAY_SIZE + 1
    jne fill

    mov eax, [primesArray + 1 * 4] ; move the result into the return register
    ret                            ; retrun the sum
error:
    mov eax, -1
    ret
