package main

type S struct {
	S
}

func main() {
	var a, b S
	println(a == b)
}

// TypeCheckError:
// main/recursive5.gno:3:6: invalid recursive type: S refers to itself
