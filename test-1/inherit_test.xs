class A {
  a : Int;
  b : Int;
};
  

class Main inherits A {
  inherit_test() : Int {
    {
     a <- 10;
     printlnInt(a);
    }
  };

  main() : Int {
    inherit_test()
  };
};

