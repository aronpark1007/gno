package main

func main() {
	println(nil == nil) // xt: <nil>, dt: <nil>
}

// TypeCheckError:
// main/eql_0a01.gno:4:17: invalid operation: nil == nil (operator == not defined on untyped nil)
