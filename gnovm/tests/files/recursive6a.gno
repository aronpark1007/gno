package main

type SelfReferencing interface {
	SelfReferencing
}

func main() {
	println("ok")
}

// TypeCheckError:
// main/recursive6a.gno:3:6: invalid recursive type: SelfReferencing refers to itself
