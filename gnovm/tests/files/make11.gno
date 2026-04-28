package main

func main() {
	t := make([]int, 5, -1)
	println(t)
}

// TypeCheckError:
// main/make11.gno:4:22: invalid argument: index -1 (constant of type int) must not be negative
