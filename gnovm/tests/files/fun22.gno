package main

import "time"

func main() {
	time.Date()
}

// TypeCheckError:
// main/fun22.gno:6:12: not enough arguments in call to time.Date
// 	have ()
// 	want (int, time.Month, int, int, int, int, int, *time.Location)
