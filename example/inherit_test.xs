class A {
  a : Int;
  b : Int;
};
  

class B inherits A {
  inherit_test() : Int {
    {
     a <- 10
     printlnInt(a);
    }
  };
};

class Main {
  b : B;
  main() : Int {
    b.inherit_test()
  };
};
