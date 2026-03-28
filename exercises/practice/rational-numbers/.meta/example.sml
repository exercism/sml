fun reduce (n: int, d: int): int * int =
  let
    fun gcd (a, 0) = a
      | gcd (a, b) = gcd (b, a mod b)

    val g = gcd (Int.abs n, Int.abs d)
    val (n, d) = (n div g, d div g)
  in
    if d < 0 then (~n, ~d) else (n, d)
  end

fun add ((a: int, b: int), (c: int, d: int)): int * int =
  reduce (d * a + b * c, b * d)

fun sub ((a: int, b: int), (c: int, d: int)): int * int =
  reduce (d * a - b * c, b * d)

fun mul ((a: int, b: int), (c: int, d: int)): int * int =
  reduce (a * c, b * d)

fun divide ((a: int, b: int), (c: int, d: int)): int * int =
  reduce (a * d, b * c)

fun abs (n: int, d: int): int * int =
  reduce (Int.abs n, Int.abs d)

fun exprational (r: int * int, n: int): int * int =
  let
    fun power (base, exp) =
      let
        fun recur (coefficient, _, 0) = coefficient
          | recur (coefficient, b, e) =
              if e mod 2 = 1 then recur (coefficient * b, b * b, e div 2)
              else recur (coefficient, b * b, e div 2)
      in
        recur (1, base, exp)
      end

    val (a, b) = reduce (if n >= 0 then r else (#2 r, #1 r))
    val n = Int.abs n
  in
    (power (a, n), power (b, n))
  end

fun expreal (x: int, (n: int, d: int)): real =
  Math.exp (Real.fromInt n / Real.fromInt d * Math.ln (Real.fromInt x))
