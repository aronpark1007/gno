package main

func main() {
	s := "hello"

	var index int
	var value int
	for index, value = range s {
		println(index)
		println(value)
	}
}

// TypeCheckError:
// main/assign_range_e.gno:8:13: cannot use value (value of type rune) as int value in assignment
