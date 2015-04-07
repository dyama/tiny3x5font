#include <stdio.h>
/*
 * This Code is Sample for Tiny 3x5 Font
 * By dyama <dyama@member.fsf.org>
 */

int fib(int k)
{
  if (k == 0) {
    return 0;
  }
  else if (k == 1) {
    return 1;
  }
  else if (k >= 2) {
    return fib(k-2) + fib(k-1);
  }
}

int main(int argc, char** argv)
{
  int k, n, a;
  for (k=0,n=10; k<n; k++) {
    a = fib(k);
    printf("%d ", a);
  }
  return 0;
}

