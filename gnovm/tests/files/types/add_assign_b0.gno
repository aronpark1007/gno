package main

type Error int8

// one untyped const, one typed const
func main() {
	r := 1
	r += Error(1)
	println(r)
}

// TypeCheckError:
// main/add_assign_b0.gno:8:2: invalid operation: r += Error(1) (mismatched types int and Error)
