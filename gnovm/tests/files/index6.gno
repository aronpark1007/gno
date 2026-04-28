package main

func main() {
	s := []int{1, 2, 3}
	_ = s[:-1:2] // Panics because of negative index
}

// TypeCheckError:
// main/index6.gno:5:9: invalid argument: index -1 (constant of type int) must not be negative
