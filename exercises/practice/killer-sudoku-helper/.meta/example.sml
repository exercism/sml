fun combinations {sum, size, exclude} =
  let
    val exclusions = foldl (fn (d, m) => Word.orb (m, Word.<< (0w1, Word.fromInt d))) 0w0 exclude

    fun excluded d = Word.andb (exclusions, Word.<< (0w1, Word.fromInt d)) <> 0w0

    fun search (hi, 1, target, acc) =
          if target > hi orelse excluded target then []
          else [target :: acc]
      | search (hi, remaining, target, acc) =
          let
            (* Without hi, total will be at most (hi - remaining) + ... + (hi - 1)  *)
            val omit =
              if hi <= remaining orelse 2 * target > remaining * (2 * hi - remaining - 1) then []
              else search (hi - 1, remaining, target, acc)

            (* With hi, total will be at least [1 + ... + (remaining - 1)] + hi *)
            val pick =
              if excluded hi orelse 2 * (target - hi) < (remaining - 1) * remaining then []
              else search (hi - 1, remaining - 1, target - hi, hi :: acc)
          in
            pick @ omit
          end
  in
    if size = 0 then (if sum = 0 then [[]] else [])
    else if size > 9 orelse sum < 1 then []
    else search (9, size, sum, [])
  end
