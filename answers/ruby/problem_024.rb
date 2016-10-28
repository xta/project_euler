# Lexicographic permutations

# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

digits = %w(0 1 2 3 4 5 6 7 8 9)

permutations = digits.permutation.to_a

permutations.size
#=> 3_628_800

sorted = permutations.sort
# concat = sorted.map { |array| array.join("") }

millionth_position = 1_000_000-1

p sorted[millionth_position].join("") #=> "2783915460"
