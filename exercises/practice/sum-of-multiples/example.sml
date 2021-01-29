fun sum (factors: int list, limit: int): int = let
  val sum' = foldl (op +) 0
  val numbers = List.tabulate(limit - 1, fn x => x + 1) (* generate list from [1, limit - 1] *)
  fun any f [] = false
    | any f (x::xs) = f x orelse any f xs
in
  sum' (List.filter (fn x => (any (fn f => x mod f = 0) factors)) numbers)
end