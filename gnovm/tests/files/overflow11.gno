package main

func main() {
	const b1 = uint8(1) << 8
}

// TypeCheckError:
// main/overflow11.gno:4:13: uint8(1) << 8 (constant 256 of type uint8) overflows uint8
