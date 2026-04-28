package main

import "fmt"

func main() {
	fmt.Println(1)
	println(fmt)
}

// TypeCheckError:
// main/import10.gno:7:10: use of package fmt not in selector
