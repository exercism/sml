local
  fun recurse (exponent: int) (base: int) (multiplier: int): int =
    if exponent = 0 then multiplier
    else recurse (exponent div 2) (base * base) (if exponent mod 2 = 0 then multiplier else base * multiplier)
in
  fun power (exponent: int) (base: int): int =
    recurse exponent base 1
end

fun isArmstrongNumber (number: int): bool =
  let
    val sum: int list -> int =
      foldl op+ 0

    fun recurse (digits: int list) (n: int): bool =
      if n = 0 then
        let
          val count = length digits
        in
          number = sum (map (power count) digits)
        end
      else
        recurse ((n mod 10) :: digits) (n div 10)
  in
    recurse [] number
  end
