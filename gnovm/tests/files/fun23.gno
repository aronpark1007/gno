package main

func f(x int) { return x }

func main() {
	print("hello")
}

// TypeCheckError:
// main/fun23.gno:3:24: too many return values
// 	have (int)
// 	want ()
