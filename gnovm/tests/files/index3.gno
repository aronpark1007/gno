package main

func main() {
	defer func() {
		r := recover()
		println("recover:", r) // not recoverable.
	}()

	s := []int{1, 2, 3}
	_ = s[-1:] // Panics because of negative index
}

// TypeCheckError:
// main/index3.gno:10:8: invalid argument: index -1 (constant of type int) must not be negative
