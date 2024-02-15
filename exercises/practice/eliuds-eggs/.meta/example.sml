fun eggCount (number: int) : int =
  let
    fun recurse n acc =
      if n = 0 then acc
      else if (n mod 2) = 0 then recurse (n div 2) (acc)
      else recurse (n div 2) (acc + 1)
  in
    recurse number 0
  end
