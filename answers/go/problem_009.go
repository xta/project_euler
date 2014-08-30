// Special Pythagorean triplet

// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

// a2 + b2 = c2
// For example, 32 + 42 = 9 + 16 = 25 = 52.

// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

package main

import (
	"fmt"
)

func main() {
	answer := new(triplet)

	for a := 1; a <= 1000; a++ {
		for b := (a + 1); b <= 1000; b++ {
			c := 1000 - b - a

			if b > c {
				break
			}

			t := triplet{a: a, b: b, c: c}

			if t.IsPythagorean() {
				answer = &t
			}
		}
	}

	fmt.Println(answer.Product())
}

type triplet struct {
	a, b, c int
}

func (t triplet) IsPythagorean() bool {
	return t.a*t.a+t.b*t.b == t.c*t.c
}

func (t triplet) Product() int {
	return t.a * t.b * t.c
}
