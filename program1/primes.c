#include <stdio.h>
#include <stdlib.h>

#define LIMIT 1000 /*size of integers array*/

extern int primes(int);
 
int local_primes(){
    unsigned long long int i,j;
    int *primes;
 
    primes = malloc(sizeof(int) * LIMIT);
 
    for (i = 2;i < LIMIT; i++)
        primes[i] = 1;
 
    for (i = 2;i < LIMIT; i++)
        if (primes[i]) {
            for (j = i;i * j < LIMIT; j++)
                primes[i * j] = 0;
        }
 
    printf("\nPrime numbers in range 1 to %d are: \n", LIMIT);
    for (i = 2;i < LIMIT; i++)
        if (primes[i])
            printf("%lld ", i);
 
    return 0;
}

int main() {
    printf("largest prime under %d: %d\n", 1000, primes(1000));
    printf("largest prime under %d: %d\n", 64, primes(64));
    printf("largest prime under %d: %d\n", 10000, primes(10000));
	
    return 0;
}
