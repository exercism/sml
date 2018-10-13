fun even n = n mod 2 = 0

fun collatz' i n =
  if n = 1 then i else
  collatz' (i + 1) (if even n
                    then n div 2
                    else 3 * n + 1)

fun collatz n =
  if n < 1 then NONE else SOME (collatz' 0 n)
