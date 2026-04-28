package main

import (
	// pkg name is actually quux, should require an identifier
	"filetests/extern/bar"
)

func main() {
	println("Hello", bar.Quux()) // bar should not be a known symbol.
}

// TypeCheckError:
// main/pkgname1.gno:9:19: undefined: bar; main/pkgname1.gno:5:2: "filetests/extern/bar" imported as quux and not used
