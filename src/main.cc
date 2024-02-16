#include "include/main.h" // for add
#include "mylibrary.h"    // for myLibraryFunction
#include <cstdlib>        // for free, malloc

int some_function(int a) { return a; }

int add(int a, int b) { return a + b; }

int main() {
  Derived derivedObj;
  derivedObj.foo(); // Calls Derived::foo()

  myLibraryFunction();
  
  int* array = new int[10];
    
  // Writing beyond the bounds of the allocated memory
  for (int i = 0; i <= 10; ++i) {
    array[i] = i;
  }
    
  delete[] array;

  return 0;
}
