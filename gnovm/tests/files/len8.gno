package main

func main() {
	println(len(struct {
		A, B int
	}{}))
}

// TypeCheckError:
// main/len8.gno:4:14: invalid argument: struct{A, B int}{} (value of type struct{A int; B int}) for built-in len
