# Longest Collatz sequence

# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

def collatz(number, sequence = [])
  sequence.push(number)

  if number == 1
    return sequence
  end

  if number.even?
    collatz(number/2, sequence)
  else
    collatz(3*number+1, sequence)
  end
end

largest_collatz_number = 0
largest_collatz_size = 0

(1...1_000_000).each do |number|
  size = collatz(number).size

  if size > largest_collatz_size
    largest_collatz_size    = size
    largest_collatz_number  = number
  end
end

puts largest_collatz_number # 837799
