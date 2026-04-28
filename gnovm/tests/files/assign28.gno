package main

import "fmt"

func main() {
	a, c := 1, 2, 3
	fmt.Println(a, c)
}

// TypeCheckError:
// main/assign28.gno:6:10: assignment mismatch: 2 variables but 3 values
