package main

const (
	A = uint8(^0)
)

func main() {
	println(A)
}

// TypeCheckError:
// main/const61.gno:4:12: constant -1 overflows uint8
