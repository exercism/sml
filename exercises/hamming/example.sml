exception NonEqualLengthStringsFound

fun distance (strand1: string, strand2: string): int =
  let
    val chars1 = explode strand1
    val chars2 = explode strand2
    fun distance' ([], []) acc = acc
      | distance' ((x::xs), (y::ys)) acc =
          distance' (xs, ys) (acc + (if x = y then 0 else 1))
  in
    if (length chars1) <> (length chars2) then
      raise NonEqualLengthStringsFound
    else distance' (chars1, chars2) 0
  end
