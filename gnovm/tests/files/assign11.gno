package main

import "fmt"

func main() {
	_, _, _ = fmt.Println("test")
}

// TypeCheckError:
// main/assign11.gno:6:12: assignment mismatch: 3 variables but fmt.Println returns 2 values
