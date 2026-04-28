package main

type S struct {
}

func main() {
	x := (*S)(nil)
	var y any = (*S)(nil)
	var znil any = nil

	println("y == znil", y == znil)
	println("znil == y", znil == y)

	y = nil
	println("y == znil", y == znil)
	println("znil == y", znil == y)
}

// TypeCheckError:
// main/comp5.gno:7:2: declared and not used: x
