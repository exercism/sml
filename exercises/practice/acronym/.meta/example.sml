fun abbreviate (phrase: string): string =
  let
    fun is_delim c = Char.contains " -_," c
    val tokens = String.tokens is_delim phrase
    fun first_char_up word = Char.toUpper (String.sub (word, 0))
  in
    String.implode (List.map first_char_up tokens)
  end;
