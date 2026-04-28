package main

func main() {
	a := 1
	a = nil
	println(a)
}

// TypeCheckError:
// main/assign38.gno:5:6: cannot use nil as int value in assignment
