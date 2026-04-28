package main

func main() {}

func undefinedLabel() {
	for i := 0; i < 10; i++ {
		break UndefinedLabel
	}
}

// TypeCheckError:
// main/invalid_labels1.gno:7:9: invalid break label UndefinedLabel
