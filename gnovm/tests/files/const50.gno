package main

var x = "a"

const v = len(x)

func main() {
	println("ok")
}

// TypeCheckError:
// main/const50.gno:5:11: len(x) (value of type int) is not constant
