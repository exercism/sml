fun rows (input: string): string list =
  let
    fun spaces n = List.tabulate (n, fn _ => #" ")

    fun index c = ord c - ord #"A"

    fun halfRow numcols c = spaces (numcols - index c - 1) @ [c] @ spaces (index c)

    fun mkRow numcols c =
      let
        val half = halfRow numcols c
      in
        implode (half @ tl (rev half))
      end

    fun prevLetter c = chr (ord c - 1)

    val c = valOf (Char.fromString input)
    val numcols = index c + 1

    fun mkRows 0 _ acc = acc @ tl (rev acc)
      | mkRows i c acc = mkRows (i - 1) (prevLetter c) (mkRow numcols c :: acc)
  in
    mkRows numcols c []
  end
