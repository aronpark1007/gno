package main

import "fmt"

// case of const in type call
func main() {
	r := int(uint(string("hello")))
	println(r)
	fmt.Printf("%T\n", r)
}

// TypeCheckError:
// main/explicit_conversion_1.gno:7:16: cannot convert string("hello") (constant "hello" of type string) to type uint
