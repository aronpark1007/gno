package main

func main() {
	t := make([]int, 6, 3)
	println(t)
}

// TypeCheckError:
// main/make14.gno:4:19: invalid argument: length and capacity swapped
