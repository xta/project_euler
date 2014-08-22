# Multiples of 3 and 5

## If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

## Find the sum of all the multiples of 3 or 5 below 1000.

max = 1_000
threes = (3..max).step(3).to_a
fives = (5...max).step(5).to_a

numbers = (threes + fives).uniq
sum = numbers.reduce 0, :+

sum #=> 233168
