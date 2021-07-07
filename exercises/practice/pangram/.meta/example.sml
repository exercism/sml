fun isPangram s =
  let
    val counter = Array.tabulate (26, fn _ => 0)
    val chars = map Char.toLower (String.explode s)
    val aCode = ord #"a"

    fun updateCounter c =
      let
        val index = ord c - aCode
      in
        if index < 0
        then ()
        else Array.update (counter, index, (Array.sub (counter, index)) + 1)
      end
  in
    List.app updateCounter chars;
    Array.all (fn x => x > 0) counter
  end
