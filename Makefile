.PHONY: primes
primes:
	rm -fr ./bin && mkdir ./bin
	nasm -f elf ./program1/primes.asm -o ./bin/primes.o
	gcc -m32 -Wall -o ./bin/primes ./program1/primes.c ./bin/primes.o
	rm ./bin/primes.o