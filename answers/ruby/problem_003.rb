# Largest prime factor

## The prime factors of 13195 are 5, 7, 13 and 29.

## What is the largest prime factor of the number 600851475143 ?

require 'prime'

target = 600_851_475_143
ceiling = Math.sqrt(target).floor

factors = (1..ceiling).select do |n|
  target % n == 0
end

primes = factors.select { |n| Prime.prime?(n) }
largest_prime = primes.max

largest_prime #=> 6857
