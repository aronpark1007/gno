package main

func main() {
	_ = &(&struct{}{})
}

// TypeCheckError:
// main/addressable_3d_err.gno:4:7: invalid operation: cannot take address of (&struct{}{}) (value of type *struct{})
