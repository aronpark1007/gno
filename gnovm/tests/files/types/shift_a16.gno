package main

func main() {
	r := "hello" << 1
	println(r)
}

// TypeCheckError:
// main/shift_a16.gno:4:7: invalid operation: shifted operand "hello" (untyped string constant) must be integer
