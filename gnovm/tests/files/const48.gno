package main

func main() {
	const a = len(map[string][]int{"arr": {1, 2}})
	println("ok", a)
}

// TypeCheckError:
// main/const48.gno:4:12: len(map[string][]int{…}) (value of type int) is not constant
