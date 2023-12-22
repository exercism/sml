local
  fun maximum (x: int, y: int): int =
    if x > y then x
    else y

  fun isPalindrome (n: int): bool =
    let
      val s = Int.toString n
    in
      s = String.implode (List.rev (String.explode s))
    end

  (* Returns the first non-none return value of f,
   * where f is called with start, then start + step, ...,
   * up to but not including stop.
   *)
  fun firstResult (start: int, stop: int, step: int) (f: int -> 'a option): 'a option =
    if start = stop then NONE
    else case f(start) of
        result as (SOME _) => result
      | NONE => firstResult (start + step, stop, step) f

  (* Returns a list of factor pairs of n, where
   * each factor is at least min, and at most max.
   *)
  fun factorPairs (min: int, max: int) (n: int): {value: int, factors: (int * int) list} option =
    let
      (* Preconditions: first >= min, and n/first <= max *)
      fun recurse (first: int): (int * int) list =
        let
          val second = n div first
        in
          if second < first then nil
          else if n mod first <> 0 then recurse (first + 1)
          else (first, second) :: (recurse (first + 1))
        end
      val pairs: (int * int) list = recurse (maximum(min, (n + max - 1) div max))
    in
      case pairs of
          nil => NONE
        | r as ((first, second) :: _) => SOME {value = first * second, factors = r}
    end

  fun palindromeFactorPairs (min: int, max: int) (n: int): {value: int, factors: (int * int) list} option =
    if isPalindrome n then factorPairs (min, max) n
    else NONE
in
  fun smallest (min: int, max: int): {value: int, factors: (int * int) list} option =
    if min > max then raise Fail "min must be <= max"
    else firstResult (min * min, max * max + 1, 1) (palindromeFactorPairs (min, max))

  fun largest (min: int, max: int): {value: int, factors: (int * int) list} option =
    if min > max then raise Fail "min must be <= max"
    else firstResult (max * max, min * min - 1, ~1) (palindromeFactorPairs (min, max))
end
