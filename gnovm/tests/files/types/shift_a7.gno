package main

func main() {
	r := int(1)
	println(r << "a")
}

// TypeCheckError:
// main/shift_a7.gno:5:15: cannot convert "a" (untyped string constant) to type uint
