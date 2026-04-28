package main

func main() {
	y := 1 << -1.0 
	println(y)
}

// TypeCheckError:
// main/shift_d5d.gno:4:12: invalid operation: negative shift count -1.0 (untyped float constant -1)

