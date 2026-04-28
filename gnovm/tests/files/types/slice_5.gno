package main

func main() {
	var p **[3]int
	_ = p[0:1]
}

// TypeCheckError:
// main/slice_5.gno:5:6: invalid operation: cannot slice p (variable of type **[3]int)
