package main

type foo interface {
	say()
}

func (f *foo) echo() int {
	return 1
}

type Bar struct{}

func (b *Bar) say() {}

func main() {
	var f *foo
	*f = &Bar{}
	println(f.echo())
}

// TypeCheckError:
// main/type39b.gno:7:10: invalid receiver type foo (pointer or interface type); main/type39b.gno:18:12: f.echo undefined (type *foo is pointer to interface, not interface)
