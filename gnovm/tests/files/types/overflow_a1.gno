package main

func main() {
	const Huge = 1e1000
	println(Huge)
}

// TypeCheckError:
// main/overflow_a1.gno:5:10: cannot use Huge (untyped float constant 1e+1000) as float64 value in argument to built-in println (overflows)
