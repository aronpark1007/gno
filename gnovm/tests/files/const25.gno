package main

import "fmt"

func main() {
	const t = []string{"1"}
	fmt.Println(t)
}

// TypeCheckError:
// main/const25.gno:6:12: []string{…} (value of type []string) is not constant
