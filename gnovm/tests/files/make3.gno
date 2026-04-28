package main

func main() {
	t := make([]int, -1)
	println(t)
}

// TypeCheckError:
// main/make3.gno:4:19: invalid argument: index -1 (constant of type int) must not be negative
