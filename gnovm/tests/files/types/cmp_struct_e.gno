package main

type foo struct {
	a []int
}

func main() {
	fa := foo{}
	fb := foo{}

	println(fa == fb)
}

// TypeCheckError:
// main/cmp_struct_e.gno:11:10: invalid operation: fa == fb (struct containing []int cannot be compared)
