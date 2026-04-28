package main

func main() {
	_ = make(int)
}

// TypeCheckError:
// main/varg_12.gno:4:11: invalid argument: cannot make int; type must be slice, map, or channel
