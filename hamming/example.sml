exception NonEqualLengthStringsFound;
fun hamming (s1, s2) = let
    val chars1 = explode s1
    val chars2 = explode s2
    fun hamming' ([],[]) acc = acc
      | hamming' ((x::xs),(y::ys)) acc = hamming' (xs, ys) (acc + (if x = y then 0 else 1))
in
    if (length chars1) <> (length chars2) then raise NonEqualLengthStringsFound
    else hamming' (chars1, chars2) 0
end
