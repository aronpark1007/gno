package main

func main() {
	x := int(1.2)
	println(x)
}

// TypeCheckError:
// main/float0.gno:4:11: cannot convert 1.2 (untyped float constant) to type int
