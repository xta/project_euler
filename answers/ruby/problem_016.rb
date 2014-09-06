# Power digit sum

# 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 21000?

digits = 2**1000
puts digits.to_s.chars.inject(0) {|sum, number| sum+=number.to_i; sum }
