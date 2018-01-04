# Largest palindrome product

## A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

## Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome(string):
	length = len(string)
	max = int((length / 2 - 1))
	return all(string[i] == string[-(i+1)] for i in range(0, max+1))

three_digits 		= list(range(100, 999+1))
three_digits_all 	= three_digits[:]
max_palindrome 		= 0

while len(three_digits) > 0:
	check_number = three_digits.pop()

	for test_number in three_digits_all:
		product = check_number * test_number
		if is_palindrome(str(product)) and product > max_palindrome:
			max_palindrome = product

print(max_palindrome)
#=> 906609
