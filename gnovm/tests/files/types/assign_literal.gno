package main

func main() {
	1 = 6
}

// TypeCheckError:
// main/assign_literal.gno:4:2: cannot assign to 1 (neither addressable nor a map index expression)
