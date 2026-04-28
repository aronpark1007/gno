package main

func main() {
	println("hello")
	fallthrough
	println("world")
}

// TypeCheckError:
// main/switch8.gno:5:2: fallthrough statement out of place
