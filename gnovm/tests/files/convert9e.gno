package main

func main() {
	const a uint64 = 18446744073709551615
	println(uint8(a))
}

// TypeCheckError:
// main/convert9e.gno:5:16: constant 18446744073709551615 overflows uint8
