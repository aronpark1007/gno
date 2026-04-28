package main

const (
	A = uint(^1)
)

func main() {
	println(A)
}

// TypeCheckError:
// main/const60.gno:4:11: constant -2 overflows uint
