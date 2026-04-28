package main

type (
	c    uint
	word c
	nat  []word
)

func (n nat) add() bool {
	return true
}

func main() {
	var abs nat
	abs = []c{0}
	println(abs.add())
}

// TypeCheckError:
// main/declaredType6.gno:15:8: cannot use []c{…} (value of type []c) as nat value in assignment
