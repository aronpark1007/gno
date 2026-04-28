package main

func main() {
	println(1 << -1)
}

// TypeCheckError:
// main/shift_e0.gno:4:15: invalid operation: negative shift count -1 (untyped int constant)
