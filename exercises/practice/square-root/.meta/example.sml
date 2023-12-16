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
