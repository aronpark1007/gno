package main

func main() {
	a := 1
	r := a << "hello" // NOTE: go vet would fail, but still process
	println(r)
}

// TypeCheckError:
// main/shift_a11.gno:5:12: cannot convert "hello" (untyped string constant) to type uint
