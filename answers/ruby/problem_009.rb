# Special Pythagorean triplet

## A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

## a2 + b2 = c2
## For example, 32 + 42 = 9 + 16 = 25 = 52.

## There exists exactly one Pythagorean triplet for which a + b + c = 1000.
## Find the product abc.

triplets = []

(1..1000).each do |a|

  ((a+1)..1000).each do |b|
    c = 1000-b-a

    next if b > c

    triplets << [a,b,c]
  end
end

triple = triplets.detect do |triplet|
  triplet[0]**2 + triplet[1]**2 == triplet[2]**2
end

triple #=> [200, 375, 425]
answer = triple.reduce(:*)

answer #=> 31875000
