package main

import "fmt"

var p int

func main() {
	b, x := makeClosure(1)
	x(true)
}

func makeClosure(a int) (b int, c func(bool)) {
	return 2, func(recurse bool) {
		fmt.Println(a, b, p)
		if recurse {
			c(false)
		}
	}
}

// TypeCheckError:
// main/closure9.gno:8:2: declared and not used: b
