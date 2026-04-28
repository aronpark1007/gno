package main

var x = 1

const ff = +(1 << x)

func main() {
	println("ok")
}

// TypeCheckError:
// main/const35.gno:5:12: +(1 << x) (untyped int value) is not constant
