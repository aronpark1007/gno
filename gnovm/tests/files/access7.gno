package main

import (
	"gno.land/p/nt/testutils/v0"
)

type mystruct struct{}

func (_ mystruct) privateMethod() string {
	return "mystruct.privateMethod"
}

type PrivateInterface2 interface {
	privateMethod() string
}

func main() {
	var x PrivateInterface2 = mystruct{}
	testutils.PrintPrivateInterface(x)
}

// TypeCheckError:
// main/access7.gno:19:34: cannot use x (variable of interface type PrivateInterface2) as testutils.PrivateInterface value in argument to testutils.PrintPrivateInterface: PrivateInterface2 does not implement testutils.PrivateInterface (missing method privateMethod)
