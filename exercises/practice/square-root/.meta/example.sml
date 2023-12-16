(* We use Heron's method, with rounding to the nearest natural number.
 * https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Heron's_method
 * estimate = (guess + randicand / guess) / 2
 *          = (guess * guess + randicand) / (2 * guess)
 * To achieve rounding when using integer division,
 * we must increase the numerator by half the denominator.
 *)
fun squareRoot (radicand: int): int =
  let
    fun recurse guess =
      let
        val estimate = (guess * (guess + 1) + radicand) div (2 * guess)
      in
        if estimate = guess then estimate
        else recurse estimate
      end
  in
    recurse 1
  end
