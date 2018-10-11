fun distance (strand1: string, strand2: string): int option =
  SOME (ListPair.foldlEq
          (fn (a, b, count) => if a = b then count else count+1) 0
          (explode strand1, explode strand2))
  handle UnequalLengths => NONE
