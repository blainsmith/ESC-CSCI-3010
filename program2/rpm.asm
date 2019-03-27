    SECTION .text
    
    global rpm

rpm:
    ; Set up the local stack and make room for a local variable
    push ebp
    mov ebp, esp
    sub esp, 4
    push edi
    push esi

    ; Get the arguments past in from the stack
    mov edi, [ebp+8]
    mov esi, [ebp+12]

    ; Set the local variable to zero
    mov dword [ebp-4], 0

whileLoop:
    ; Check if the second argument is odd
    ; if it is even skip right to bit shifting
    mov eax, esi
    mov edx, 0
    mov ecx, 2
    div ecx
    cmp edx, 0
    je shift

accumulate:
    ; If the second arcument is odd
    ; keep a running sum of the first arguments
    add dword [ebp-4], edi

shift:
    ; Double the first argument and half the second argument
    shl edi, 1
    shr esi, 1

    ; Continue looping while the second argument is greater than zero
    cmp esi, 0
    jg whileLoop

    ; Finally move the local variable sum to the return register
    mov eax, [ebp-4]

    ; Recover register values,
    ; deallocate local variable, and
    ; restore the caller's base pointer
    pop esi
    pop edi
    mov esp, ebp
    pop ebp
    ret