package main

import "fmt"

func main() {
	defer func() {
		recover()
		panic("other panic")
	}()
	panic("test panic")
}

// TypeCheckError:
// main/recover1b.gno:3:8: "fmt" imported and not used
