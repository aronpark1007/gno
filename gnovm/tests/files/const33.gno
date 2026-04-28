package main

var x = 1
var y = 1

const b = x == y

func main() {
	println("ok")
}

// TypeCheckError:
// main/const33.gno:6:11: x == y (untyped bool value) is not constant
