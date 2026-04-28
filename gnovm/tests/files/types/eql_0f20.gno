package main

type f func() bool

// slice would be comparable
var a [2]f

func main() {
	println(a == nil) // rcx.T == nil
}

// TypeCheckError:
// main/eql_0f20.gno:9:15: invalid operation: a == nil (mismatched types [2]f and untyped nil)
