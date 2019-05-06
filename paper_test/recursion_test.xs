class Main {
  main(): Int {
     printlnInt(sum(1))
  };

  sum(n : Int) : Int {
      if n < 10 then
          n + sum(n + 1)
      else
          10
      fi
  };
};
