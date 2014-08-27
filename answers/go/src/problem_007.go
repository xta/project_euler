// 10001st prime

// By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

// What is the 10 001st prime number?

package main

import (
	"fmt"
	"math/big"
)

func main() {

	const maxCount = 10001
	primes := make([]int, 0)
	i := 2

	for {
		if len(primes) >= maxCount {
			break
		}

		if checkPrime(int64(i)) {
			primes = append(primes, i)
		}

		i++
	}

	largestPrime := primes[len(primes)-1]

	fmt.Println(largestPrime) // 104743
}

func checkPrime(x int64) (result bool) {
	difficulty := 64 // 64 is arbitrary. a bigger value results in more accuracy but takes longer
	i := big.NewInt(x)
	return i.ProbablyPrime(difficulty)
}
