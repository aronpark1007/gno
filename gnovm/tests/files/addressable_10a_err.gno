package main

func main() {
	println(&getPtr())
}

type S struct{}

func getPtr() *S {
	return &S{}
}

// TypeCheckError:
// main/addressable_10a_err.gno:4:11: invalid operation: cannot take address of getPtr() (value of type *S)
