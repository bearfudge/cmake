#include <stdio.h>

void NoDepBFunction();
void NoDepCFunction();
void SixAFunction();
void SixBFunction();

int main(void)
{
  SixAFunction();
  SixBFunction();
  NoDepBFunction();
  NoDepCFunction();

  printf("Dependency test executable ran successfully.\n");

  return 0;
}
