// Largest palindrome product

// A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

// Find the largest palindrome made from the product of two 3-digit numbers.

import scala.collection.mutable.ListBuffer

// functions

def intToList(number: Int): List[Int] = {
  val numberString = number.toString
  val length = numberString.length

  var list = ListBuffer[Int]()
  var i = 0
  do {
    val digit = Integer.parseInt( numberString.substring(i, i+1) )
    list += digit

    i += 1
  } while (i < length)

  list.toList
}

def isPalindrome(number: Int): Boolean = {
  val regularList = intToList(number)
  val reverseList = regularList.reverse

  regularList == reverseList
}

// find largest palindrome

var largestPalindrome = 0
val numbers = (100 to 999)

for (i <- numbers) {
  for (j <- numbers) {
    val product = i*j

    if (isPalindrome(product)) {
      if (product > largestPalindrome) {
        largestPalindrome = product
      }
    }
  }
}

println(largestPalindrome) //=> 906609
