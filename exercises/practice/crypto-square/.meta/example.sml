fun ciphertext (plaintext: string): string =
  let
    fun tabulate (n: int, f: int -> char): string =
      String.implode (List.tabulate (n, f))

    val normalized =
      String.implode
        (List.filter (fn c => Char.isAlphaNum c)
          (List.map Char.toLower (String.explode plaintext)))
    val len = String.size normalized
  in
    if len = 0 then ""
    else
      let
        val cols = Real.ceil (Math.sqrt (Real.fromInt len))
        val rows = Real.ceil (Real.fromInt len / Real.fromInt cols)
        val padded = normalized ^ tabulate (rows * cols - len, fn _ => #" ")
        fun charAt (r: int, c: int): char = String.sub (padded, r * cols + c)
        fun column (c: int): string = tabulate (rows, fn r => charAt (r, c))
        val chunks = List.tabulate (cols, column)
      in
        String.concatWith " " chunks
      end
  end
