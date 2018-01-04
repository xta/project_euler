import math

# Largest prime factor

## The prime factors of 13195 are 5, 7, 13 and 29.

## What is the largest prime factor of the number 600851475143 ?

def is_prime(a):
    return all(a % i for i in range(2, a))

target 			= 600_851_475_143
ceiling 		= int(math.sqrt(target))
factors 		= list(filter(lambda x: target % x == 0, range(1, ceiling+1)))
primes 			= list(filter(lambda x: is_prime(x), factors))
largest_prime 	= max(primes)

print(largest_prime)
#=> 6857
