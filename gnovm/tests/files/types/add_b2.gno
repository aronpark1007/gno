package main

// one untyped const, one typed const
func main() {
	println(1 + "a")
}

// TypeCheckError:
// main/add_b2.gno:5:10: invalid operation: 1 + "a" (mismatched types untyped int and untyped string)
