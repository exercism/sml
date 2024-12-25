val unitNames = Array.fromList [
  "zero",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten",
  "eleven",
  "twelve",
  "thirteen",
  "fourteen",
  "fifteen",
  "sixteen",
  "seventeen",
  "eighteen",
  "nineteen"
]

val decadeNames = Array.fromList [
  "zero",
  "ten",
  "twenty",
  "thirty",
  "forty",
  "fifty",
  "sixty",
  "seventy",
  "eighty",
  "ninety"
]

fun words (number: int): string list =
  if number >= 1000000000
  then (words (number div 1000000000)) @ ("billion" :: (words (number mod 1000000000)))
  else if number >= 1000000
  then (words (number div 1000000)) @ ("million" :: (words (number mod 1000000)))
  else if number >= 1000
  then (words (number div 1000)) @ ("thousand" :: (words (number mod 1000)))
  else if number >= 100
  then (words (number div 100)) @ ("hundred" :: (words (number mod 100)))
  else if number = 0
  then []
  else if number < 20
  then [Array.sub (unitNames, number)]
  else if (number mod 10) = 0
  then [Array.sub (decadeNames, number div 10)]
  else [Array.sub (decadeNames, number div 10) ^ "-" ^ Array.sub (unitNames, number mod 10)]

fun say (number: int): string =
  if (number < 0) orelse (number > 999999999999)
  then raise Fail "input out of range"
  else if number = 0
  then "zero"
  else String.concatWith " " (words number)
