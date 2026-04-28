package main

func main() {
	const a int = -1
	println(uint16(a))
}

// TypeCheckError:
// main/convert6b.gno:5:17: constant -1 overflows uint16
