(* a*a + b*b = c*c, a + b + c = n
 * a*a + b*b = (n - a - b) * (n - a - b)
 * 0 = n*n - 2*n*a - 2*n*b + 2*a*b
 * (2*n - 2*a) b = (n*n - 2*n*a)
 *)
fun tripletsWithSum (n: int): int list list =
  let
    fun recurse (a: int): int list list =
      let
        val numerator = n * (n - 2 * a)
        val denominator = 2 * (n - a)
        val b = numerator div denominator
      in
        if b <= a then nil
        else if numerator mod denominator <> 0 then recurse (a + 1)
        else [a, b, n - a - b] :: recurse (a + 1)
      end
  in
    if n < 2 then nil
    else recurse 1
  end
