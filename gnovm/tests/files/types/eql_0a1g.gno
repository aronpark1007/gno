package main

func main() {
	var a int = 1
	var b float32 = 1.0
	println(a == b) // both typed
}

// TypeCheckError:
// main/eql_0a1g.gno:6:15: invalid operation: a == b (mismatched types int and float32)
