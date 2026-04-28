package main

var a uint64

func main() {
	a = 1
	println(a % 1.2)
}

// TypeCheckError:
// main/bigdec2.gno:7:14: 1.2 (untyped float constant) truncated to uint64
