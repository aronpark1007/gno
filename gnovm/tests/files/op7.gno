package main

type T int

func (t T) Error() string { return "T: error" }

var invalidT T

func main() {
	var err error
	if err > invalidT {
		println("ok")
	}
}

// TypeCheckError:
// main/op7.gno:11:5: invalid operation: err > invalidT (operator > not defined on interface)
