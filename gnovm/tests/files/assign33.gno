package main

func foo() (int, bool) {
	return 1, true
}

func main() {
	var a, b int = foo()
	println(a, b)
}

// TypeCheckError:
// main/assign33.gno:8:17: cannot use foo() (value of type bool) as int value in assignment
