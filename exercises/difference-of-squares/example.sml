local
  fun square n = n * n
  fun sum n = n * (n + 1) div 2
in
  val squareOfSum = square o sum
  fun sumOfSquares n = n * (n + 1) * (2 * n + 1) div 6
  fun differenceOfSquares n = squareOfSum n - sumOfSquares n 
end
