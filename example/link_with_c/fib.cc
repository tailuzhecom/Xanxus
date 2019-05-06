int fib(int n) {
	if (n < 10)
            return n + fib(n+1);
	else
            return 10;
}
