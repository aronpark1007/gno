package main

func main() {
	println(1 << nil)
}

// TypeCheckError:
// main/shift_d38.gno:4:15: cannot convert nil to type uint
