package main

import "fmt"

func main() {
	i3 := false
	a := map[bool]int{true: 10, true: 11, i3: 20}
	fmt.Println(a)
}

// TypeCheckError:
// main/maplit5.gno:7:30: duplicate key true in map literal
