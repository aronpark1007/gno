package main

func main() {
	const a int = -1
	println(uint8(a))
}

// TypeCheckError:
// main/convert6a.gno:5:16: constant -1 overflows uint8
