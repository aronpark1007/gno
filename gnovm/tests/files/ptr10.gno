package main

func main() {
	println(*nil)
}

// TypeCheckError:
// main/ptr10.gno:4:11: invalid operation: cannot indirect nil
