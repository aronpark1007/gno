package main

const a = any(nil)

func main() {
	println("ok")
}

// TypeCheckError:
// main/const44.gno:3:11: any(nil) (value of interface type any) is not constant
