package main

func main() {
	v := 1
	println(*v)
}

// TypeCheckError:
// main/ptr9.gno:5:11: invalid operation: cannot indirect v (variable of type int)
