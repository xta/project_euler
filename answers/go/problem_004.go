// Largest palindrome product

// A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

// Find the largest palindrome made from the product of two 3-digit numbers.

package main

import (
	"fmt"
	"strconv"
)

func main() {

	largestPalindrome := 0
	threeDigits := make([]int, 0)

	// build all possible threeDigits
	for i := 100; i < 1000; i++ {
		threeDigits = append(threeDigits, i)
	}

	for i := 0; i < len(threeDigits); i++ {
		for j := 0; j < len(threeDigits); j++ {
			product := threeDigits[i] * threeDigits[j]

			if isPalindromic(product) {
				if product > largestPalindrome {
					largestPalindrome = product
				}
			}
		}
	}

	fmt.Println(largestPalindrome) // 906609
}

func isPalindromic(x int) (result bool) {
	xString := strconv.Itoa(x)
	xLength := len(xString)
	xHalf := xLength/2 - 1

	xCheck := make([]int, 0)
	for i := 0; i < (xHalf + 1); i++ {
		xCheck = append(xCheck, i)
	}

	result = true

	for _, e := range xCheck {
		left := string(xString[e])
		right := string(xString[len(xString)-(1+e)])

		if left != right {
			result = false
		}
	}

	return
}
