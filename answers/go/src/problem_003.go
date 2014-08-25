// Largest prime factor

// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143 ?

package main

import (
	"fmt"
	"math"
	"math/big"
)

func main() {
	const target = 600851475143
	ceiling := int(math.Floor(math.Sqrt(target)))
	factors := make([]int, 0)
	primes := make([]int64, 0)

	for i := 1; i <= ceiling; i++ {
		if target%i == 0 {
			factors = append(factors, i)
		}
	}

	for i := 0; i < len(factors); i++ {
		checkNum := int64(factors[i])
		if checkPrime(checkNum) {
			primes = append(primes, checkNum)
		}
	}

	max := sliceMax(primes)

	fmt.Println(max) // 6857
}

func checkPrime(x int64) (result bool) {
	difficulty := 64 // 64 is arbitrary. a bigger value results in more accuracy but takes longer
	i := big.NewInt(x)
	return i.ProbablyPrime(difficulty)
}

func sliceMax(slice []int64) (max int64) {
	if len(slice) > 0 {
		max = slice[0]
	}

	for i := 1; i < len(slice); i++ {
		if slice[i] > max {
			max = slice[i]
		}
	}
	return
}
