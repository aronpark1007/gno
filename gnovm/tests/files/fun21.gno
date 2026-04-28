package main

func Bar() string {
	return
}

func main() {
	println(Bar())
}

// TypeCheckError:
// main/fun21.gno:4:2: not enough return values
// 	have ()
// 	want (string)
