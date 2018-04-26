#include "mylib/mylib.h"

#ifdef FASTPATH
#error Oops! You leaked the FASTPATH define to users from mylib
#endif

int main(int argc, char *argv[]) {
  hello();

  return 0;
}
