int sum(int n) {
	if (n < 10)
            return n + sum(n+1);
	else
            return 10;
}
