package main

func main() {
	var ints []int
	ints = append(ints, nil, nil)
	println(ints)
}

// TypeCheckError:
// main/convert5.gno:5:22: cannot use nil as int value in argument to append; main/convert5.gno:5:27: cannot use nil as int value in argument to append
