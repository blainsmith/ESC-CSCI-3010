; Compiled with https://www.nasm.us
; > nasm -f elf64 addup_linux.asm -o addup.o

%define ARRAY_MAX_SIZE 1000

    SECTION .data

primesArray: times ARRAY_MAX_SIZE dd 1

    SECTION .text
    
    global primes

primes:
    ; Read the argument from the C program and error if it is greater than 1000
    mov edi, [esp+4]
    cmp edi, ARRAY_MAX_SIZE
    jg error

    ; Set the counter to zero
    mov ecx, 0
fill:
    ; Fill the array with their indicies
    mov [primesArray + ecx * 4], ecx
    inc ecx
    cmp ecx, edi
    jne fill

    ; Rest the counter again, but start from 1 that increments to start from 2 at the next instruction
    mov ecx, 1

outerLoop:
    ; Jump to the end after iterating the array
    inc ecx
    cmp ecx, edi
    jge find

    ; If the value is no zero,
    ; copy the counter value to a new counter
    mov esi, ecx

innerLoop:
    ; Copy the outer counter and
    ; multiply it by the inner counter
    mov eax, ecx
    mul esi

    ; If the product is larger than the range
    ; return to the outer loop
    cmp eax, edi
    jge outerLoop

    ; If the product is smaller than the range
    ; set the multiple to zero, increment, and
    ; loop again to the next multiple
    mov edx, 0
    mov [primesArray + eax * 4], edx
    inc esi
    cmp esi, edi
    jl innerLoop

find:
    dec edi
    mov ecx, edi

findLoop:
    ; Loop through the array in reverse finding the first non-zero number
    mov eax, [primesArray + ecx * 4]
    dec ecx
    cmp eax, 0
    je findLoop

    ; The non-zero number is in eax which is the return register
    ; so just return from the function
    ret

error:
    mov eax, -1
    ret
