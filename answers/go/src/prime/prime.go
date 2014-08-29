package prime

import "math/big"

func Check(x int64) (result bool) {
	difficulty := 64 // 64 is arbitrary. a bigger value results in more accuracy but takes longer
	i := big.NewInt(x)
	return i.ProbablyPrime(difficulty)
}
