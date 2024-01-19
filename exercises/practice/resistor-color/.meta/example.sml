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
