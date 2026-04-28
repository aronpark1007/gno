package main

type MyStruct struct {
	arr []int
}

const a = len(MyStruct{arr: []int{1, 2}}.arr)

func main() {
	println("ok")
}

// TypeCheckError:
// main/const45_b.gno:7:11: len(MyStruct{…}.arr) (value of type int) is not constant
