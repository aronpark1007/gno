package main

type S struct {
	s []int
}

func main() {
	_ = map[S]int{S{[]int{1}}: 10}
}

// TypeCheckError:
// main/maplit11.gno:8:10: invalid map key type S
