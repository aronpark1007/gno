package main

type s struct {
	x int
}

func main() {
	s := s{1}
	const v = s.x
}

// TypeCheckError:
// main/const36.gno:9:12: s.x (variable of type int) is not constant
