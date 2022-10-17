#include <stdio.h>
int multiply(int, int);

int main()
{
  int a, b, answer;
  
  printf("Enter 2 numbers:\n");
  scanf("%d %d", &a, &b);
  
  answer = multiply(a, b);
  printf("multiplication of %d and %d = %d", a, b, answer);
  
  return (0);
}

int multiply(int a, int b)
{
  return(a * b);
}