package main

// both not const, and both interface
func main() {
	println([]byte("a") == []byte("b"))
}

// TypeCheckError:
// main/eql_0f30.gno:5:10: invalid operation: []byte("a") == []byte("b") (slice can only be compared to nil)
