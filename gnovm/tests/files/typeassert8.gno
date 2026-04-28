package main

type ex int

func (ex) Error() string { return "" }

type i interface {
	Error() string
}

func main() {
	r := []int(nil)
	e := r.(ex)
	println(e)
}

// TypeCheckError:
// main/typeassert8.gno:13:7: invalid operation: r (variable of type []int) is not an interface
