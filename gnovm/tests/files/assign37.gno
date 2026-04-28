package main

func f() { }

func main() {
	a := f()
}

// TypeCheckError:
// main/assign37.gno:6:7: f() (no value) used as value; main/assign37.gno:6:2: declared and not used: a
