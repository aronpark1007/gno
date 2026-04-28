package main

func main() {
	var a = []int{1, 2, 3}
	_ = a[-1]
}

// TypeCheckError:
// main/index4.gno:5:8: invalid argument: index -1 (constant of type int) must not be negative
