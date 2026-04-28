package main

func f(i int) {}

func main() {
	f(nil)
}

// TypeCheckError:
// main/fun28.gno:6:4: cannot use nil as int value in argument to f
