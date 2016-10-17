exception InvalidOctal

fun octalToDecimal "" = raise InvalidOctal
  | octalToDecimal (s: string): int =
      let
        fun chrToInt c =
          case Int.fromString (Char.toString c) of
            NONE   => raise InvalidOctal
          | SOME n =>
              if n < 8
              then n
              else raise InvalidOctal
      in
        foldl (fn (c, acc) => acc * 8 + (chrToInt c)) 0 (String.explode s)
      end
