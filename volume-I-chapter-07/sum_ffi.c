#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include "sum_ffi.h"

int main()
{
    printf("3 + 5 = %d\n", sum(3, 5));
    return 0;
}

int sum(int a, int b)
{
    return a + b;
}
