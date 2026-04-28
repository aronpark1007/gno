package main

func main() {
	var s uint = 33

	var u1 bool
	u1 = 1.0<<s != 0
	println(u1)
}

// TypeCheckError:
// main/shift_f1b.gno:7:7: invalid operation: shifted operand 1.0 (type float64) must be integer
