package main

func main() {
	var s uint = 33
	var u2 = uint64(1<<s + 1.2) // adapt type from context if binay x is untyped.
	println(u2)
}

// TypeCheckError:
// main/shift_f4b.gno:5:25: 1.2 (untyped float constant) truncated to uint64
