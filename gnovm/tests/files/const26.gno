package main

import "fmt"

func v() string {
	return ""
}

func main() {
	const t = v()
	fmt.Println(t)
}

// TypeCheckError:
// main/const26.gno:10:12: v() (value of type string) is not constant
