package main

const a = func() { println("hey") }

func main() {
	println("ok")
}

// TypeCheckError:
// main/const34.gno:3:11: (func() literal) (value of type func()) is not constant
