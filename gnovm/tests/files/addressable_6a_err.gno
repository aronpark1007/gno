package main

func main() {
	var i any
	i = 5
	println(&i.(int))
}

// TypeCheckError:
// main/addressable_6a_err.gno:6:11: invalid operation: cannot take address of i.(int) (comma, ok expression of type int)
