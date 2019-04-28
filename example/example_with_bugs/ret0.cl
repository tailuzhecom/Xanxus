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
    let a : Int in {
    if 1 <= 1 then
    {
    	a1 <- 1+2;
    }
    else {
	a <- 2+3;
    }
    fi;
    add(a1 ; a);
    }	
    
  };

  add(a : Int ; b : Int) : Int {
     printlnInt(a)
  };
};
