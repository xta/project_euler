# Largest palindrome product

## A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

## Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindromic?(number)
  number_string = number.to_s
  length = number_string.size
  max = (length / 2 - 1) # 0 based index

  (0..max).all? do |index|
    number_string[index] == number_string[-(index+1)]
  end
end

three_digits = (100..999).to_a.reverse
three_digits_all = three_digits.dup

palindromes = []

while three_digits.any?
  check_num = three_digits.shift

  three_digits_all.each do |test_case|
    product = check_num * test_case
    status = is_palindromic?(product)
    palindromes.push(product) if status
  end
end

palindromes.max #=> 906609
