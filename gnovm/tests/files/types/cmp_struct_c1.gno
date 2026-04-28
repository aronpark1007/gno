package main

type foo struct {
	a int
}

type bar struct {
	b []int
}

func main() {
	fa := foo{}
	bb := bar{}

	println(bb == fa)
}

// TypeCheckError:
// main/cmp_struct_c1.gno:15:16: invalid operation: bb == fa (mismatched types bar and foo)
