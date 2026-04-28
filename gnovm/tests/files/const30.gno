package main

import "fmt"

func v() {
	return
}

func main() {
	const t = v()
	fmt.Println(t)
}

// TypeCheckError:
// main/const30.gno:10:12: v() (no value) used as value
