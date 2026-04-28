package main

func main() {
	const a uint64 = 18446744073709551615
	println(int16(a))
}

// TypeCheckError:
// main/convert9b.gno:5:16: constant 18446744073709551615 overflows int16
