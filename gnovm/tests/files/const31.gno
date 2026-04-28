package main

import "fmt"

func v() (string, string) {
	return "", ""
}

func main() {
	const t, v = v()
	fmt.Println(t)
}

// TypeCheckError:
// main/const31.gno:10:11: missing init expr for v; main/const31.gno:10:15: multiple-value v() (value of type (string, string)) in single-value context
