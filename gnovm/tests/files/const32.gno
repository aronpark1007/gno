package main

import "fmt"

func main() {
	const t = 1 + 2 + len([]string{})
	fmt.Println(t)
}

// TypeCheckError:
// main/const32.gno:6:12: 1 + 2 + len([]string{}) (value of type int) is not constant
