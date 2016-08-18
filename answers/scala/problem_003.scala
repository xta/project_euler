// Largest prime factor

// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143 ?

def findFactor(divisor: BigInt, limit: BigInt): BigInt = {
  if (divisor == limit)
    // stop, the divisor is the largest. cannot increment any further
    limit
  else
    if (limit % divisor == 0)
      // the divisor is a factor, so update the limit to use the newly found factor
      findFactor(divisor, limit / divisor)
    else
      // increment & try again
      findFactor(divisor + 1, limit)
}

def largestFactor(b : BigInt) = {
  findFactor(BigInt(2), b)
}

val bigNumber = 600851475143L
val factor = largestFactor(bigNumber)
println(factor) //=> 6857
