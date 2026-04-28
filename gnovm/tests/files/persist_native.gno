package main

var a any

func init() {
	a = println
}

func main() {
	a("doesntwork")
}

// TypeCheckError:
// main/persist_native.gno:6:6: println (built-in) must be called; main/persist_native.gno:10:2: invalid operation: cannot call non-function a (variable of interface type any)
