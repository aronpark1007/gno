package main

type Int = *Int

func main() {}

// TypeCheckError:
// main/recursive9a.gno:3:6: invalid recursive type: Int refers to itself
