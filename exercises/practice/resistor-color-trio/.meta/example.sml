val colors =
  ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

fun colorCode (color: string) =
  let
    fun recurse (l: string list, index: int): int =
      case l of
          nil => raise Fail "invalid color"
        | first :: rest =>
            if first = color then index
            else recurse (rest, index + 1)
  in
    recurse (colors, 0)
  end

fun label (colors: string list): string =
  let
    fun power (_, 0) = 1
      | power (base, exp) =
          let val half = power (base, exp div 2)
          in if exp mod 2 = 0 then half * half
             else half * half * base
          end

    val units = [(" gigaohms", 1000000000),
                 (" megaohms", 1000000),
                 (" kiloohms", 1000),
                 (" ohms", 1)]

    fun format _ [] = raise Fail "empty units"
      | format value ((name, divisor) :: rest) =
          if value >= divisor orelse null rest then
            let
              val whole = value div divisor
              val tenths = ((value mod divisor) * 10) div divisor
            in
              if tenths = 0 then
                (Int.toString whole) ^ name
              else
                (Int.toString whole) ^ "." ^ (Int.toString tenths) ^ name
            end
          else
            format value rest
  in
    case colors of
        first :: second :: third :: rest =>
          let
            val coefficient = 10 * (colorCode first) + (colorCode second)
            val exponent = colorCode third
          in
            format (coefficient * power (10, exponent)) units
          end
      | _ => raise Fail "insufficient colors"
  end
