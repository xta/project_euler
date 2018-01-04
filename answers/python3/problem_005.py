from functools import reduce

# Smallest multiple

## 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

## What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

floor 		= 2520
divisors 	= list(range(1, 20+1))
remaining 	= list(filter(lambda x: x*2 not in divisors, divisors))
ceiling 	= reduce((lambda x, y: x * y), remaining)
smallest 	= 0

for check_number in range(floor, ceiling+1, floor):
	if all(check_number % i == 0 for i in divisors):
		smallest = check_number
		break

print(smallest)
#=> 232792560
