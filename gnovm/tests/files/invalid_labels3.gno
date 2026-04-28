package main

func main() {}

func invalidLabelStatement() {
	if true {
		break InvalidLabel
	}
}

// TypeCheckError:
// main/invalid_labels3.gno:7:9: invalid break label InvalidLabel
