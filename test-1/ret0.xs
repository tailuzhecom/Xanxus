class A {
  a : Int;
  b : Int;
  add() : Int {
    {
    printlnStr("A::add()");
    }
  };
};
  

class B inherits A {
  c : Int;
  add() : Int {
    let b : Int in 0
  };
};

class Main {
  a1 : Int;
  a2 : Bool;
  a3 : A;
  main(): Int {
    {
    a3 <- new A;
    add(a1);
    add(true);
    
    }	
    
  };

  add(a : Int) : Int {
     printlnStr("add_with_Int")
  };

  add(a : Bool) : Int {
     printlnStr("add_with_Bool")
  };
};
