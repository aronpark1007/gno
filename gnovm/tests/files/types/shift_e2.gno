package main

func main() {
	println(1 << 1.25)
}

// TypeCheckError:
// main/shift_e2.gno:4:15: 1.25 (untyped float constant) truncated to uint
