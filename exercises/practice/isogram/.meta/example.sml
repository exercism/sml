val isIsogram: string -> bool =
  let
    val a = Char.ord #"a"

    (* We represent each letter by setting a different bit,
     * for example the letter c is encoded as ...00100 binary.
     *)
    fun letterValue (c: char): word =
      Word.<<(0wx1, Word.fromInt(Char.ord (Char.toLower c) - a))

    (* seen represents the set of letters that have been seen
     * so far. For example, if we have seen the letters d and c,
     * this is encoded as ...01100 binary.
     * If we find a letter in l that matches a letter already
     * seen, we return false.
     *)
    fun recurse (seen: word) (l: char list): bool =
      case l of
          nil => true
        | c :: rest =>
            let
              val seen' = Word.orb (seen, letterValue c)
            in
              seen' <> seen andalso recurse seen' rest
            end
  in
    recurse 0wx0 o List.filter Char.isAlpha o String.explode
  end
