package main

func main() {
	x := 1.25
	println(1 << x)
}

// TypeCheckError:
// main/shift_e4.gno:5:15: invalid operation: shift count x (variable of type float64) must be integer
