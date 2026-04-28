package main

func main() {
	a := "hello"
	r := a << 1
	println(r)
}

// TypeCheckError:
// main/shift_a14.gno:5:7: invalid operation: shifted operand a (variable of type string) must be integer
