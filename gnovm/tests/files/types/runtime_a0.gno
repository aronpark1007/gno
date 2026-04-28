package main

func main() {
	m := map[string]bool{"foo": true}
	m["foo"]++
}

// TypeCheckError:
// main/runtime_a0.gno:5:2: invalid operation: m["foo"]++ (non-numeric type bool)
