package main

var a uint64

func main() {
	a = 1.2
	println(a)
}

// TypeCheckError:
// main/bigdec5.gno:6:6: cannot use 1.2 (untyped float constant) as uint64 value in assignment (truncated)
