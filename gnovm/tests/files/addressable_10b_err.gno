package main

type S struct {
	i int
}

func main() {
	println(&new(S))
}

// TypeCheckError:
// main/addressable_10b_err.gno:8:11: invalid operation: cannot take address of new(S) (value of type *S)
