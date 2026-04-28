package main

type foo interface {
	say()
}

func (f foo) echo() int {
	return 1
}

type Bar struct{}

func (b *Bar) say() {}

func main() {
	var f foo
	f = &Bar{}
	println(f.echo())
}

// TypeCheckError:
// main/type39.gno:7:9: invalid receiver type foo (pointer or interface type)
