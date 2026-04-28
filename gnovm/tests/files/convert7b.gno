package main

func main() {
	println(int64(1.5))
}

// TypeCheckError:
// main/convert7b.gno:4:16: cannot convert 1.5 (untyped float constant) to type int64
