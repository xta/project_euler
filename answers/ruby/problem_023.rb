# Non-abundant sums

# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require "prime"

LIMIT = 28_123
SMALLEST_ABUNDANT = 12

def proper_divisors integer
    return [] if integer == 1

    prime_factors = Prime.prime_division(integer).flat_map { |prime, frequency| [prime] * frequency }
    (1...prime_factors.size).each_with_object([1]) do |number, result|
        prime_factors.combination(number).map { |combo| result << combo.inject(:*) }
    end.flatten.uniq
end

def is_perfect_number? integer_to_check
    proper_divisors(integer_to_check).inject(:+) == integer_to_check
end

def is_abundant_number? integer_to_check
    proper_divisors(integer_to_check).inject(:+) > integer_to_check
end

def is_deficient_number? integer_to_check
    proper_divisors(integer_to_check).inject(:+) < integer_to_check
end

ABUNDANTS = (SMALLEST_ABUNDANT..LIMIT).select { |integer| is_abundant_number?(integer) }

def is_sum_of_two_abundant_numbers? integer_to_check
    return false if integer_to_check < 24
    return true if integer_to_check > LIMIT

    relevant_abundants = ABUNDANTS.select { |abundant| abundant < integer_to_check}

    relevant_abundants.each do |relevant|
        difference = integer_to_check - relevant
        return true if relevant_abundants.include?(difference)
    end

    false
end

total = (1..LIMIT).inject(0) do |sum, integer|
    p "Checking #{integer}/#{LIMIT}..."
    if !is_sum_of_two_abundant_numbers?(integer)
        sum += integer
    else
        sum
    end
end

puts total #=> 4179871
