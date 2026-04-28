package main

// Const group where a subsequent line has fewer names than the previous iota
// expression. Should produce a clear assignment mismatch error, not a
// confusing internal panic.
const (
	d, e = 1, "hello"
	m
)

func main() {
	println(d, e)
}

// TypeCheckError:
// main/const62.gno:8:2: extra init expr at main/const62.gno:7:2
