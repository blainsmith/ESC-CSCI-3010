# ESC CSCI-3010: Computer Organization & Assembly Language

## Requirements

All programs were written, compiled, and tested on a 64-bit Intel CPU running Linux.

- Intel 32/64-bit CPU
- [NASM Assembler](https://www.nasm.us)
- [GCC](https://gcc.gnu.org)
- [Make](https://www.gnu.org/software/make)

## Program 1

Write a procedure in i7 assembly language to find the largest prime less than 1000.  Use the Sieve of Eratosthenes algorithm, and appropriate address jumps when looping.  Embed it in a C or C++ program to do the I/O.

1. Create an array of size last number of the range
2. Fill the array from 0 to last number using a loop [0, 1, 2, 3, ..., last number]
3. Iterate over the loop
    1. Read current number from array and check if its a zero
    2. If it is not a zero then fill the array with zeros for each multiple of the number
4. Loop over the array printing all non-zero numbers which will be prime numbers

```
> make primes
> ./bin/primes 10
```

## Program 2

Write a procedure in i7 assembly language to implement the Russian Peasant multiplication algorithm using shifting. Embed it in a C or C++ program to do the I/O.

```
> make rpm
> ./bin/rpm 20 12
```