// Smallest multiple

// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

val numbersOverTwenty = (20 to Int.MaxValue)
val evenlyDivisables = numbersOverTwenty.find(
    n => (2 to 21).forall(n % _ == 0)
  )
val evenlyDivisable = evenlyDivisables.get

println(evenlyDivisable) //=> 232792560
