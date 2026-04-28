package main

func main() {
    const b2 = uint16(1) << 16
}

// TypeCheckError:
// main/overflow12.gno:4:16: uint16(1) << 16 (constant 65536 of type uint16) overflows uint16
