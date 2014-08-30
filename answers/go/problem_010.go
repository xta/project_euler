// Summation of primes

// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

// Find the sum of all the primes below two million.

package main

import (
	"fmt"
	"prime"
)

func main() {

	var sum int64 = 0
	var i int64 = 2

	for ; i < 2000000; i++ {

		if i > 2 && i%2 == 0 {
			continue
		} else if i > 3 && i%3 == 0 {
			continue
		} else if i > 5 && i%5 == 0 {
			continue
		}

		if prime.Check(i) {
			sum += i
		}
	}

	fmt.Println(sum) // 142913828922
}
