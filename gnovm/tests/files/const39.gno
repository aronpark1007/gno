package main

type T struct {
	a int
}

func (tv T) Mv(a int) int { return 0 }

func main() {
	const t = T.Mv
}

// TypeCheckError:
// main/const39.gno:10:12: T.Mv (value of type func(tv T, a int) int) is not constant
