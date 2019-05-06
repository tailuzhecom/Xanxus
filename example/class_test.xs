class A {
  a : Int;
  b : Int;
  add() : Int {
    printlnStr("A::add()")
  };
  sum(n : Int) : Int {
     if n < 10 then
        n <- n + fib(n + 1)
     else
        10
     fi
  };
};
  

class B inherits A {
  c : Int;
  add() : Int {
    let b : Int in 1
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
    add();
    a3@A.sum();
    }	
    
  };

  add() : Int {
     let a : Int in 1
  };
};
