#include "include/Class.h" // for add
#include "mylibrary.h"    // for myLibraryFunction
#include <cstdlib>        // for free, malloc
#include <limits>         // for numeric_limits

int some_function(int a) { return a; }

int main() {
  Derived derivedObj;
  derivedObj.foo(); // Calls Derived::foo()

  myLibraryFunction();

  int *array = new int[10];

  // Writing beyond the bounds of the allocated memory
  for (int i = 0; i <= 10; ++i) {
    array[i] = i;
  }

  delete[] array;

  // undefined behavior
  int x = std::numeric_limits<int>::max(); // Maximum value for int
  int y = x + 1; // Undefined behavior: Overflowing beyond max int
  
  return 0;
}
