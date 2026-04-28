package main

const a = 1

func main() {
	_ = &a
}

// TypeCheckError:
// main/addressable_5c_err.gno:6:7: invalid operation: cannot take address of a (untyped int constant 1)
