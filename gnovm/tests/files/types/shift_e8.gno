package main

func main() {
	y := 1
	y <<= 1.25
}

// TypeCheckError:
// main/shift_e8.gno:5:8: 1.25 (untyped float constant) truncated to uint
