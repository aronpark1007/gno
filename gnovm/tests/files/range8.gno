package main

func main() {
	for i, v := range nil {
		println(i, v)
	}
}

// TypeCheckError:
// main/range8.gno:4:20: cannot range over nil
