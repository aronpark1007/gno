package main

func main() {
	var p int
	_ = p[0:1]
}

// TypeCheckError:
// main/slice_3.gno:5:6: invalid operation: cannot slice p (variable of type int)

