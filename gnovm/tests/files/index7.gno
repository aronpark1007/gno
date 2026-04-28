package main

func main() {
	s := []int{1, 2, 3}
	_ = s[:1:-1] // Panics because of negative index
}

// TypeCheckError:
// main/index7.gno:5:11: invalid argument: index -1 (constant of type int) must not be negative
