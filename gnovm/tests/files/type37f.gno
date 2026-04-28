package main

type IntPtr *int

var ip IntPtr = new(int)

func (p *IntPtr) Int() int {
	return **p
}

func main() {
	println((&ip).Int())
}

// TypeCheckError:
// main/type37f.gno:7:10: invalid receiver type IntPtr (pointer or interface type)
