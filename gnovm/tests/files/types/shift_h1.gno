package main

func main() {
	x := 2
	y := 1 + 1.0<<x
	println(y)
}

// TypeCheckError:
// main/shift_h1.gno:5:11: invalid operation: shifted operand 1.0 (type float64) must be integer
