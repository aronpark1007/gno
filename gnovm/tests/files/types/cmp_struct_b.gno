package main

type foo struct {
	a int
}

type bar struct {
	b int
}

func main() {
	fa := foo{}
	bb := bar{}

	println(fa == bb)
}

// TypeCheckError:
// main/cmp_struct_b.gno:15:16: invalid operation: fa == bb (mismatched types foo and bar)
