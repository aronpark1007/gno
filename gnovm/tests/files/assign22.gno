package main

func main() {
	m := map[string]int{"a": 1}
	var s int
	var ok bool
	s, ok <<= m["a"]
	println(s, ok)
}

// TypeCheckError:
// main/assign22.gno:7:8: assignment operation <<= requires single-valued expressions; main/assign22.gno:4:2: declared and not used: m
