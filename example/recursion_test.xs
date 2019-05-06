class Main {
  main(): Int {
     printlnInt(fib(1))
  };

  fib(n : Int) : Int {
      if n < 10 then
          n + fib(n + 1)
      else
          10
      fi
  };
};
