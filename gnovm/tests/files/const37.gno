package main

import "time"

func main() {
	const v = time.UTC
}

// TypeCheckError:
// main/const37.gno:6:12: time.UTC (variable of type *time.Location) is not constant
