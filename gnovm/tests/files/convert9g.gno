package main

func main() {
	const a uint64 = 18446744073709551615
	println(uint32(a))
}

// TypeCheckError:
// main/convert9g.gno:5:17: constant 18446744073709551615 overflows uint32
