package main

func main() {
	i := []int{1, 2, 3}
	for j := range &i {
		println(j)
	}
}

// TypeCheckError:
// main/range11.gno:5:17: cannot range over &i (value of type *[]int)
