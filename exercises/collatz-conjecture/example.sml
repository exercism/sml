exception NegativeInteger

fun steps number =
  let
    fun odd n = n mod 2 = 1

    fun steps' stepCount n =
      if n = 1
      then stepCount
      else if odd n
           then steps' (stepCount + 1) (3 * n + 1)
           else steps' (stepCount + 1) (n div 2)
  in
    if number > 0
    then steps' 0 number
    else raise NegativeInteger
  end
