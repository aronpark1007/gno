package main

func main() {
	a := "hello"
	a++
	println(a)
}

// TypeCheckError:
// main/incdec_a1.gno:5:2: invalid operation: a++ (non-numeric type string)
