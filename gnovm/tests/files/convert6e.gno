package main

func main() {
	const a float32 = 1.5
	println(int32(a))
}

// TypeCheckError:
// main/convert6e.gno:5:16: cannot convert a (constant 1.5 of type float32) to type int32
