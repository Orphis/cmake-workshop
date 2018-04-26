#include "impl/mylib_impl.h"

#include <iostream>

#ifndef FASTPATH
#error For this exercise, mylib requires the FASTPATH define to be set, it should not leak to users
#endif

void mylib_impl() {
  std::cout << "Hello world!" << std::endl;
}
