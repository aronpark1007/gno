// https://github.com/gnolang/gno/issues/3727

package main

func () A()

func main() {}

// TypeCheckError:
// main/parse_err0.gno:5:6: method has no receiver
