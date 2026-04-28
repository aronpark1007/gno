package main

import "fmt"

func main() {
	s := "1"
	const t = s
	fmt.Println(t)
}

// TypeCheckError:
// main/const29.gno:7:12: s (variable of type string) is not constant
