package main

type Int Int

func main() {}

// TypeCheckError:
// main/recursive8.gno:3:6: invalid recursive type: Int refers to itself
