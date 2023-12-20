val isIsogram: string -> bool =
  let
    val a = Char.ord #"a"
    fun letterValue (c: char): word =
      Word.<<(0wx1, Word.fromInt(Char.ord (Char.toLower c) - a))
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
