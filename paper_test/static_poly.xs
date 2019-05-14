class Main {
  a1 : Int;
  a2 : Bool;
  
  main() : Int {
    {
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
