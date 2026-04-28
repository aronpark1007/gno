package main

func main() {
	expected := `hello`[:]
	a := 1
	println(a == expected) // both typed
}

// TypeCheckError:
// main/cmp_slice_4.gno:6:15: invalid operation: a == expected (mismatched types int and string)
