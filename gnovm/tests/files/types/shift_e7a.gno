package main

func main() {
	a := float64(-100)
	println(1 << a)
}

// TypeCheckError:
// main/shift_e7a.gno:5:15: invalid operation: shift count a (variable of type float64) must be integer
