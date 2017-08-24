exception NotAPositiveInteger

datatype classification = Abundant | Deficient | Perfect

fun sigma n =
  let
    fun loop i =
      if i * i > n
      then 0
      else if n mod i <> 0
           then loop (i + 1)
           else if n div i = i
                then i + loop (i + 1)
                else i + (n div i) + loop (i + 1)
  in
    loop 1
  end

fun classify n =
  if n < 1
  then raise NotAPositiveInteger
  else
    case Int.compare (sigma n, 2 * n) of
      GREATER => Abundant
    | LESS    => Deficient
    | _       => Perfect
