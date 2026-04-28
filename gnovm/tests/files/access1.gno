package main

import (
	"gno.land/p/nt/testutils/v0"
)

func main() {
	println(testutils.testVar2)
}

// TypeCheckError:
// main/access1.gno:8:20: name testVar2 not exported by package testutils
