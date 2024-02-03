fun nucleotideCounts (strand: string): {a: int, c: int, g: int, t: int} =
  let
    fun recurse(a: int, c: int, g: int, t: int, nil) = {a = a, c = c, g = g, t = t}
      | recurse(a: int, c: int, g: int, t: int, hd :: tl) =
          case hd of
              #"A" => recurse(a + 1, c, g, t, tl)
            | #"C" => recurse(a, c + 1, g, t, tl)
            | #"G" => recurse(a, c, g + 1, t, tl)
            | #"T" => recurse(a, c, g, t + 1, tl)
            | _ => raise Fail "Invalid nucleotide in strand"
  in
    recurse (0, 0, 0, 0, explode strand)
  end
