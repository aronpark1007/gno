package main

func main() {
	a := 2
	s := []float32{1 << a}
	println(s[0])
}

// TypeCheckError:
// main/shift_d40.gno:5:17: invalid operation: shifted operand 1 (type float32) must be integer
