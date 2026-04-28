package main

func main() {
	true = false
}

// TypeCheckError:
// main/assign_literal3.gno:4:2: cannot assign to true (neither addressable nor a map index expression)
