package main

type MyStruct struct {
    doSomething int // only name matches the interface
}

type MyInterface interface {
    doSomething(string) string
}

func main() {
    var x MyInterface = MyStruct{}
    println("ok", x == nil)
}

// TypeCheckError:
// main/assign_iface.gno:12:25: cannot use MyStruct{} (value of struct type MyStruct) as MyInterface value in variable declaration: MyStruct does not implement MyInterface (MyStruct.doSomething is a field, not a method)
