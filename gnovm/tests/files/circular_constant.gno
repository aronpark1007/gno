package main

const A = B
const B = A + 1

func main() {
}

// TypeCheckError:
// main/circular_constant.gno:3:7: initialization cycle for A; main/circular_constant.gno:3:7: 	A refers to B; main/circular_constant.gno:4:7: 	B refers to A
