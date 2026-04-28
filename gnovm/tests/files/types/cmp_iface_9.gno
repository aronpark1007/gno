package main

type A interface {
	F()
}

type B interface {
	X()
	G()
}

type T struct{}

func (T) F() {}

func (T) G() {}

func (T) X() {}

func main() {
	var a A = T{}
	var b B = T{}

	println(b == a)
	println(a == b)
}

// TypeCheckError:
// main/cmp_iface_9.gno:24:15: invalid operation: b == a (mismatched types B and A); main/cmp_iface_9.gno:25:15: invalid operation: a == b (mismatched types A and B)
