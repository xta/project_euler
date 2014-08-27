// Smallest multiple

// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

package main

import (
	"fmt"
)

func main() {

	floor := 2520
	divisors := make([]int, 0)
	ceiling := 1

	for i := 1; i <= 20; i++ {
		divisors = append(divisors, i)
	}

	for i, e := range divisors {
		double := e * 2

		if intInSlice(double, divisors) {
			divisors[i] = divisors[len(divisors)-1]
			divisors = divisors[:len(divisors)-1]
		} else {
			ceiling *= e
		}
	}

	for i := floor; i <= ceiling; i += floor {
		var check bool

		for _, e := range divisors {
			if i%e == 0 {
				check = true
			} else {
				check = false
				break
			}
		}

		if check == true {
			fmt.Println(i) // 232792560
			break
		}
	}
}

func intInSlice(x int, list []int) bool {
	for _, e := range list {
		if e == x {
			return true
		}
	}
	return false
}
