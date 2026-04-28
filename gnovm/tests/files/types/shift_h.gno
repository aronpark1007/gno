package main

func main() {
	x := 2
	y := 1.0<<x + 1
	println(y)
}

// TypeCheckError:
// main/shift_h.gno:5:7: invalid operation: shifted operand 1.0 (type float64) must be integer
