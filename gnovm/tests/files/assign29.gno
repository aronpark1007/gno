package main

func main() {
	t := struct{}
}

// TypeCheckError:
// main/assign29.gno:4:7: struct{} (type) is not an expression; main/assign29.gno:4:2: declared and not used: t
