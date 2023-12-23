(* For every Pythagorean triplet with total a + b + c = n,
 * a² + b² = c²
 * <=> a² + b² = (n - a - b)², substituting c
 * <=> 0 = n² - 2*n*a - 2*n*b + 2*a*b
 * <=> (2*n - 2*a) b = (n² - 2*n*a)
 * <=> $b=\frac{n*(n - 2*a)}{2*(n-a)}$
 *
 * The denominator is never 0, as perimeter exceeds a side length.
 *)
fun tripletsWithSum (n: int): (int * int * int) list =
  let
    fun recurse (a: int): (int * int * int) list =
      let
        val numerator = n * (n - 2 * a)
        val denominator = 2 * (n - a)
        val b = numerator div denominator
      in
        if b <= a then nil
        else if numerator mod denominator <> 0 then recurse (a + 1)
        else (a, b, n - a - b) :: recurse (a + 1)
      end
  in
    if n < 2 then nil
    else recurse 1
  end
