# Lattice paths

# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

def lattice_paths(width, height)
  factorial(width + height) / (factorial(width) * factorial(height))
end

def factorial(n)
  (1..n).reduce(:*)
end

puts lattice_paths(20, 20) # 137846528820
