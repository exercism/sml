fun rebase inBase digits outBase = let
  fun fromBase base = let
    fun f (x, NONE  ) = NONE
      | f (x, SOME n) =
        if x >= 0 andalso x < base then SOME(n * base + x)
        else NONE
  in
    foldl f (SOME 0)
  end

  fun toBase base = let
    infix divMod
    fun a divMod b = (a div b, a mod b)

    fun swap (a, b) = (b, a)

    fun unfold f b =
      case f b of
        SOME(a, b') => a :: unfold f b'
      | NONE        => []

    fun f 0 = NONE
      | f x = SOME (swap (x divMod base))
  in
    rev o (unfold f)
  end
in
  if inBase < 2 orelse outBase < 2 then NONE
  else case fromBase inBase digits of
    SOME v => SOME (toBase outBase v)
  | NONE   => NONE
end