local
  val identity = fn x => x
  fun range n = List.tabulate (n, identity)
  fun square n = n * n
  val sum = foldl (op +) 0
  fun inc n = n + 1
in
  val squareOfSum = square o sum o range o inc
  fun sumOfSquares n = sum (map square ((range o inc) n))
  fun differenceOfSquares n = squareOfSum n - sumOfSquares n 
end
