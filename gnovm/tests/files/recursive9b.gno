package main

type Int = func() Int

func main() {}

// TypeCheckError:
// main/recursive9b.gno:3:6: invalid recursive type: Int refers to itself
