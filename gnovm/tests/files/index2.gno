package main

func main() {
	var a [1024]byte
	_ = a[-1]
}

// TypeCheckError:
// main/index2.gno:5:8: invalid argument: index -1 (constant of type int) must not be negative
