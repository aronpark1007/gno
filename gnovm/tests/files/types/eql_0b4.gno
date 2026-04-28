package main

import (
	"errors"
)

func main() {
	errCmp := errors.New("xxx")
	println(5 == errCmp)
}

// TypeCheckError:
// main/eql_0b4.gno:9:10: cannot convert 5 (untyped int constant) to type interface{Error() string}
