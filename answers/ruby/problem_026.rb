# Reciprocal cycles

# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

# 1/2 =   0.5
# 1/3 =   0.(3)
# 1/4 =   0.25
# 1/5 =   0.2
# 1/6 =   0.1(6)
# 1/7 =   0.(142857)
# 1/8 =   0.125
# 1/9 =   0.(1)
# 1/10    =   0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

def recurring_cycle_length integer
	return 0 if (integer % 2 == 0) || (integer % 5 == 0)

	length = 1
	while ((10**length) - 1) % integer != 0
		length += 1
	end
  	length
end

denominator = 0
max_recurring_cycle_length = 0

2.upto(999).each do |number|
	if recurring_cycle_length(number) > max_recurring_cycle_length
		denominator = number
		max_recurring_cycle_length = recurring_cycle_length number
	end
end

puts denominator 				#=> 983
puts max_recurring_cycle_length #=> 982
