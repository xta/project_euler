# Number letter counts

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

Words = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety'
}

TensDigitWord = {
  2 => 'twenty',
  3 => 'thirty',
  4 => 'forty',
  5 => 'fifty',
  6 => 'sixty',
  7 => 'seventy',
  8 => 'eighty',
  9 => 'ninety'
}

# (1..1_000).each do |number|
# end

def number_to_word(number)
  return "one thousand" if number == 1000

  word = ""
  number_string = number.to_s

  if number_string.size == 1
    return Words[number]
  end

  if number_string.size == 2
    if Words.keys.include?(number)
      return Words[number]
    else
      word += TensDigitWord[number_string[0].to_i]
      word += '-'
      word += Words[number_string[1].to_i]
    end
  end

  if number_string.size == 3
    word += Words[ number_string[0].to_i ]
    word += ' hundred'

    last_two_digits = number_string[1..2].to_i

    if last_two_digits > 0
      word += ' and '

      # similar logic as size 2 number
      if Words.keys.include?(last_two_digits)
        word += Words[last_two_digits]
      else
        word += TensDigitWord[number_string[1].to_i]
        word += '-'
        word += Words[number_string[2].to_i]
      end
    end
  end

  word
end

def count_letters(word)
  word.delete(' ').delete('-').size
end

total_letters_count = (1..1000).inject(0) do |sum, number|
  word = number_to_word(number)
  puts "#{word} (#{count_letters(word)})"
  sum += count_letters(word)
end

puts total_letters_count # 21124
