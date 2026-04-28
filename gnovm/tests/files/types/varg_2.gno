package main

func main() {
	b := make([]byte, "h")

	println(b)
}

// TypeCheckError:
// main/varg_2.gno:4:20: cannot convert "h" (untyped string constant) to type int
