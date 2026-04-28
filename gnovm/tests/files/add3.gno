package main

func main() {
	a := 1
	i := a + nil
}

// TypeCheckError:
// main/add3.gno:5:7: invalid operation: a + nil (mismatched types int and untyped nil); main/add3.gno:5:2: declared and not used: i
