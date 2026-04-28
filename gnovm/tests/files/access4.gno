package main

import (
	"gno.land/p/nt/testutils/v0"
)

func main() {
	x := testutils.NewTestAccessStruct("PUB", "PRIV")
	println(x.privateField)
}

// TypeCheckError:
// main/access4.gno:9:12: x.privateField undefined (cannot refer to unexported field privateField)
