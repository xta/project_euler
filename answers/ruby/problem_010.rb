# Summation of primes

## The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

## Find the sum of all the primes below two million.

require "prime"

ceiling = 2_000_000
primes = []

Prime.each(ceiling) do |prime| # must use Prime#each instead of map
  primes << prime
end

sum = primes.reduce(:+)

sum #=> 142913828922
