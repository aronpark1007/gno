package main

import "fmt"

func main() {
	x := "hello"
	y := +x
	fmt.Println(y)
}

// TypeCheckError:
// main/unary_a0c.gno:7:8: invalid operation: operator + not defined on x (variable of type string)
