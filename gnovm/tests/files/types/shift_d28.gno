package main

func main() {
	x := 11
	var y float32
	y = 1 + 1<<x + 1
	println(y)
}

// TypeCheckError:
// main/shift_d28.gno:6:10: invalid operation: shifted operand 1 (type float32) must be integer
