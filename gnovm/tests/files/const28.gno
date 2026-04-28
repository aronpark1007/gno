package main

import "fmt"

func main() {
	var s []string = []string{"1"}
	const t, ok = s[0]
	fmt.Println(t, ok)
}

// TypeCheckError:
// main/const28.gno:7:11: missing init expr for ok; main/const28.gno:7:16: s[0] (variable of type string) is not constant
