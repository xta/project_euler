// Multiples of 3 and 5

// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.

var multiples = scala.collection.mutable.Set[Int]()

def modifyMultiplesBy(step: Int) = {
  val max = 999
  (step to max by step) foreach ( e => multiples += e )
}

modifyMultiplesBy(3)
modifyMultiplesBy(5)

val sum = multiples.reduceLeft(_ + _)

println(sum) //=> 233168
