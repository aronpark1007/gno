package main

type S = struct {
	*S
}

func main() {}

// TypeCheckError:
// main/recursive9d.gno:3:6: invalid recursive type: S refers to itself
