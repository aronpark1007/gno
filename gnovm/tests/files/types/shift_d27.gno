package main

func main() {
	x := 11
	var y float32
	y = -(1 << x)
	println(y)
}

// TypeCheckError:
// main/shift_d27.gno:6:8: invalid operation: shifted operand 1 (type float32) must be integer
