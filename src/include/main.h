#include <iostream> // for basic_ostream, operator<<, char_traits, endl

int add(int a, int b);

class Base {
public:
  // Constructor
  Base() { std::cout << "Base class constructor called." << std::endl; }

  // Destructor
  ~Base() { std::cout << "Base class destructor called." << std::endl; }

  virtual void foo() const { std::cout << "Base::foo()" << std::endl; }
};

class Derived : public Base {
public:
  virtual void foo() const override {
    std::cout << "Derived::foo()" << std::endl;
  }
};
