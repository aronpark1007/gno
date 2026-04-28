package main

func main() {
	i := int(1)
	a := +(1.0 << i)

	println(a)
}

// TypeCheckError:
// main/shift_k.gno:5:9: invalid operation: shifted operand 1.0 (type float64) must be integer
