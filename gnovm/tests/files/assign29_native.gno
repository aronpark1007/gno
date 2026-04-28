package main

import (
	"time"
)

func main() {
	time.Now = func() time.Time {
		return time.Time{}
	}
}

// TypeCheckError:
// main/assign29_native.gno:8:2: use of package time not in selector; main/assign29_native.gno:8:2: cannot assign to time.Now (neither addressable nor a map index expression)
