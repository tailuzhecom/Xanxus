class A {
  a : Int;
  b : Int;
  add() : Int {
    {
    a <- 1;
    while a < 3 loop
    {
      printlnInt(a);
      a <- a+1;
    }
    pool;
    printlnStr("A::add()");
    }
  };
};
  

class B inherits A {
  c : Int;
  add() : Int {
    printlnStr("B::add()")
  };
};

class Main {
  a1 : Int;
  a2 : Bool;
  a3 : A;
  main(): Int {
    {
    a3.add();
    a3 <- new B;
    a3.add();
    }
  };

};
