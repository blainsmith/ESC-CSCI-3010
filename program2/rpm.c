#include <stdio.h>
#include <stdlib.h>

#define LIMIT 1000 /*size of integers array*/

extern int rpm(int, int);
 
int local_rpm(int a, int b){
    int res = 0;  // initialize result 
  
    // While second number doesn't become 1 
    while (b > 0) 
    { 
         // If second number becomes odd, add the first number to result 
         if (b & 1) 
             res = res + a; 
  
         // Double the first number and halve the second number 
         a = a << 1; 
         b = b >> 1; 
     } 
     return res;
}

int main(int argc, char** argv) {
    int a = atoi(argv[1]);
    int b = atoi(argv[2]);

    printf("%d x %d: %d\n", a, b, rpm(a, b));
	
    return 0;
}
