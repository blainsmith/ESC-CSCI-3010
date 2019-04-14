#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char * binstring(char *, size_t len);

char res[10] = "+00000000\0";

char * local_binstring(char *a, size_t len){
    int offset = 9-len;

    for (int i = offset; i < 9; i++) {
        res[i] = a[i-offset];
    }

    if (res[1] == '1') {
        res[0] = '-';
        for (int i = 8; i >= 1; i--) {
            if (res[i] == '0') {
                res[i] = '1';
            } else {
                res[i] = '0';
                break;
            }
        }

        for (int i = 1; i < 9; i++) {
            res[i] = (res[i] == '0') ? '1' : '0';
        }
    }

    return res;
}

int main(int argc, char **argv) {
    char *a = argv[1];
    char *b = binstring(a, strlen(a));

    printf("%s -> %s\n", a, b);
	
    return 0;
}
