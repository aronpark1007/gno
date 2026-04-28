package main

func main() {
	var i = "h"
	b := make([]byte, i)

	println(b)
}

// TypeCheckError:
// main/varg_3.gno:5:20: invalid argument: index i (variable of type string) must be integer
