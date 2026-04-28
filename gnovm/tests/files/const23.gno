package main

import "fmt"

func main() {
	const t []string = []string{}
	fmt.Println(t)
}

// TypeCheckError:
// main/const23.gno:6:10: invalid constant type []string
