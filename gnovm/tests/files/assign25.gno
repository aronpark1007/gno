package main

func foo() (int, bool) {
	return 1, true
}

func main() {
	a, b, c := 2, foo()

	println(a, b, c)
}

// TypeCheckError:
// main/assign25.gno:8:13: assignment mismatch: 3 variables but 2 values
