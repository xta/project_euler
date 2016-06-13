# Amicable numbers

# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

def divisors(number)
  1.upto(number).select { |i| (number % i == 0) && (number != i) }
end

def sum(number)
  divisors(number).reduce(0, :+)
end

sums = {}

1.upto(10_000).each do |i|
  sums[i] = sum(i)
end

amicable = []

sums.each do |key, value|
  key_sum = sums[key]
  result_sum = sums[key_sum]

  if key == result_sum && key != key_sum
    amicable << key
  end
end

p amicable.reduce(0, :+) # 31_626
