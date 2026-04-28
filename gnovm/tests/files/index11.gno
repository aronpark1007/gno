package main

func main() {
	_ = [5]int{-1: 5}
}

// TypeCheckError:
// main/index11.gno:4:13: invalid argument: index -1 (constant of type int) must not be negative
