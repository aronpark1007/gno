package main

import "fmt"

func main() {
	a := map[int]int{0: 10, 0: 20}
	fmt.Println(a)
}

// TypeCheckError:
// main/maplit.gno:6:26: duplicate key 0 in map literal
