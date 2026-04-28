package main

type S [2]S

func main() {}

// TypeCheckError:
// main/recursive7a.gno:3:6: invalid recursive type: S refers to itself
