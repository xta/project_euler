/*
Multiples of 3 and 5

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*/

var max = 1000;
var multiples = [];
var sum = 0;

for (var i = 1; i < max; i++) {
  if((i%3===0) || (i%5===0)) {
    multiples.push(i);
  }
}

for (i = 0; i < multiples.length; i++) {
  sum += multiples[i];
}

console.log(sum); // 233168
