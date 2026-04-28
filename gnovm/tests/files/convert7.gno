package main

func main() {
	println(int32(1.5))
}

// TypeCheckError:
// main/convert7.gno:4:16: cannot convert 1.5 (untyped float constant) to type int32
