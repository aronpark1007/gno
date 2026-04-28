package main

func main() {
	const a float64 = 1.5
	println(int64(a))
}

// TypeCheckError:
// main/convert7a.gno:5:16: cannot convert a (constant 1.5 of type float64) to type int64
