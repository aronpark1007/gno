package main

func main() {
	const a2 = int16(1) << 16
}

// TypeCheckError:
// main/overflow8.gno:4:13: int16(1) << 16 (constant 65536 of type int16) overflows int16
