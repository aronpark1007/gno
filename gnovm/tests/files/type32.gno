package main

type S string

func main() {
	a := "wqe"
	b := S("qwe")
	if false {
		println(a + ":" + b)
	}
	println("done")
}

// TypeCheckError:
// main/type32.gno:9:11: invalid operation: a + ":" + b (mismatched types string and S)
