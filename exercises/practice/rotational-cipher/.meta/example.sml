fun rotate (shiftKey: int): string -> string =
  let
    val A = ord #"A"
    val a = ord #"a"

    fun rotateChar (ch: char): char =
      if ch >= #"A" andalso ch <= #"Z" then chr((shiftKey - A + ord ch) mod 26 + A)
      else if ch >= #"a" andalso ch <= #"z" then chr((shiftKey - a + ord ch) mod 26 + a)
      else ch
  in
    String.map rotateChar
  end
