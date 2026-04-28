package main

func main() {
	[]int{1, 2} = []int{3, 4}
}

// TypeCheckError:
// main/assign_literal4.gno:4:2: cannot assign to []int{…} (neither addressable nor a map index expression)
