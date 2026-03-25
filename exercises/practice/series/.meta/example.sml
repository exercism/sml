fun slices (series: string, sliceLength: int): string list =
  let
    val len = String.size series
  in
    if len = 0 then raise Fail "series cannot be empty"
    else if sliceLength < 0 then raise Fail "slice length cannot be negative"
    else if sliceLength = 0 then raise Fail "slice length cannot be zero"
    else if sliceLength > len then raise Fail "slice length cannot be greater than series length"
    else List.tabulate (len - sliceLength + 1, fn i =>
      String.substring (series, i, sliceLength))
  end
