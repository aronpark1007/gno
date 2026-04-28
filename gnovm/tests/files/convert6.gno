package main

func main() {
	const a int = -1
	println(uint(a))
}

// TypeCheckError:
// main/convert6.gno:5:15: constant -1 overflows uint
