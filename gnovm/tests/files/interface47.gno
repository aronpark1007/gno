package main

type Runner interface {
	Run()
}

type Swimmer interface {
	Swim()
}

func main() {
	a := Runner(nil)
	println(Swimmer(a))
}

// TypeCheckError:
// main/interface47.gno:13:18: cannot convert a (variable of interface type Runner) to type Swimmer: Runner does not implement Swimmer (missing method Swim)
