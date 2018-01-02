from functools import reduce

# Multiples of 3 and 5

## If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

## Find the sum of all the multiples of 3 or 5 below 1000.

threes_set = set(range(0, 1000, 3))
fives_set = set(range(0, 1000, 5))

multiples = threes_set | fives_set
sum = reduce((lambda x, y: x + y), multiples)

print(sum)
#=> 233168
