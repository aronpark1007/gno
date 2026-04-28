package main

import "fmt"

func v() string {
	return ""
}

func main() {
	var i any = 1
	const t, ok = i.(int)
	fmt.Println(t, ok)
}

// TypeCheckError:
// main/const27.gno:11:11: missing init expr for ok; main/const27.gno:11:16: i.(int) (comma, ok expression of type int) is not constant
