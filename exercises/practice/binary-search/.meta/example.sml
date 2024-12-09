fun find (haystack: int array, needle: int): int =
  let
    fun recurse (low: int, high: int): int =
      if low >= high then raise Fail "value not in array"
      else
        let
          val middle = (low + high) div 2
          val element = Array.sub (haystack, middle)
        in
          if needle < element then recurse (low, middle)
          else if needle > element then recurse (middle + 1, high)
          else middle
        end
  in
    recurse (0, Array.length haystack)
  end
