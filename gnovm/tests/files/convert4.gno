package main

func main() {
	println(int(nil))
}

// TypeCheckError:
// main/convert4.gno:4:14: cannot convert nil to type int
