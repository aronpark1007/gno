package main

func main() {
	s := "hello"
	_ = s[-1]
}

// TypeCheckError:
// main/index5.gno:5:8: invalid argument: index -1 (constant of type int) must not be negative
