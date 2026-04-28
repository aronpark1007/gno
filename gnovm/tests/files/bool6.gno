package main

func main() {
	println(X())
}

func X() string {
	return "hello" || "world"
}

// TypeCheckError:
// main/bool6.gno:8:9: invalid operation: operator || not defined on "hello" (untyped string constant)
