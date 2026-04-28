package main

import "chain"

func main() {
	v := chain.Coin{}
	const c = v.Denom
}

// TypeCheckError:
// main/const38.gno:7:12: v.Denom (variable of type string) is not constant
