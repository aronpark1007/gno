package main

func main() {
	type foo struct {
		yolo string
	}

	var foo int
	foo = 2
	println(foo)
}

// TypeCheckError:
// main/redeclaration0.gno:8:6: foo redeclared in this block; main/redeclaration0.gno:4:7: 	other declaration of foo; main/redeclaration0.gno:9:2: foo (type) is not an expression; main/redeclaration0.gno:10:10: foo (type) is not an expression
