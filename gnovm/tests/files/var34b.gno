package main

func f() {}

func main() {
	var a int
	a = f()
}

// TypeCheckError:
// main/var34b.gno:7:6: f() (no value) used as value; main/var34b.gno:6:6: declared and not used: a
