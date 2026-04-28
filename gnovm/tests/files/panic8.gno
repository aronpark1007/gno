package main

func main() {
	println("hello")
	defer func() {
		a := 0
		b := 1/a
	}()
	println("world")
}

// TypeCheckError:
// main/panic8.gno:7:3: declared and not used: b

