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
	abs = []uint{0}
	println(abs.add())
}

// TypeCheckError:
// main/declaredType6b.gno:15:8: cannot use []uint{…} (value of type []uint) as nat value in assignment
