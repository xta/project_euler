# Smallest multiple

## 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

## What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

floor = 2520

divisors = (1..20).to_a
remaining = divisors.reject { |n| divisors.include?(n*2) }

ceiling = remaining.inject(:*) # 670_442_572_800

smallest = (floor..ceiling).step(floor).detect do |check_num|
  remaining.all?{ |n| check_num % n == 0 }
end

smallest #=> 232792560
