package main

func gen() any {
	return false
}

func main() {
	gen()++
}

// TypeCheckError:
// main/runtime_a3.gno:8:2: invalid operation: gen()++ (non-numeric type any)
