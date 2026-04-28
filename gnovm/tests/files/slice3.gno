package main

func main() {
	i := []string{nil}
	println(i)
}

// TypeCheckError:
// main/slice3.gno:4:16: cannot use nil as string value in array or slice literal
