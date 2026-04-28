package main

import (
	"gno.land/p/nt/testutils/v0"
)

type mystruct struct{}

func (_ mystruct) privateMethod() string {
	return "mystruct.privateMethod"
}

func main() {
	x := mystruct{}
	testutils.PrintPrivateInterface(x)
}

// TypeCheckError:
// main/access6.gno:15:34: cannot use x (variable of struct type mystruct) as testutils.PrivateInterface value in argument to testutils.PrintPrivateInterface: mystruct does not implement testutils.PrivateInterface (unexported method privateMethod)
