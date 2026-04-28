package main

// both typed(different) const
func main() {
	int(0) += int8(1)
}

// TypeCheckError:
// main/add_assign_a0.gno:5:2: invalid operation: int(0) += int8(1) (mismatched types int and int8)
