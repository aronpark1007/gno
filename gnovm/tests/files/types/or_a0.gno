package main

// both typed(different) const
func main() {
	println(int(0) | int8(1))
}

// TypeCheckError:
// main/or_a0.gno:5:10: invalid operation: int(0) | int8(1) (mismatched types int and int8)
