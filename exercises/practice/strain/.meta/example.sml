fun keep f nil = nil
  | keep f (first :: rest) =
    let
      val suffix = keep f rest
    in
      if f first then first :: suffix
      else suffix
    end

fun discard f nil = nil
  | discard f (first :: rest) =
    let
      val suffix = discard f rest
    in
      if f first then suffix
      else first :: suffix
    end
