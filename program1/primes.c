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
        if (primes[i])
            for (j = i;i * j < LIMIT; j++)
                primes[i * j] = 0;
 
    printf("\nPrime numbers in range 1 to %d are: \n", LIMIT);
    for (i = 2;i < LIMIT; i++)
        if (primes[i])
            printf("%lld ", i);
 
    return 0;
}

int main() {
    int a, rtn;
	a = 10;
	rtn = primes(a);
    
    printf("%d", rtn);

    local_primes();
	
    return 0;
}
