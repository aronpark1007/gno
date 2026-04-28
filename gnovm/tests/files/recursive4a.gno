package main

type time time.Duration

func main() {
}

// TypeCheckError:
// main/recursive4a.gno:3:6: invalid recursive type: time refers to itself
